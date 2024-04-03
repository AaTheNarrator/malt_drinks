const Router = require('express')
const router = new Router()
const controller = require('../controllers/CustomerInfo.controller')

router.post('/getLoginCustomer', controller.getIdCustomer)

module.exports = router