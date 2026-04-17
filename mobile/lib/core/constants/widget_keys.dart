import 'package:flutter/material.dart';

class WidgetKeys {
  // Dashboard
  static const Key dashboardDepremCard = Key('dashboard_deprem_card');
  static const Key dashboardHavaCard = Key('dashboard_hava_card');
  static const Key dashboardAqiCard = Key('dashboard_aqi_card');
  static const Key dashboardNamazCard = Key('dashboard_namaz_card');
  static const Key dashboardDovizCard = Key('dashboard_doviz_card');
  static const Key dashboardKonumText = Key('dashboard_konum_text');
  static const Key dashboardRefresh = Key('dashboard_refresh');
  static const Key dashboardOfflineBanner = Key('dashboard_offline_banner');

  // Bottom Nav
  static const Key navDashboard = Key('nav_dashboard');
  static const Key navDeprem = Key('nav_deprem');
  static const Key navHava = Key('nav_hava');
  static const Key navAqi = Key('nav_aqi');
  static const Key navNamaz = Key('nav_namaz');
  static const Key navDoviz = Key('nav_doviz');
  static const Key navSettings = Key('nav_settings');
  static const Key navAyarlar = Key('nav_ayarlar');

  // Deprem
  static const Key depremMap = Key('deprem_map');
  static const Key depremStatsCard = Key('deprem_stats_card');
  static const String depremItemPrefix = 'deprem_item_';
  static const Key depremFilterMagnitude = Key('deprem_filter_magnitude');
  static const Key depremFilterTime = Key('deprem_filter_time');
  static const Key depremFilterRegion = Key('deprem_filter_region');

  // Hava
  static const Key havaTempText = Key('hava_temp_text');
  static const Key havaNemText = Key('hava_nem_text');
  static const Key havaRuzgarText = Key('hava_ruzgar_text');
  static const Key havaHissedilenText = Key('hava_hissedilen_text');
  static const Key hava5gunList = Key('hava_5gun_list');
  static const Key havaSaatlikList = Key('hava_saatlik_list');
  static const Key havaSehirDropdown = Key('hava_sehir_dropdown');
  static const Key havaGpsButton = Key('hava_gps_button');
  static const Key havaFavoriButton = Key('hava_favori_button');

  // AQI
  static const Key aqiValueText = Key('aqi_value_text');
  static const Key aqiCategoryText = Key('aqi_category_text');
  static const Key aqiStatusText = Key('aqi_status_text');
  static const Key aqiGauge = Key('aqi_gauge');
  static const Key aqiOneriCard = Key('aqi_oneri_card');
  static const Key aqiTrendChart = Key('aqi_trend_chart');
  static const Key aqiStationMap = Key('aqi_station_map');
  static const Key aqiPm10 = Key('aqi_pm10');
  static const Key aqiPm25 = Key('aqi_pm25');
  static const Key aqiNo2 = Key('aqi_no2');
  static const Key aqiSo2 = Key('aqi_so2');
  static const Key aqiO3 = Key('aqi_o3');

  // Namaz
  static const Key namazKalanSure = Key('namaz_kalan_sure');
  static const Key namazYaklasanVakit = Key('namaz_yaklasan_vakit');
  static const Key namazVakitText = Key('namaz_vakit_text');
  static const Key namazKalanSureText = Key('namaz_kalan_sure_text');
  static const Key namazImsakText = Key('namaz_imsak_text');
  static const Key namazGunesText = Key('namaz_gunes_text');
  static const Key namazOgleText = Key('namaz_ogle_text');
  static const Key namazIkindiText = Key('namaz_ikindi_text');
  static const Key namazAksamText = Key('namaz_aksam_text');
  static const Key namazYatsiText = Key('namaz_yatsi_text');
  static const Key namazImsak = Key('namaz_imsak');
  static const Key namazGunes = Key('namaz_gunes');
  static const Key namazOgle = Key('namaz_ogle');
  static const Key namazOgleVakti = Key('namaz_ogle_vakti');
  static const Key namazIkindi = Key('namaz_ikindi');
  static const Key namazAksam = Key('namaz_aksam');
  static const Key namazYatsi = Key('namaz_yatsi');
  static const Key namazHaftalikList = Key('namaz_haftalik_list');
  static const Key namazHaftalikButton = Key('namaz_haftalik_button');
  static const Key namazSehirDropdown = Key('namaz_sehir_dropdown');

  // Döviz
  static const Key dovizUsdCard = Key('doviz_usd_card');
  static const Key dovizEurCard = Key('doviz_eur_card');
  static const Key dovizAltinCard = Key('doviz_altin_card');
  static const Key dovizList = Key('doviz_list');
  static const Key dovizFavoriButton = Key('doviz_favori_button');

  // Ayarlar / Settings
  static const Key settingsThemeSwitch = Key('settings_theme_switch');
  static const Key settingsLanguage = Key('settings_language');
  static const Key settingsAbout = Key('settings_about');
  static const Key settingsNotification = Key('settings_notification');
  static const Key ayarTemaDropdown = Key('ayar_tema_dropdown');
  static const Key ayarDepremSwitch = Key('ayar_deprem_switch');
  static const Key ayarAqiSwitch = Key('ayar_aqi_switch');
  static const Key ayarDepremSlider = Key('ayar_deprem_slider');
  static const Key ayarAqiSlider = Key('ayar_aqi_slider');
  static const Key ayarRefreshDropdown = Key('ayar_refresh_dropdown');
  static const Key ayarCacheClearButton = Key('ayar_cache_clear_button');
}
