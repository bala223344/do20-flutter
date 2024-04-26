import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TwoRowTwoColumnLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          // Ensures each column takes half the available space
          child: Column(
            children: [
              SquareBox(
                imagePath: 'assets/membership.svg', // Replace with your image path
                text: 'Text 1',
              ),
              SquareBox(
                imagePath: 'assets/report.svg', // Replace with your image path
                text: 'Text 2',
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              SquareBox(
                imagePath: 'assets/image1.png', // Replace with your image path
                text: 'Text 3',
              ),
              SquareBox(
                imagePath: 'assets/image1.png', // Replace with your image path
                text: 'Text 4',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SquareBox extends StatelessWidget {
  final String imagePath;
  final String text;

  const SquareBox({
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0, // Adjust height as needed
      width: 150.0, // Adjust width as needed
      decoration: BoxDecoration(
        color: Colors.grey[200], // Adjust background color if desired
        borderRadius: BorderRadius.circular(10.0), // Add rounded corners
      ),
      child: Stack(
        // Stack image and text on top
        children: [
          SvgPicture.asset(imagePath, semanticsLabel: 'Acme Logo'),
          Positioned(
            // Position text at the bottom
            bottom: 10.0,
            left: 10.0,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
