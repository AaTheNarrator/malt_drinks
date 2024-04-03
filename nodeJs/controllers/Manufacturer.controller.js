const fs = require('fs')
const path = require('path')
const db = require('../helpingFile/db')
const sql = require('./sql_request/slq_request')
const f = require('../helpingFile/helpingFunctions')
const createError = require('http-errors')

class Manufacturer {

    async getIdManufacturer(req, res) {
        const info = req.body
        const DB_answer = await db.query(sql.getIdManufacturer(info.login,info.password))
        
        if(DB_answer.rows.length){
            res.json(DB_answer.rows[0])
        }
        else{
            res.status(404).json({ error: 'Пользователь не найден' });
        }
    }

}

module.exports = new Manufacturer()