import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  final void Function(Map<String, bool>) onChanged;

  const CheckboxWidget({Key? key, required this.onChanged}) : super(key: key);

  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  final Map<String, bool> _checkedValues = {
    'Mayúsculas': false,
    'Minúsculas': false,
    'Números': false,
    'Símbolos': false,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _checkedValues.keys.map((String key) {
        return CheckboxListTile(
          title: Text(key),
          value: _checkedValues[key],
          onChanged: (value) {
            setState(() {
              _checkedValues[key] = value!;
              widget.onChanged(_checkedValues);
            });
          },
        );
      }).toList(),
    );
  }
}
