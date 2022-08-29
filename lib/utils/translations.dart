import 'package:flutter/material.dart';
class Translations{
  static final languages = <String>[
    'English',
    'Spanish',
    'French',
    'German',
    'Italian',
    'Russian'
  ];
  static String ?getLanguageCode(String language){
    switch(language){
      case 'English' :
        return 'en';
      case 'Spanish' :
        return 'es';
      case 'French' :
        return 'fr';
      case 'German' :
        return 'de';
      case 'Italian' :
        return 'it';
      case 'Russian' :
        return 'ru';
      default:
        return 'en';
    }
  }
}