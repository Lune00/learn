//Only for simulating quickly input data to the app (a cleaner way could be to push data on a server and use 
//Axios for example to make some proper API calls to fetch the data)
import data from "../../data.json";

const mydata = data

export default {
    getBrandList(){
        return mydata.map(e => e.date)
    },
    
}