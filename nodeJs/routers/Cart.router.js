const Router = require('express')
const router = new Router()
const controller = require('../controllers/Cart.controller')

router.post('/getCartById', controller.getCartById)
router.post('/addToCart',controller.addToCart)
router.delete('/deleteFromCart/:recipe_id/:customer_id/:amount',controller.deleteFromCart)
router.delete('/clearCart/:id',controller.clearCartAfterOrder)
router.post('/getLengthCart', controller.getCartLength)

module.exports = router