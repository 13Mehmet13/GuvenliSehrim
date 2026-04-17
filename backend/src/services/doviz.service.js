const axios = require('axios');
const xml2js = require('xml2js');
const NodeCache = require('node-cache');
const cache = new NodeCache({ stdTTL: 5 }); // 5 seconds TTL for instant updates

const TCMB_URL = 'https://www.tcmb.gov.tr/kurlar/today.xml';

const getDovizData = async () => {
  const cachedData = cache.get('doviz_data');
  if (cachedData) return cachedData;

  try {
    const response = await axios.get(TCMB_URL);
    const parser = new xml2js.Parser({ explicitArray: false });
    const result = await parser.parseStringPromise(response.data);

    const currencies = result.Tarih_Date.Currency.map((item) => ({
      code: item.$.CurrencyCode,
      name: item.Isim,
      buying: item.ForexBuying,
      selling: item.ForexSelling,
      unit: item.Unit
    }));

    const normalizedData = {
      date: result.Tarih_Date.$.Date,
      currencies: currencies.filter(c => ['USD', 'EUR', 'GBP', 'CHF'].includes(c.code))
    };

    cache.set('doviz_data', normalizedData);
    return normalizedData;
  } catch (error) {
    console.error('TCMB Fetch Error:', error.message);
    throw new Error('Döviz verileri alınamadı');
  }
};

module.exports = { getDovizData };
