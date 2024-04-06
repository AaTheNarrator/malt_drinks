const Router = require('express')
const router = new Router()
const controller = require('../controllers/Recipe.controller')

router.post('/getAllRecipe', controller.getRecipes)
router.put('/updateProductRecipe', controller.updateProductRecipe)
router.put('/updateRecipe', controller.updateRecipe)


module.exports = router