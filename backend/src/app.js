const express = require('express');
const cors = require('cors');
const morgan = require('morgan');
const dotenv = require('dotenv');
const routes = require('./routes');
const { errorHandler } = require('./middleware/error.middleware');

dotenv.config();

const app = express();

// Middlewares
app.use(cors());
app.use(express.json());
app.use(morgan('dev'));

// Static/Public folder if needed
// app.use(express.static('public'));

// Routes
app.use('/api', routes);

// Base route for health check
app.get('/', (req, res) => {
  res.json({
    message: 'Güvenli Şehrim API is running',
    version: '1.0.0'
  });
});

// Error Handler
app.use(errorHandler);

module.exports = app;
