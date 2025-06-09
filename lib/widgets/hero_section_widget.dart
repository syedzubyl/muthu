import 'package:flutter/material.dart';

class HeroSectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height, // min-h-screen
      color: Colors.black.withOpacity(0.7), // bg-black/70 overlay
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            './resource/placeholder.svg', // Replace with your image path
            fit: BoxFit.cover, // object-cover
            colorBlendMode: BlendMode.overlay, // mix-blend-overlay
            color: Colors.black.withOpacity(0.7), // Apply overlay color to image
          ),
          Center(
            // flex items-center
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // px-4
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
                crossAxisAlignment: CrossAxisAlignment.center, // text-center
                children: [
                  Text(
                    'Precision Machine Parts Manufacturing',
                    textAlign: TextAlign.center, // text-center
                    style: TextStyle(
                      color: Colors.white, // text-white
                      fontSize: 48, // text-4xl md:text-6xl (adjust for responsiveness)
                      fontWeight: FontWeight.bold, // font-bold
                    ),
                  ),
                  SizedBox(height: 16), // mb-6
                  Text(
                    'High-quality cutting, trimming, welding and joining services for automotive parts',
                    textAlign: TextAlign.center, // text-center
                    style: TextStyle(
                      color: Colors.white, // text-white
                      fontSize: 20, // text-xl md:text-2xl (adjust for responsiveness)
                    ),
                  ),
                  SizedBox(height: 32), // mb-8
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Implement Get a Quote action
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[600], // bg-blue-600
                      onPrimary: Colors.white, // text-white
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16), // px-8 py-6
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // rounded-lg
                      ),
                    ),
                    child: Text(
                      'Get a Quote',
                      style: TextStyle(
                        fontSize: 18, // text-lg
                        fontWeight: FontWeight.semibold, // font-semibold
                      ),
                    ),
                  ),
                  // TODO: Implement animations (animate-fadeIn, animate-slideUp, animate-pulse)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
