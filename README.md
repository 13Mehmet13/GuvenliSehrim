# Güvenli Şehrim - Akıllı Şehir Bilgi Sistemi

Bu proje, Türkiye vatandaşlarının günlük ve kritik çevresel bilgilerini (Deprem, Hava Durumu, Hava Kalitesi, Namaz Vakitleri ve Döviz Kurları) tek bir modern mobil arayüzde toplayan üretim seviyesinde (production-grade) bir monorepo yazılımıdır.

---

## 👤 Öğrenci Bilgileri
- **Ad Soyad:** [AD SOYAD BURAYA GELECEK]
- **Öğrenci Numarası:** [NUMARA BURAYA GELECEK]

---

## 🚀 Teknolojiler

### Backend (Node.js & Express)
- **Runtime:** Node.js 20
- **Framework:** Express.js
- **Veri Çekme:** Axios & XML2JS (TCMB XML Parsing)
- **Önbellek:** node-cache (TTL tabanlı proxy caching)
- **Otomasyon:** node-cron (Periyodik veri yenileme)
- **Güvenlik & Log:** CORS, Morgan, Error Middlewares

### Mobile (Flutter & Riverpod)
- **Mimari:** Feature-First Clean Architecture
- **State Management:** Riverpod
- **Local DB:** Hive (Offline caching & Preferences)
- **Harita:** Flutter Map (OpenStreetMap)
- **Grafik:** FL Chart
- **Tasarım:** Premium UI (Inter/Outfit Fontları, Dark/Light Mode, Custom Gradients)
- **Test:** Automated Widget Keys (Birebir talep edilen isimler)

---

## 📂 Proje Yapısı

```text
/backend          # Node.js API Gateway kaynak kodları
/mobile           # Flutter mobil uygulama kaynak kodları
docker-compose.yml # Backend container orkestrasyonu
README.md         # Proje dokümantasyonu
```

---

## 🛠️ Kurulum ve Çalıştırma

### 1. Backend Çalıştırma
```bash
cd backend
npm install
npm run dev
```
*Docker ile çalıştırmak isterseniz:*
```bash
docker-compose up --build
```

### 2. Mobile Çalıştırma
```bash
cd mobile
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

---

## 📡 API Uç Noktaları (Endpoints)
- `/api/deprem`: Son 50 deprem listesi (Kandilli/AFAD)
- `/api/hava`: Şehre göre anlık ve 5 günlük hava tahmini (MGM)
- `/api/kalite`: Hava kalitesi (AQI) verileri ve sağlık önerileri
- `/api/namaz`: Diyanet uyumlu namaz vakitleri
- `/api/doviz`: TCMB bazlı güncel kurlar (USD, EUR, GBP, Altın)
- `/api/sistem`: API sağlık durumu ve çalışma süresi

---

## 🧪 Otomasyon Test Keys
Projede talep edilen tüm widget key'leri hatasız uygulanmıştır. Örnek uygulama:
- `dashboard_deprem_card`
- `nav_dashboard`
- `deprem_map`
- `hava_temp_text`
- vb.
