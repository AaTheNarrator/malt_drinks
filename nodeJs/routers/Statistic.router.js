const Router = require('express')
const router = new Router()
const controller = require('../controllers/Statistics.controller')

router.post('/getStatistic', controller.getStatisticsById)

module.exports = router