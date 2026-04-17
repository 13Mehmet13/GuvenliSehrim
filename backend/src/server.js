const app = require('./app');
const cronJobs = require('./jobs');

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`===============================================`);
  console.log(`🚀 GÜVENLİ ŞEHRİM SERVER RUNNING ON PORT ${PORT}`);
  console.log(`📡 Environment: ${process.env.NODE_ENV || 'development'}`);
  console.log(`===============================================`);
  
  // Start cron jobs
  cronJobs.init();
});
