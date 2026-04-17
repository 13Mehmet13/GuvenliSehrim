const NodeCache = require('node-cache');
// Note: In a real app, internal cache instances would be shared or centralized
// For this demo, we'll report basic system info

const getSistemStatus = async () => {
  return {
    status: 'online',
    uptime: process.uptime(),
    timestamp: new Date().toISOString(),
    services: {
      deprem: 'active',
      hava: 'active',
      kalite: 'active',
      namaz: 'active',
      doviz: 'active'
    },
    version: '1.0.0',
    memoryUsage: process.memoryUsage()
  };
};

module.exports = { getSistemStatus };
