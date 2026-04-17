const express = require('express');
const router = express.Router();
const { getNamazData } = require('../services/namaz.service');

router.get('/', async (req, res, next) => {
  try {
    const { sehir } = req.query;
    const data = await getNamazData(sehir);
    res.json({ success: true, data });
  } catch (error) {
    next(error);
  }
});

module.exports = router;
