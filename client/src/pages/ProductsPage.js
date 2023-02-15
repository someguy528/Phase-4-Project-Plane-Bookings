import { useContext, useEffect, useState } from "react"
import ProductListing from "../components/ProductListing"
import ProductDetails from "./ProductDetails";
import ProductNew from "./ProductNew";
import ProductEdit from "./ProductEdit";
import { Switch, Route, useRouteMatch, Link } from "react-router-dom";
import { UserContext } from "../components/context/UserContext";

function ProductsPage({ cart, setCart, products, setProducts }) {
    const { user } = useContext(UserContext)
    const { url } = useRouteMatch()
    if (!products || user === null) { return (<h1>Loading...</h1>) }

    function handleProductAdd(newProduct) {
        const newProducts = [...products, newProduct].sort((a,b)=>a.id-b.id)
        setProducts(newProducts)
    }
    function handleProductEdit(editProduct) {
        const newProducts = products.map(p => {
            if (p.id === editProduct.id) {
                return editProduct
            }
            else return p
        }).sort((a,b)=>a.id - b.id)
        setProducts(newProducts)
        if (cart.cart_items.some(ci => ci.product.id === editProduct.id)) {
            let old_cart_item = cart.cart_items.find(ci => ci.product.id === editProduct.id)
            const newCart = {
                ...cart,
                price_total: (parseFloat(cart.price_total) + ((editProduct.price - old_cart_item.product.price) * old_cart_item.quantity)).toFixed(2),
                cart_items: cart.cart_items.map(ci => {
                    if (ci.product.id === editProduct.id) {
                        return { ...ci, product: editProduct }
                    }
                    else return ci
                })
            }
            setCart(newCart)
        }
    }
    function handleProductDelete(deletedProduct) {
        const newProducts = products.filter(p => p.id !== deletedProduct.id)
        setProducts(newProducts)
    }

    function handleCartItemAdd(newCartItem){
        if(cart.cart_items.some(ci=>ci.id === newCartItem.id)){
          const newCart = {
          ...cart,
          price_total: (parseFloat(cart.price_total) + (newCartItem.product.price * (newCartItem.quantity - cart.cart_items.find(ci=>ci.id === newCartItem.id).quantity))).toFixed(2), 
          cart_items: cart.cart_items.map(ci=>{
            if(ci.id === newCartItem.id){
              return newCartItem
            }else return ci
          })
        }
        setCart(newCart)
        }
        else{const newCart = {
          ...cart,
          price_total: (parseFloat(cart.price_total) + (newCartItem.product.price * newCartItem.quantity)).toFixed(2),
          cart_items: [...cart.cart_items , newCartItem ]
        }
        setCart(newCart)
      }
      }

    const allProducts = products.map(p => {
        return (<ProductListing product={p} key={p.id} />)
    })

    console.log(products)

    return (
        <section>

            <Switch>

                <Route exact path={url} >
                    <h2> Products </h2>
                    {user !== false ? <Link to={`${url}/new`} >Add Product</Link> : null}
                    {allProducts}
                </Route>
                <Route exact path={`${url}/new`} >
                    <ProductNew onProductAdd={handleProductAdd} />
                </Route>
                <Route exact path={`${url}/:productId/edit`} >
                    <ProductEdit products={products} onProductEdit={handleProductEdit} />
                </Route>
                <Route exact path={`${url}/:productId`} >
                    <ProductDetails products={products} cart={cart} onProductDelete={handleProductDelete} onCartItemAdd={handleCartItemAdd} />
                </Route>
            </Switch>

        </section>
    )
}
export default ProductsPage