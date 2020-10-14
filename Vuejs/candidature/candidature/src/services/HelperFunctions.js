export default {

    average(scores) {
        if (!scores)
            return null
        if (scores.length == 0)
            return 0

        const sum = scores.reduce((a, b) => a + b, 0);
        return sum / scores.length
    }

}