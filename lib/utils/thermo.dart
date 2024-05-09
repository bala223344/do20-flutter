import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/animation.dart';

class HorizontalThermometer extends StatefulWidget {
  @override
  _HorizontalThermometerState createState() => _HorizontalThermometerState();
}

class _HorizontalThermometerState extends State<HorizontalThermometer>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  double _translationY = 0.0; // Vertical translation for animation

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Adjust animation duration
    )..repeat(reverse: true); // Continuously animate

    _animationController.addListener(() {
      setState(() {
        _translationY =
            20.0 * _animationController.value; // Adjust movement range
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Text('main.start_bubble',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF14c614)))
            .tr(),
      
             Transform.translate(
                offset: Offset(0.0, _translationY),
                child: Image.asset(
                  'assets/images/image1.png',
                  height: 110,
                )),

        Text('main.start_bubble',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF14c614)))
            .tr(),
        
      ],
    );
  }
}
