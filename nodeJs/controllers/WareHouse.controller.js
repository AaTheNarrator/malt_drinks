const fs = require('fs')
const path = require('path')
const db = require('../helpingFile/db')
const sql = require('./sql_request/slq_request')
const f = require('../helpingFile/helpingFunctions')
const createError = require('http-errors')

class WareHouse {

    async getProductFromWareHouse(req, res) {
        const info = req.body.manufacturer_id
        
        const DB_answer = await db.query(sql.getProductsFromWareHouse(info))
        res.json(DB_answer.rows)
    }

    async updateWareHouse(req,res){
        const data = req.body

        const DB_answer = await db.query(sql.updateWareHouse(data))
        res.json(DB_answer.rows)
    }

    async deleteFromWareHouse(req,res){
        const data = req.body

        const DB_answer = await db.query(sql.deleteFromWareHouse(data))
        res.json(DB_answer.rows)
    }


    async getAllProducts(req,res){
        const DB_answer = await db.query('Select product_id, name from products order by product_id')
        res.json(DB_answer.rows)
    }

    async addProductToSklad(req,res){
        const data = req.body

        const DB_answer = await db.query(sql.addProductToSklad(data))
        res.json(DB_answer.rows)
    }
}

module.exports = new WareHouse()