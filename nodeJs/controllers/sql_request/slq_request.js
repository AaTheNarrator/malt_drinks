const getAllProducts = () =>{
    return `
    select 
        max(r.recipe_id) as recipe_id,
        max(r.name) as product_name,
        max(m.namecompany) as manufacturer,
        round(sum(rp.amount_product * p.unitprice) + (sum(rp.amount_product * p.unitprice) / 5),-1)-1 as price,
        max(md.path) as path
    from recipes_products as rp
    left join recipes as r
        on rp.recipe_id = r.recipe_id
    left join products as p
        on rp.product_id = p.product_id
    left join manufacturers as m
        on r.manufacturer_id = m.manufacturer_id
    left join metadata as md
        on r.recipe_id = md.recipe_id
    group by r.recipe_id
    order by r.recipe_id`;
}

const getInfoForProduct = (id)=>{
    return `
    select 
	    max(r.recipe_id) as recipe_id,
        max(m.manufacturer_id) as manufacturer_id,
	    max(m.namecompany) as manufacturer,
	    max(r.name) as product_name,
	    max(r.description) as description,
	    round(sum(amount_product * unitprice) + (sum(amount_product * unitprice) / 5), -1) - 1 as price,
	    max(md.path) as path
    from recipes as r
    left join recipes_products as rp
    	on r.recipe_id = rp.recipe_id
    left join products as p
    	on rp.product_id = p.product_id
    left join metadata as md
    	on r.recipe_id = md.recipe_id
    left join manufacturers as m
    	on r.manufacturer_id = m.manufacturer_id
    where r.recipe_id = ${id}
    group by r.recipe_id`
}

const getProductForRecipe = (id) =>{
    return `
    select 
        p.product_id,
    	p.name,
    	concat(amount_product, ' ', type) as amount_product
    from recipes_products as rp
    left join products as p
    	on rp.product_id = p.product_id
    where rp.recipe_id = ${id}
    order by rp.amount_product desc`
}

const getCustomer = (login,password)=>{
    return `select customer_id 
    from customers
    where login = '${login}'
    and password = '${password}'`
}

const getIdManufacturer = (login,password)=>{
    return `select manufacturer_id 
    from manufacturers
    where login = '${login}'
    and password = '${password}'`
}

const addToCart = (data) =>{
    return `insert into cart values
        (${data.customer_id},${data.amount},${data.recipe_id})
        returning *`
}

const getCartById = (id) =>{
    return `
    select 
    	max(c.recipe_id) as recipe_id,
    	max(r.name) as recipe_name,
    	max(m.namecompany) as manufacturer,
    	max(c.amount) as amount,
    	max(c.amount) * (round(sum(rp.amount_product * p.unitprice) + (sum(rp.amount_product * p.unitprice) / 5),-1)-1) as total_price
    from cart as c
    left join recipes as r
    	on c.recipe_id = r.recipe_id
    left join manufacturers as m
    	on r.manufacturer_id = m.manufacturer_id
    left join recipes_products as rp
    	on rp.recipe_id = r.recipe_id
    left join products as p
    	on rp.product_id = p.product_id
    where c.customer_id = ${id}
    group by c.recipe_id`
}

const deleteFromCart = (recipe_id,customer_id,amount)=>{
    return ` delete from cart
    where recipe_id = ${recipe_id}
    and customer_id = ${customer_id}
    and amount = ${amount}
    returning *`
}

const clearCartByCustomerId = (id) =>{
    return `delete from cart
    where customer_id=${id}
    returning *`
}

const addOrder = (data) =>{
    return ` insert into orders 
    (customer_id,amount,delivery_date,price,recipe_id,order_date) values
    ${data}
    returning *`
}

const getGroupOrdersForCustomer = (id) =>{
    return `
    select delivery_date, sum(price) as total_price
    from orders
    where customer_id = ${id}
    group by delivery_date`
}

const getOrdersByGroup = (delivery_date) =>{
    return `
    select 
    	m.namecompany,
    	r.name,
    	o.amount,
    	o.price,
    	o.order_date
    from orders as o
    left join recipes as r
    	on o.recipe_id = r.recipe_id
    left join manufacturers as m
    	on r.manufacturer_id = m.manufacturer_id
    where delivery_date = '${delivery_date}'`
}

