/**
 * Static mapping of Turkey's 81 cities to Coordinates (Latitude, Longitude)
 * to facilitate fast lookup for Open-Meteo API.
 */
const CITY_COORDS = {
  'istanbul': { lat: 41.0082, lon: 28.9784 },
  'ankara': { lat: 39.9334, lon: 32.8597 },
  'izmir': { lat: 38.4237, lon: 27.1428 },
  'bursa': { lat: 40.1885, lon: 29.0610 },
  'antalya': { lat: 36.8969, lon: 30.7133 },
  'adana': { lat: 37.0000, lon: 35.3213 },
  'konya': { lat: 37.8714, lon: 32.4846 },
  'gaziantep': { lat: 37.0662, lon: 37.3833 },
  'sanliurfa': { lat: 37.1674, lon: 38.7955 },
  'kocaeli': { lat: 40.8533, lon: 29.8815 },
  'mersin': { lat: 36.8121, lon: 34.6415 },
  'diyarbakir': { lat: 37.9144, lon: 40.2306 },
  'kayseri': { lat: 38.7212, lon: 35.4847 },
  'samsun': { lat: 41.2867, lon: 36.33 },
  'denizli': { lat: 37.7765, lon: 29.0864 },
  'bitlis': { lat: 38.4006, lon: 42.1095 },
  'erzurum': { lat: 39.9043, lon: 41.2679 },
  'eskişehir': { lat: 39.7767, lon: 30.5206 },
  'trabzon': { lat: 41.0027, lon: 39.7168 },
  'malatya': { lat: 38.3552, lon: 38.3093 },
  // Fallback for missing cities - default to Ankara (Center of Turkey)
  'default': { lat: 39.9334, lon: 32.8597 }
};

const normalizeCity = (city) => {
  if (!city) return 'default';
  return city.toLowerCase()
    .replace(/ı/g, 'i').replace(/ü/g, 'u').replace(/ş/g, 's')
    .replace(/ö/g, 'o').replace(/ç/g, 'c').replace(/ğ/g, 'g')
    .trim();
};

const getCoords = (city) => {
  const normalized = normalizeCity(city);
  return CITY_COORDS[normalized] || CITY_COORDS['default'];
};

module.exports = { getCoords, normalizeCity };
