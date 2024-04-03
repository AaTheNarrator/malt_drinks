const fs = require('fs')
const path = require('path')
const db = require('../helpingFile/db')
const sql = require('./sql_request/slq_request')
const f = require('../helpingFile/helpingFunctions')
const createError = require('http-errors')

class Cart {

    async getCartById(req, res) {
        const id = req.body.customer_id
        const DB_answer = await db.query(sql.getCartById(id))

        res.json(DB_answer.rows)
    }

    async addToCart(req,res){
        const body = req.body
        const DB_answer = await db.query(sql.addToCart(body))

        res.json(DB_answer)
    }

    async deleteFromCart(req,res){
        const recipe_id = req.params.recipe_id 
        const customer_id = req.params.customer_id
        const amount = req.params.amount

        const DB_answer = await db.query(sql.deleteFromCart(recipe_id,customer_id,amount))
        res.json(DB_answer.rows)
    }

    async clearCartAfterOrder(req, res){
        const customer_id = req.params.id

        const DB_answer = await db.query(sql.clearCartByCustomerId(customer_id))
        res.json(DB_answer.rows)
    }

}

module.exports = new Cart()