import 'dart:math';
import 'package:flutter/material.dart';

class PasswordGenerator {
  String generatePassword({
    required int length,
    required String passwordType,
    required Map<String, bool> options,
  }) {
    String chars = '';

    if (passwordType == 'Facil de decir') {
       chars += 'AEIOUaeiou';
    } else if (passwordType == 'Facil de leer') {
      chars += 'ABCDEFGHIJKLMNPQRSTUVWXYZabcdefghijklmnpqrstuvwxyz'; 
    } else if (passwordType == 'Todos los caracteres') {
      chars += 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#%^&*()-_=+';
    }

    if (options['Mayúsculas']!) {
      chars += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    }
    if (options['Minúsculas']!) {
      chars += 'abcdefghijklmnopqrstuvwxyz';
    }
    if (options['Números']!) {
      chars += '0123456789';
    }
    if (options['Símbolos']!) {
      chars += '!@#%^&*()-_=+';
    }

    if (chars.isEmpty) {
      return 'Seleccione al menos un tipo de caracteres';
    }

    String password = '';
    for (int i = 0; i < length; i++) {
      password += chars[Random().nextInt(chars.length)];
    }

    return password;
  }

  void updateOptions({required int length, required String passwordType}) {}
}

class PasswordOptionsList extends StatefulWidget {
  final void Function(String) onChanged;

  const PasswordOptionsList({Key? key, required this.onChanged}) : super(key: key);

  @override
  _PasswordOptionsListState createState() => _PasswordOptionsListState();
}

class _PasswordOptionsListState extends State<PasswordOptionsList> {
  String _selectedOption = 'Facil de decir';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildOption('Facil de decir', Icons.speaker_notes),
        _buildOption('Facil de leer', Icons.visibility),
        _buildOption('Todos los caracteres', Icons.format_align_left),
      ],
    );
  }

  Widget _buildOption(String text, IconData iconData) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedOption = text;
          widget.onChanged(text);
        });
      },
      child: Row(
        children: [
          Icon(iconData),
          const SizedBox(width: 8),
          Radio(
            value: text,
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = text;
                widget.onChanged(text);
              });
            },
          ),
          Text(text),
        ],
      ),
    );
  }
}
