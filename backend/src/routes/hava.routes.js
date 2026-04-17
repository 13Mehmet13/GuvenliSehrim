const express = require('express');
const router = express.Router();
const { getHavaData } = require('../services/hava.service');

router.get('/', async (req, res, next) => {
  try {
    const { sehir } = req.query;
    const data = await getHavaData(sehir);
    res.json({ success: true, data });
  } catch (error) {
    next(error);
  }
});

module.exports = router;
