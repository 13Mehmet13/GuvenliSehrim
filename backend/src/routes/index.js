const express = require('express');
const router = express.Router();

const depremRoutes = require('./deprem.routes');
const havaRoutes = require('./hava.routes');
const kaliteRoutes = require('./kalite.routes');
const namazRoutes = require('./namaz.routes');
const dovizRoutes = require('./doviz.routes');
const sistemRoutes = require('./sistem.routes');

router.use('/deprem', depremRoutes);
router.use('/hava', havaRoutes);
router.use('/kalite', kaliteRoutes);
router.use('/namaz', namazRoutes);
router.use('/doviz', dovizRoutes);
router.use('/sistem', sistemRoutes);

module.exports = router;
