import 'package:flutter/material.dart';

class RadioListWidget extends StatefulWidget {
  final void Function(String) onChanged;

  const RadioListWidget({Key? key, required this.onChanged}) : super(key: key);

  @override
  _RadioListWidgetState createState() => _RadioListWidgetState();
}

class _RadioListWidgetState extends State<RadioListWidget> {
  String _passwordType = 'Facil de decir';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioListTile<String>(
          title: const Text('Facil de decir'),
          value: 'Facil de decir',
          groupValue: _passwordType,
          onChanged: (String? value) {
            setState(() {
              _passwordType = value!;
              widget.onChanged(value); 
            });
          },
        ),
        RadioListTile<String>(
          title: const Text('Facil de leer'),
          value: 'Facil de leer',
          groupValue: _passwordType,
          onChanged: (String? value) {
            setState(() {
              _passwordType = value!;
              widget.onChanged(value); 
            });
          },
        ),
        RadioListTile<String>(
          title: const Text('Todos los caracteres'),
          value: 'Todos los caracteres',
          groupValue: _passwordType,
          onChanged: (String? value) {
            setState(() {
              _passwordType = value!;
              widget.onChanged(value); 
            });
          },
        ),
      ],
    );
  }
}
