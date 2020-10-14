export default {

     //TO REFACTOR
    dataByBrand(rawData) {

        if (!rawData)
            return null

        const brandsData = {}

        rawData.forEach(element => {

            const rates = element.rates
            const date = element.date

            for (const brand in rates) {
                if (!Object.prototype.hasOwnProperty.call(brandsData, brand))
                    brandsData[brand] = []

                const brandData = { date: date, score: rates[brand] }
                brandsData[brand].push(brandData)
            }
        });

        return brandsData;
    },
}

