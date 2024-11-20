import 'dart:async';
import 'dart:ui';

var auth = false;
const BASE_URL = 'http://www.sp.somee.com';
const en = Locale("en", "US");
const ar = Locale("ar", "");
var currentLocale = en;
var currentLanguage = "ENGLISH";
TextDirection currentTextDir = TextDirection.ltr;
StreamController<Locale> localeController = StreamController.broadcast();
