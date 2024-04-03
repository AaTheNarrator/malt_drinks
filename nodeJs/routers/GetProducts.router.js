const Router = require('express')
const router = new Router()
const controller = require('../controllers/GetProducts.controller')

router.get('/getAllProducts', controller.getAllProducts)
router.get('/getAllInfoForProduct/:id',controller.getAllInfoAboutProducts)

module.exports = router