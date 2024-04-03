const fs = require('fs')
const path = require('path')
const db = require('../helpingFile/db')
const sql = require('./sql_request/slq_request')
const f = require('../helpingFile/helpingFunctions')
const createError = require('http-errors')

class Orders {

    async addToOrder(req, res) {
        const customer_id = req.body.customer_id;
        const cart = await db.query(sql.getCartById(customer_id))

        let today = new Date();
    
        let total_amount = 0
        for(let i of cart.rows){
            total_amount += i.amount
        }

        const deliveryDate = new Date(today);
        deliveryDate.setDate(today.getDate() + total_amount + 3);

        const year = deliveryDate.getFullYear();
        const month = (deliveryDate.getMonth() + 1).toString().padStart(2, '0'); 
        const day = deliveryDate.getDate().toString().padStart(2, '0');
    
        const formattedDate = `${year}-${month}-${day}`;

        for(let i of cart.rows){
            i.delivery_date = formattedDate
        }
    
        let request = []
        for(let i of cart.rows){
            request.push( `(${customer_id},${i.amount},'${i.delivery_date}',${i.total_price},${i.recipe_id},'${today.getDate() + '-' + (today.getMonth() + 1) + '-' + today.getFullYear()}')`)
        }
        const DB_answer = await db.query(sql.addOrder(request.join(',')))

        res.json(DB_answer.rows);
    }

    async getOrdersById(req,res){
        const id = req.body.customer_id

        const DB_answer = await db.query(sql.getGroupOrdersForCustomer(id))

        for(let i of DB_answer.rows){
            let delivery_date = i.delivery_date.getDate() + '-' + (i.delivery_date.getMonth() + 1) + '-' + i.delivery_date.getFullYear()
            let answer = await db.query(sql.getOrdersByGroup(delivery_date))
            i.orders = answer.rows
        }

        DB_answer.rows.sort(function(a,b){
            return new Date(b.delivery_date) - new Date(a.delivery_date);
        });

        res.json(DB_answer.rows)
    }
    

}

module.exports = new Orders()