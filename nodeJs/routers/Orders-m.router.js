const Router = require('express')
const router = new Router()
const controller = require('../controllers/Order-m.controller')

router.post('/getOrdersManufacturer',controller.getOrdersById)

module.exports = router