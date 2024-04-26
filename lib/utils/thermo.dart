import 'package:flutter/material.dart';

class HorizontalThermometer extends StatelessWidget {
  final String imagePath;
  final String text;

  const HorizontalThermometer({
    super.key,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded( // Use Expanded to fill available space
      flex: 2, // Adjust flex ratio as nee
       child: Stack(// Use Stack for overlapping widgets
            children: [
         
          Positioned(
            // Position the ClipRRect on top of the image
            top: 45, // Adjust based on ClipRRect height
            left: 40.0, // Align to the left edge of the image
            width:300,
            child:
          ClipRRect(
              borderRadius: BorderRadius.circular(90.0),
              child: Container(
                alignment: Alignment.center,
                constraints: const BoxConstraints(
                  maxWidth: 300,
                  maxHeight: 50,
                ),
                color: Colors.green,
                child: const Text('ClipRRect',
                    style: TextStyle(color: Colors.white)),
              ),
            )
            )
            ,
             Image.asset(
            imagePath,
            height: 110,
          ),
          const SizedBox(width: 5.0), // Spacing between text and end
        ])
        )
      ],
    );
  }
}
