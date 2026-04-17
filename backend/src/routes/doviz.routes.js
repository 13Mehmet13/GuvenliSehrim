const express = require('express');
const router = express.Router();
const { getDovizData } = require('../services/doviz.service');

router.get('/', async (req, res, next) => {
  try {
    const data = await getDovizData();
    res.json({ success: true, data });
  } catch (error) {
    next(error);
  }
});

module.exports = router;
