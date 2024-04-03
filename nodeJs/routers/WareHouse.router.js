const Router = require('express')
const router = new Router()
const controller = require('../controllers/WareHouse.controller')

router.get('/getAllProductsForAdd',controller.getAllProducts)
router.post('/getProductsFromWareHouse', controller.getProductFromWareHouse)
router.post('/addProductToWareHouse',controller.addProductToSklad)
router.put('/updateSklad', controller.updateWareHouse)
router.delete('/deleteFromSklad',controller.deleteFromWareHouse)

module.exports = router