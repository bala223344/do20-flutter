import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';

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
                imagePath:
                    'assets/images/report.svg', // Replace with your image path
                text: ('main.reports').tr(),
              ),
              SquareBox(
                imagePath:
                    'assets/images/account.svg', // Replace with your image path
                text: ('main.account').tr(),
              ),
            ],
          ),
        ),
        
        Expanded(
          child: Column(
            children: [
              SquareBox(
                imagePath:
                    'assets/images/membership.svg', // Replace with your image path
                text: ('main.membership').tr(),
              ),
              SquareBox(
                imagePath:
                    'assets/images/lang.svg', // Replace with your image path
                text: ('main.language').tr(),
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
    return  Padding(
            padding: const EdgeInsets.all(8.0),
            child:Container(
      height: 150.0, // Adjust height as needed
      width: 150.0, // Adjust width as needed
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Colors.grey[200], // Adjust background color if desired
        borderRadius: BorderRadius.circular(10.0), // Add rounded corners
      ),
      // Stack image and text on top
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: SvgPicture.asset(
            imagePath,
            semanticsLabel: 'do20',
            width: 80,
            height: 80,
              colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),

          ),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 16.0,
              ),
            )),
                SizedBox(height: 10.0,), // Add 10.0 horizontal space

      ]),
    )
    );
  }
}
