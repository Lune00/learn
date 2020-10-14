//Only for simulating quickly input data to the app (a cleaner way could be to push data on a server and use 
//Axios for example to make some proper API calls to fetch the data)


import data from '../../data.json'
import Mapper from '@/services/Mapper.js'
import HelperFunctions from '@/services/HelperFunctions.js'


//Init data, processed by the mapper to feed the front-end app
const mydata = Mapper.dataByBrand(data)

export default {

   
    getAveragedScoreByBrand() {

        const averagedScores = [];

        for (const brand in mydata) {
            const scores = mydata[brand].map((e) => parseFloat(e.score));
            averagedScores.push({
                name: brand,
                averagedScore: HelperFunctions.average(scores),
            });
        }
        return averagedScores;
    },

    getBrandNames() {
        return Object.keys(mydata);
    },

    getBrandData(brandName) {
        if (!Object.prototype.hasOwnProperty.call(mydata, brandName))
            return null
        return mydata[brandName]
    }

}