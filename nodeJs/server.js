const express = require('express')
const cors = require('cors')
const app = express()
const port = 8000
const cart = require("./routers/Cart.router")
const get_customer_info = require("./routers/GetCustomerInfo.router")
const get_product = require("./routers/GetProducts.router")
const manufacturer = require("./routers/Manufacturer.router")
const order_m = require("./routers/Orders-m.router")
const order = require("./routers/Orders.router")
const statistic = require("./routers/Statistic.router")
const warehouse = require("./routers/WareHouse.router")
const recipe = require("./routers/Recipe.router")

app.use(cors());
app.use(express.json());

app.use("/api", cart)
app.use("/api", get_customer_info)
app.use("/api", get_product)
app.use("/api", manufacturer)
app.use("/api", order_m)
app.use("/api", order)
app.use("/api", statistic)
app.use("/api", warehouse)
app.use("/api", recipe)

app.listen(port, () => {
  console.log("Server was started")
})

module.exports = app;