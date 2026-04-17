const axios = require('axios');
const NodeCache = require('node-cache');
const cache = new NodeCache({ stdTTL: 5 }); // 5 seconds TTL for instant updates

const NAMAZ_API_URL = 'https://api.aladhan.com/v1/timingsByCity';

const getNamazData = async (city = 'Istanbul', country = 'Turkey') => {
  // Normalize city for cache and internal lookup
  const normalizedCity = city.toLowerCase()
    .replace(/ı/g, 'i').replace(/ü/g, 'u').replace(/ş/g, 's')
    .replace(/ö/g, 'o').replace(/ç/g, 'c').replace(/ğ/g, 'g');

  const cacheKey = `namaz_v2_${normalizedCity}`; // v2 to bypass stale cache
  const cachedData = cache.get(cacheKey);
  if (cachedData) return cachedData;

  try {
    const response = await axios.get(NAMAZ_API_URL, {
      params: {
        city: city,
        country: country,
        method: 13 // Diyanet İşleri Başkanlığı
      }
    });

    const timings = response.data.data.timings;
    const normalizedData = {
      city: city,
      date: response.data.data.date.readable,
      times: {
        imsak: timings.Imsak,
        gunes: timings.Sunrise,
        ogle: timings.Dhuhr,
        ikindi: timings.Asr,
        aksam: timings.Maghrib,
        yatsi: timings.Isha
      },
      meta: {
        method: 'Diyanet İşleri Başkanlığı',
        timezone: response.data.data.meta.timezone
      }
    };

    cache.set(cacheKey, normalizedData);
    return normalizedData;
  } catch (error) {
    console.error('Namaz Fetch Error:', error.message);
    throw new Error('Namaz vakitleri alınamadı');
  }
};

module.exports = { getNamazData };
