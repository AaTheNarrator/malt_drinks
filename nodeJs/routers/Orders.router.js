const Router = require('express')
const router = new Router()
const controller = require('../controllers/Orders.controller')

router.post('/addOrder', controller.addToOrder)
router.post('/getOrders',controller.getOrdersById)

module.exports = router