import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TranslationsApi{
static Future<String?> translate(String msg,String fromLangCode, String toLangCode) async{
  final translations = await GoogleTranslator().translate(
    msg,
    from: fromLangCode,
    to: toLangCode
  );
  return translations.text;
}


}