const getOrdersForManufacturer = (id) =>{
    return `
    select 
    	c.namecompany,
    	r.name,
    	o.amount,
    	o.price,
    	o.order_date,
    	o.delivery_date
    from orders as o
    left join recipes as r
    	on o.recipe_id = r.recipe_id
    left join manufacturers as m
    	on r.manufacturer_id = m.manufacturer_id
    left join customers as c
    	on o.customer_id = c.customer_id
    where r.manufacturer_id = ${id}
    order by o.delivery_date desc`
}

const getProductsFromWareHouse = (id) => {
    return `
    select s.product_id, p.name, s.amount 
    from sklad as s 
    left join products as p 
	    on s.product_id = p.product_id
    where manufacturer_id = ${id}
    order by p.name asc`
}

const updateWareHouse = (data) =>{
    return `
    update sklad
    set amount = ${data.amount}
    where manufacturer_id = ${data.manufacturer_id}
    and product_id = ${data.product_id}
    returning *`
}

const deleteFromWareHouse = (data) =>{
    return `
    delete from sklad
    where manufacturer_id = ${data.manufacturer_id}
    and product_id = ${data.product_id}
    returning *`
}

const getStatisticsById = (id) => {
    return `
    with profit as (
        select 
            EXTRACT(YEAR FROM order_date) || '-' || LPAD(EXTRACT(MONTH FROM order_date)::TEXT, 2, '0') AS month,
            sum(o.price) as sales_amount,
            sum(o.price / 6) as amount_of_profit
        from orders as o
        left join recipes as r
            on o.recipe_id = r.recipe_id
        where r.manufacturer_id = ${id}
        group by EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
    ),
    winfunc as (
        select *,
            lag(amount_of_profit) over(order by month asc) as lagprofit
        from profit
    )
    select 
        month,
        sales_amount,
        amount_of_profit,
        coalesce(amount_of_profit - lagprofit ,0) as profit_change,
        coalesce(round((cast((cast(amount_of_profit as numeric) / cast(lagprofit as numeric) - 1)  * 100 as numeric)), 2),0) as profit_change_percent
    from winfunc`
}

const addProductToSklad = (data) => {
    return `
    insert into sklad values
    (${data.manufacturer_id},${data.product_id},${data.amount})
    returning *`
}

const createRecipes = (data) => {
    return `
    insert into recipes (name, description, manufacturer_id) values 
    ('${data.name}', '${data.description}', ${data.manufacturer_id}) 
    returning *`
}

const getRecipes = (id) => {
    return `
    select r.recipe_id, name, description, path 
    from recipes as r 
    left join metadata as m
    on r.recipe_id = m.recipe_id
    where r.manufacturer_id = ${id}`
}

const addToMetadata = (data) => {
    return `
    isnert into metadata values 
    (${data.recipe_id}, ${data.path}) 
    returning *`
}

const deleteRecipe = (id) => {
    return `
    delete from recipes 
    where recipe_id = ${id}
    returning *`
}

const updateProductRecipe = (data) => {
    return `
    update recipes_products
    set amount_product = ${data.amount_product}
    where recipe_id = ${data.recipe_id} and product_id = ${data.product_id} 
    returning *`
}

const updateRecipe = (data) => {
    return `
    update recipes 
    set name = '${data.name}', description = '${data.description}'
    where recipe_id = ${data.recipe_id} 
    returning *`
}

const getCartLength = (id) => {
    return `
    select * from cart where customer_id = ${id}`
}

module.exports = {
    getAllProducts,
    getInfoForProduct,
    getProductForRecipe,
    getCustomer,
    addToCart,
    getCartById,
    deleteFromCart,
    clearCartByCustomerId,
    addOrder,
    getGroupOrdersForCustomer,
    getOrdersByGroup,
    getOrdersForManufacturer,
    getIdManufacturer,
    getProductsFromWareHouse,
    updateWareHouse,
    deleteFromWareHouse,
    getStatisticsById,
    addProductToSklad,
    createRecipes,
    getRecipes,
    addToMetadata,
    deleteRecipe,
    updateProductRecipe,
    updateRecipe,
    getCartLength
}