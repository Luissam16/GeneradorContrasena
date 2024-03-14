import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  final void Function(double) onChanged;

  const SliderWidget({Key? key, required this.onChanged}) : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _sliderValue = 6.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Selecciona la longitud de la contraseña:'),
        Slider(
          value: _sliderValue,
          min: 6,
          max: 20,
          divisions: 14,
          label: _sliderValue.round().toString(),
          onChanged: (value) {
            setState(() {
              _sliderValue = value;
              widget.onChanged(value);
            });
          },
        ),
        Text('Longitud de la contraseña: ${_sliderValue.round()}'),
      ],
    );
  }
}
