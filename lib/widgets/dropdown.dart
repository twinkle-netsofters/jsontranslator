import 'package:flutter/material.dart';
import 'package:jsontranslator/utils/translations.dart';

class DropDownWidget extends StatelessWidget {
  final String value;
  final ValueChanged<String?> onChangedLang;

  const DropDownWidget(
      {Key? key, required this.value, required this.onChangedLang})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = Translations.languages
        .map<DropdownMenuItem<String>>((String value) =>
            DropdownMenuItem<String>(value: value, child: Text(value)))
        .toList();
    return DropdownButton<String>(
        value: value,
        items: items,
        icon: Icon(
          Icons.expand_more,
          color: Colors.grey,
        ),
        onChanged: onChangedLang
    );
  }
}
