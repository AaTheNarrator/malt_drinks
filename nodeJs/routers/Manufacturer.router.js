const Router = require('express')
const router = new Router()
const controller = require('../controllers/Manufacturer.controller')

router.post('/getLoginManufacturer', controller.getIdManufacturer)

module.exports = router