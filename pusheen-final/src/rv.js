const request = require('superagent')

let baseUrl = 'https://techcase-cards-api.herokuapp.com'
let allCards = 'https://techcase-cards-api.herokuapp.com/api/v1/cards/'

function retrieveCards(cb) {
    request.get(allCards).end((err, res) => {
        if (err) return cb(err)
        else return cb(err, res.body)
    })
}

function applyCard(id, creditScore, cb) {
    let url = baseUrl + '/api/v1/cards/' + id + '/apply'
    request.post(url).send({creditScore: creditScore}).end((err, res) => {
        if (err) return cb(err)
        else return cb(err, res.body)
    })
}


function postUserData(userdata, cb) {
    let url = baseUrl + 'http://159.89.146.38/user'
    request.post(url).send(userdata).end((err, res) => {
        if (err) return cb(err)
        else return cb(err, res.body)
    })
}
const cards = require('./cards')

module.exports = {retrieveCards, applyCard, cards, postUserData}