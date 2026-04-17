const axios = require('axios');
const NodeCache = require('node-cache');
const cache = new NodeCache({ stdTTL: 5 }); // 5 seconds TTL for instant updates

const { getCoords } = require('./geo.service');

const getStatusInfo = (aqi) => {
  if (aqi <= 20) return { status: 'Çok İyi', color: '#00E400', description: 'Hava kalitesi çok iyi, açık hava etkinlikleri için ideal.' };
  if (aqi <= 40) return { status: 'İyi', color: '#95d13e', description: 'Hava kalitesi tatmin edici düzeyde.' };
  if (aqi <= 60) return { status: 'Orta', color: '#ffff00', description: 'Hassas gruplar için hafif sağlık riski oluşabilir.' };
  if (aqi <= 80) return { status: 'Kötü', color: '#f29c33', description: 'Sağlık etkileri gözlenmeye başlayabilir.' };
  if (aqi <= 100) return { status: 'Çok Kötü', color: '#e23939', description: 'Sağlık uyarısı: herkes ciddi sağlık etkileri yaşayabilir.' };
  return { status: 'Tehlikeli', color: '#af2d2d', description: 'Acil durum: tüm nüfusun etkilenme olasılığı yüksektir.' };
};

const normalizeCity = (city) => {
  return String(city || 'İstanbul').toLowerCase()
    .replace(/ı/g, 'i').replace(/ü/g, 'u').replace(/ş/g, 's')
    .replace(/ö/g, 'o').replace(/ç/g, 'c').replace(/ğ/g, 'g');
};

const getKaliteData = async (city) => {
  const safeCity = city || 'İstanbul';
  const normalizedCity = normalizeCity(safeCity);
  const cacheKey = `aqi_v60_${normalizedCity}`;
  
  const cachedData = cache.get(cacheKey);
  if (cachedData) return cachedData;

  try {
    const { lat, lon } = getCoords(safeCity);
    const url = `https://air-quality-api.open-meteo.com/v1/air-quality?latitude=${lat}&longitude=${lon}&current=european_aqi,pm10,pm2_5,nitrogen_dioxide,sulphur_dioxide,ozone&timezone=auto`;
    
    console.log(`[AQI] Fetching: ${url}`);
    const response = await axios.get(url);
    
    if (!response || !response.data || !response.data.current) {
      console.error('[AQI] Invalid API Response Structure');
      throw new Error('Hava kalitesi servisi geçersiz yanıt döndürdü');
    }
    
    const cur = response.data.current;
    
    // Safety mapping for numeric fields
    const getVal = (v) => (v !== null && v !== undefined ? Number(v) : 0);
    
    const aqiVal = Math.round(cur.european_aqi !== undefined ? cur.european_aqi : (cur.us_aqi !== undefined ? cur.us_aqi : 20));
    const info = getStatusInfo(aqiVal);

    const normalizedData = {
      city: safeCity,
      aqi: aqiVal,
      status: info.status || 'Bilinmiyor',
      color: info.color || '#999999',
      pollutants: {
        pm25: getVal(cur.pm2_5),
        pm10: getVal(cur.pm10),
        no2: getVal(cur.nitrogen_dioxide),
        so2: getVal(cur.sulphur_dioxide),
        o3: getVal(cur.ozone)
      },
      description: info.description || 'Hava kalitesi verisi alınamadı.',
      timestamp: new Date().toISOString()
    };

    console.log(`[AQI] Success for ${safeCity}: ${aqiVal}`);
    cache.set(cacheKey, normalizedData);
    return normalizedData;
  } catch (error) {
    console.error(`[AQI] Error for ${safeCity}:`, error.message);
    // Return a safe 'Unavailable' object instead of throwing 500
    return {
      city: safeCity,
      aqi: 0,
      status: 'Hizmet Dışı',
      color: '#999999',
      pollutants: { pm25: 0, pm10: 0, no2: 0, so2: 0, o3: 0 },
      description: 'Hava kalitesi servisine şu an ulaşılamıyor. Lütfen daha sonra tekrar deneyiniz.',
      timestamp: new Date().toISOString()
    };
  }
};

module.exports = { getKaliteData };
