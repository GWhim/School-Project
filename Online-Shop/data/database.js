const mongodb = require('mongodb');

const Mongoclient = mongodb.MongoClient;

let mongodbUrl = process.env.MONGODB_URL;

let database;

async function connectToDatabase() {
    const client = await Mongoclient.connect(mongodbUrl);
    database = client.db('shop23');
}

function getDb() {
    if (!database) {
        throw new Error('You must connect first');
    }

    return database;
}

module.exports = {
    connectToDatabase: connectToDatabase,
    getDb: getDb
}
