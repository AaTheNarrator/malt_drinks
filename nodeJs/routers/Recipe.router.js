const Router = require('express')
const router = new Router()
const controller = require('../controllers/Recipe.controller')

router.post('/getAllRecipe', controller.getRecipes)


module.exports = router