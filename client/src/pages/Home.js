import { useContext } from "react"
import { UserContext } from "../components/context/UserContext"

function Home(){
    const {user} = useContext(UserContext)
    return(
        <div>
        <h3>Hi {user ? user.username : "Guest" }, </h3>
          <h3>Welcome to my Phase 4 Project</h3>
          </div>
    )
}

export default Home