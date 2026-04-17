const express = require('express');
const router = express.Router();
const { getKaliteData } = require('../services/kalite.service');

router.get('/', async (req, res, next) => {
  try {
    const { sehir } = req.query;
    const data = await getKaliteData(sehir);
    res.json({ success: true, data });
  } catch (error) {
    next(error);
  }
});

module.exports = router;
