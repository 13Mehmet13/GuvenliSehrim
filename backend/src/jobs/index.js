const cron = require('node-cron');
const { getDepremData } = require('../services/deprem.service');
const { getHavaData } = require('../services/hava.service');
const { getDovizData } = require('../services/doviz.service');

const init = () => {
  console.log('⏰ Cron Jobs initialized');

  // Deprem: Every 2 minutes
  cron.schedule('*/2 * * * *', async () => {
    console.log('🔄 Cron: Refreshing Deprem Data...');
    try {
      await getDepremData(); // Service handles caching
    } catch (e) {
      console.error('Cron Deprem Error:', e.message);
    }
  });

  // Hava: Every 15 minutes
  cron.schedule('*/15 * * * *', async () => {
    console.log('🔄 Cron: Refreshing Hava Data...');
    try {
      await getHavaData('ISTANBUL');
    } catch (e) {
      console.error('Cron Hava Error:', e.message);
    }
  });

  // Doviz: Every 1 hour
  cron.schedule('0 * * * *', async () => {
    console.log('🔄 Cron: Refreshing Doviz Data...');
    try {
      await getDovizData();
    } catch (e) {
      console.error('Cron Doviz Error:', e.message);
    }
  });
};

module.exports = { init };
