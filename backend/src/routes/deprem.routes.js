const express = require('express');
const router = express.Router();
const { getDepremData } = require('../services/deprem.service');

router.get('/', async (req, res, next) => {
  try {
    const data = await getDepremData();
    res.json({ success: true, data });
  } catch (error) {
    next(error);
  }
});

module.exports = router;
