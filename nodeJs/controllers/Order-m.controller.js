const fs = require('fs')
const path = require('path')
const db = require('../helpingFile/db')
const sql = require('./sql_request/slq_request')
const f = require('../helpingFile/helpingFunctions')
const createError = require('http-errors')

class Orders_m {

    async getOrdersById(req,res){
        const id = req.body.manufacturer_id
        console.log(id)
        const DB_answer = await db.query(sql.getOrdersForManufacturer(id))
        res.json(DB_answer.rows)
    }
    

}

module.exports = new Orders_m()