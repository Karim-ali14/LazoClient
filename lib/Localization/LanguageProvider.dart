import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../main.dart';
import 'LanguageType.dart';


class LanguageProvider extends StateNotifier<Locale> {

  final Ref ref;
  LanguageProvider(this.ref) : super( Locale(prefs.getString("lang") ?? LanguageType.ar));

  Locale _appLocale =  Locale(prefs.getString("lang") ?? LanguageType.ar);
  bool isEnLanguage = prefs.getString("lang") == LanguageType.en;


  Locale get appLocal => _appLocale;
  bool get isEnglish => isEnLanguage;

  fetchLocale(String? userLang) async {
    print(userLang);
    prefs.setString("lang", userLang??LanguageType.ar);
    print(prefs.getString("lang"));

    if(userLang != null){
      _appLocale = Locale(userLang);
    }else{
      _appLocale =  Locale(LanguageType.ar);
    }
    isEnLanguage = _appLocale ==  Locale(LanguageType.en) ? true : false;
    print(_appLocale);
    state = _appLocale;
  }

  String changeLanguage() {
    _appLocale = _appLocale ==   Locale(LanguageType.en) ?  Locale(LanguageType.ar) :  Locale(LanguageType.en);
    isEnLanguage = _appLocale ==  Locale(LanguageType.en) ? true : false;
    state = _appLocale;
    print("Changed");
    return _appLocale.languageCode;
  }
}
final langProvider = StateNotifierProvider<LanguageProvider,Locale>((ref) => LanguageProvider(ref));