const axios = require('axios');
const NodeCache = require('node-cache');
const cache = new NodeCache({ stdTTL: 5 }); // 5 seconds TTL for instant updates

// MGM public API endpoints
const MGM_BASE_URL = 'https://servis.mgm.gov.tr/api';

const { getCoords } = require('./geo.service');

const WEATHER_CODES = {
  0: 'Güneşli',
  1: 'Açık', 2: 'Parçalı Bulutlu', 3: 'Bulutlu',
  45: 'Sisli', 48: 'Sisli',
  51: 'Hafif Çiseleme', 53: 'Çiseleme', 55: 'Yoğun Çiseleme',
  61: 'Hafif Yağmurlu', 63: 'Yağmurlu', 65: 'Şiddetli Yağmurlu',
  71: 'Hafif Karlı', 73: 'Karlı', 75: 'Yoğun Karlı',
  80: 'Hafif Sağanak', 81: 'Sağanak Yağışlı', 82: 'Şiddetli Sağanak',
  95: 'Gökgürültülü Sağanak'
};

const getHavaData = async (city = 'İstanbul') => {
  const { lat, lon } = getCoords(city);
  const cacheKey = `hava_v3_${city.toLowerCase()}`;
  const cachedData = cache.get(cacheKey);
  if (cachedData) return cachedData;

  try {
    const url = `https://api.open-meteo.com/v1/forecast?latitude=${lat}&longitude=${lon}&current=temperature_2m,relative_humidity_2m,apparent_temperature,weather_code,wind_speed_10m&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto`;
    const response = await axios.get(url);
    const current = response.data.current;
    const daily = response.data.daily;

    const normalizedData = {
      city: city,
      current: {
        temp: Number(current.temperature_2m.toFixed(1)),
        humidity: current.relative_humidity_2m,
        wind: Number(current.wind_speed_10m.toFixed(1)),
        condition: WEATHER_CODES[current.weather_code] || 'Parçalı Bulutlu',
        feels_like: Number(current.apparent_temperature.toFixed(1))
      },
      forecast: daily.time.map((time, i) => ({
        date: time,
        min: Number(daily.temperature_2m_min[i].toFixed(1)),
        max: Number(daily.temperature_2m_max[i].toFixed(1)),
        condition: WEATHER_CODES[daily.weather_code[i]] || 'Bulutlu'
      }))
    };

    cache.set(cacheKey, normalizedData);
    return normalizedData;
  } catch (error) {
    console.error('Open-Meteo Fetch Error:', error.message);
    throw new Error('Hava durumu verileri alınamadı');
  }
};

module.exports = { getHavaData };
