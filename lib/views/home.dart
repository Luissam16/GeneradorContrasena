import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/slider.dart';
import 'package:flutter_application_1/views/checkbox.dart';
import 'package:flutter_application_1/views/generate.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PasswordGenerator _passwordGenerator = PasswordGenerator();
  String _generatedPassword = '';
  double _sliderValue = 6.0;
  String _passwordType = 'Facil de decir';
  Map<String, bool> _options = {
    'Mayúsculas': false,
    'Minúsculas': false,
    'Números': false,
    'Símbolos': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenid@'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Configuración de Contraseña',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _generatedPassword = _passwordGenerator.generatePassword(
                      length: _sliderValue.toInt(),
                      passwordType: _passwordType,
                      options: _options,
                    );
                  });
                },
                child: const Text('Generar Contraseña'),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  _generatedPassword,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 20),
              SliderWidget(
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              PasswordOptionsList(
                onChanged: (value) {
                  setState(() {
                    _passwordType = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              CheckboxWidget(
                onChanged: (value) {
                  setState(() {
                    _options = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
