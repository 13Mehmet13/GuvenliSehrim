const axios = require('axios');
const NodeCache = require('node-cache');
const cache = new NodeCache({ stdTTL: 5 }); // 5 seconds TTL for instant updates

const DEPREM_API_URL = 'https://api.orhanaydogdu.com.tr/deprem/kandilli/live';

const getDepremData = async () => {
  const cacheKey = 'deprem_data_v4';
  const cachedData = cache.get(cacheKey);
  if (cachedData) return cachedData;

  try {
    const response = await axios.get(DEPREM_API_URL);
    const result = (response.data.result || []).map((item) => ({
      id: String(item.earthquake_id || item._id || Math.random()),
      date: item.date || new Date().toISOString(),
      title: item.title || 'Bilinmeyen Sarsıntı',
      mag: Number(item.mag || 0.0),
      depth: Number(item.depth || 0.0),
      lat: Number(item.geojson?.coordinates[1] || 0.0),
      lng: Number(item.geojson?.coordinates[0] || 0.0),
      location: item.location || (item.location_properties?.closestCity?.name) || 'Bilinmiyor',
      timestamp: item.timestamp || Date.now()
    }));

    const normalizedData = {
      count: result.length,
      last_update: new Date().toISOString(),
      earthquakes: result.slice(0, 50)
    };

    cache.set(cacheKey, normalizedData);
    return normalizedData;
  } catch (error) {
    console.error('Deprem Fetch Error:', error.message);
    throw new Error('Deprem verileri alınamadı');
  }
};

module.exports = { getDepremData };
