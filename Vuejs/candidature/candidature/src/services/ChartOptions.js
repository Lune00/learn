const backgroundColor = 'black'
const borderColor = '#ce42f5'
const yAxisTitle = 'Temps'
const xAxisTitle = 'Note'

export default {
    getChartDefaultOptions() {
        const options = {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    },
                    scaleLabel: {
                        display: true,
                        labelString: xAxisTitle
                    }
                }],
                xAxes: [{
                    scaleLabel: {
                        display: true,
                        labelString: yAxisTitle
                    }
                }]
            },
            layout: {
                padding: {
                    left: 100,
                    right: 100,
                    top: 0,
                    bottom: 0
                }
            },
            maintainAspectRatio: false,
            responsive: true

        }
        return options
    },
    getBackgroundColor() {
        return backgroundColor
    },
    getBorderColor() {
        return borderColor
    }

}