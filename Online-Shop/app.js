require('dotenv').config();
const path = require('path');

const express = require('express');
const csrf = require('csurf');
const expressSession = require('express-session');

const createSessionConfig = require('./config/session');

const db = require('./data/database');
const addCsrfTokenMiddleware = require('./middlewares/csrf-token');
const errorHandlerMiddleware = require('./middlewares/error-handler');
const checkAuthStatusMiddleware = require('./middlewares/check-auth');
const protectRoutesMiddleware = require('./middlewares/protect-routes');
const updatedCartPricesMiddleware = require('./middlewares/update-cart-prices');
const cartMiddleware = require('./middlewares/cart');
const notFoundMiddleware = require('./middlewares/not-found');
const authRoutes = require('./routes/auth.routes');
const productsRoutes = require('./routes/products.routes');
const baseRoutes = require('./routes/base.routes');
const adminRoutes = require('./routes/admin.routes');
const cartRoutes = require('./routes/cart.routes');
const ordersRoutes = require('./routes/orders.routes');

const app = express();

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

app.use(express.static('public'));
app.use('/products/assets', express.static('product-data'));
app.use(express.urlencoded({extended: false}));
app.use(express.json());

const sessionConfig = createSessionConfig();

app.use(expressSession(sessionConfig));
app.use(csrf());

app.use(cartMiddleware);
app.use(updatedCartPricesMiddleware);

app.use(addCsrfTokenMiddleware);
app.use(checkAuthStatusMiddleware);

app.use(baseRoutes);
app.use(authRoutes);
app.use(productsRoutes);
app.use('/cart', cartRoutes);
app.use(protectRoutesMiddleware);
app.use('/orders', protectRoutesMiddleware, ordersRoutes);
app.use('/admin', protectRoutesMiddleware, adminRoutes);

app.use(notFoundMiddleware);
app.use(errorHandlerMiddleware);

let port = process.env.PORT2;

db.connectToDatabase().then(function() {
    console.log('listen to', port)
    app.listen(port);
}).catch(function(error) {
    console.log('Failed to connect to the database!');
    console.log(error);
})

