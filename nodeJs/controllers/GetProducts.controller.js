const db = require('../helpingFile/db')
const sql = require('./sql_request/slq_request')
const f = require('../helpingFile/helpingFunctions')

class Products {

    async getAllProducts(req, res) {
        const answer = await db.query(sql.getAllProducts())
        for(let product of answer.rows){
            product.image = f.pathToImage(product.path)
        }
        res.json(answer.rows);
    }

    async getAllInfoAboutProducts(req,res){
        const id = req.params.id

        let answer = await db.query(sql.getInfoForProduct(id))
        const products = await db.query(sql.getProductForRecipe(id))
        answer.rows[0].products = products.rows
        answer.rows[0].image = f.pathToImage( answer.rows[0].path)

        res.json(answer.rows[0])
    }

}



module.exports = new Products()