const express = require('express');
const router = express.Router();
const { getSistemStatus } = require('../services/sistem.service');

router.get('/', async (req, res, next) => {
  try {
    const data = await getSistemStatus();
    res.json({ success: true, data });
  } catch (error) {
    next(error);
  }
});

module.exports = router;
