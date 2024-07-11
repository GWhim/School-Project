
const Order = require("../models/order.model");
const User = require("../models/user.model");
const adminController = require('../controllers/admin.controller');



async function getOrders(req, res, next) {

    try {
        const orders = await Order.findAllForUser(res.locals.uid);
        res.render('customer/orders/all-orders', { orders: orders });
    } catch (error) {
        next(error);
        return;
    }


}

async function addOrder(req, res, next) {
    const cart = res.locals.cart;
    const newStatus = req.body.newStatus;
    let userDocument;
    try {
        userDocument = await User.findById(res.locals.uid);
    } catch (error) {
        return next(error);

    }


    const order = new Order(cart, userDocument);

    try {
        const {insertedId} = await order.save();
        if(newStatus) await adminController.updateOrder(insertedId);
    } catch (error) {
        next(error);
        return;
    }

    req.session.cart = null;

    res.redirect(303, '/orders/success');


}

function getSuccess(req, res) {
    res.render('customer/orders/success');
}

function getFailure(req, res) {
    res.render('customer/orders/failure');
}

module.exports = {
    addOrder: addOrder,
    getOrders: getOrders,
    getSuccess: getSuccess,
    getFailure: getFailure
}



