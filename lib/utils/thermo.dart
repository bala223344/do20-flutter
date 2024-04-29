import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HorizontalThermometer extends StatelessWidget {

  const HorizontalThermometer({
    super.key,
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
            left: 10.0, // Align to the left edge of the image
            width:200,
            child:
          ClipRRect(
              borderRadius: BorderRadius.circular(90.0),
              child: Container(
                alignment: Alignment.center,
                constraints: const BoxConstraints(
                  maxWidth: 150,
                  maxHeight: 50,
                ),
                color: Colors.amber,
                child: const Text('main.start_bubble',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16 ,  color: Color.fromARGB(255, 32, 35, 43))).tr(),
              ),
            )
            )
            ,
             Image.asset(
            'assets/images/image1.png',
            height: 110,
          ),
          const SizedBox(width: 5.0), // Spacing between text and end
        ])
        )
      ],
    );
  }
}
