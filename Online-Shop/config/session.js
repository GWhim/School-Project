const expressSession = require('express-session');
const mongodbStore = require('connect-mongodb-session');

function createSessionStore(sesexpressSessionsion) {
    const MongodbStore = mongodbStore(expressSession);

    const store = new MongodbStore({
        uri: process.env.MONGODB_URL2,
        collection: 'sessions'
    });

    return store;
}

function createSessionConfig() {
    return {
        secret: process.env.SECRET || 'my secret',
        resave: false,
        saveUninitialized: false,
        store: createSessionStore(),
        cookie: {
            maxAge: 2 * 24 * 60 * 60 * 1000
        }
    };
}

module.exports = createSessionConfig;


