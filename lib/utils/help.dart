// void hindi() {
//   var jsonString = lang.text;
//   bool decodedSucceeded = false;
//   try {
//     decodedJson = json.decode(jsonString) as Map<String, dynamic>;
//     decodedSucceeded = true;
//   } on FormatException catch (e) {
//     print('The Provided String is not valid JSON');
//   }
//
//   decodedJson.forEach((key, value) {
//     translator
//         .translate(value.toString(), from: 'auto', to: 'en')
//         .then((output) {
//       setState(() {
//         var keyyy;
//         out = output.toString();
//
//         keyyy = "\"${key.toString()}\"";
//         translatedJson[keyyy.toString()] =
//             "\"${out.toString()}\"" + "\n"; //out;
//       });
//       translatedtextC.text = translatedJson.toString();
//       print(translatedJson.toString() + "oooooooo");
//       print('value pair-->' + out.toString() + key.toString());
//     });
//   });
// }

// void gujrati() {
//   setState(() {
//     if (Translations.languages == 'French') {
//       print('okayyy');
//     } else {
//       print('not okay');
//     }
//   });
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jsontranslator/utils/translations.dart';
import 'package:jsontranslator/widgets/droppedfile.dart';
import 'package:translator/translator.dart';

//Language & Theme
import 'package:code_text_field/code_text_field.dart';
import 'package:highlight/languages/dart.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CodeController? _codeController;
  DroppedFile? file;
  String language1 = Translations.languages.first;
  GoogleTranslator translator = GoogleTranslator();
  String out = "";
  final lang = TextEditingController();
  final lang1 = TextEditingController();
  final translatedtextC = TextEditingController();
  String dropdownValue = 'One';

  var decodedJson;
  Map<String, String> translatedJson = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final source = lang;
    //Instantiate the codeController
    _codeController = CodeController(
        text: source.text, language: dart, theme: monokaiSublimeTheme);
  }

  @override
  void dispose() {
    _codeController?.dispose();
    super.dispose();
  }

  @override
  void dropdownCallBack() {
    var jsonString = lang.text;
    bool decodedSucceeded = false;
    try {
      decodedJson = json.decode(jsonString) as Map<String, dynamic>;
      decodedSucceeded = true;
    } on FormatException catch (e) {
      print('The Provided String is not valid JSON');
    }
    if (dropdownValue == "English") {
      decodedJson.forEach((key, value) {
        translator
            .translate(value.toString(), from: 'auto', to: 'en')
            .then((output) {
          setState(() {
            var keyyy;
            out = output.toString();

            keyyy = "\"${key.toString()}\"";
            translatedJson[keyyy.toString()] =
                "\"${out.toString()}\"" + "\n"; //out;
          });
          translatedtextC.text = translatedJson.toString();
          print(translatedJson.toString() + "oooooooo");
          print('value pair-->' + out.toString() + key.toString());
        });
      });
      print('English');
    } else if (dropdownValue == "French") {
      decodedJson.forEach((key, value) {
        translator
            .translate(value.toString(), from: 'auto', to: 'fr')
            .then((output) {
          setState(() {
            var keyyy;
            out = output.toString();

            keyyy = "\"${key.toString()}\"";
            translatedJson[keyyy.toString()] =
                "\"${out.toString()}\"" + "\n"; //out;
          });
          translatedtextC.text = translatedJson.toString();
          print(translatedJson.toString() + "oooooooo");
          print('value pair-->' + out.toString() + key.toString());
        });
      });
      print('French');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Translator'),
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 50,
              ),
              // Container(
              //   height: 300,
              //   width: 500,
              //   color: Colors.grey,
              //   child: TextField(
              //       minLines: 400,
              //       maxLines: null,
              //       keyboardType: TextInputType.multiline,
              //       controller: lang,
              //       decoration: InputDecoration(
              //           border: InputBorder.none,
              //           enabledBorder: OutlineInputBorder(
              //               borderRadius: BorderRadius.circular(15),
              //               borderSide:
              //                   const BorderSide(width: 3, color: Colors.blue)))),
              // ),
              CodeField(
                maxLines: 20,
                minLines: null,
                controller: _codeController!,
                textStyle: TextStyle(fontFamily: 'SourceCode'),
              ),
              translatedtextC.text != ""
                  ? TextField(
                style: TextStyle(
                  color: Colors.pink,
                ),
                maxLines: null,
                controller: translatedtextC,
              )
                  : Container(),
              Container(
                child: DropdownButton<String>(
                  value: language1,
                  icon: Icon(Icons.arrow_downward),
                  elevation: 16,
                  items: <String>[
                    "Choose Language",
                    "English",
                    "French",
                    "Romanian"
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      dropdownCallBack();
                    });
                    //  print(dropdownValue+'dropdown value');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
