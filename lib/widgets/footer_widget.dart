import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Assuming you'll use flutter_svg for social icons

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32.0), // py-8
      color: Colors.grey[800], // bg-gray-800
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0), // px-4
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Company Name and Tagline
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Precision',
                    style: TextStyle(
                      color: Colors.blue[400], // text-blue-400
                      fontSize: 24, // text-2xl
                      fontWeight: FontWeight.bold, // font-bold
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text: ' Machine Works',
                        style: TextStyle(
                          color: Colors.white, // text-white
                          fontSize: 24, // text-2xl
                          fontWeight: FontWeight.bold, // font-bold
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0), // mt-2
                Text(
                  'Quality machining services since 2008',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16, // text-gray-400
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0), // mb-4 (approx)
            // Social Media Links
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // justify-center
              children: [
                _buildSocialIcon(
                  // Facebook icon SVG data
                  '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-facebook h-5 w-5"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path></svg>',
                  'http://localhost:3000/#', // Replace with actual Facebook link
                ),
                SizedBox(width: 24.0), // space-x-6 (approx)
                _buildSocialIcon(
                  // Twitter icon SVG data
                  '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-twitter h-5 w-5"><path d="M22 4s-.7 2.1-2 3.4c1.6 10-9.4 17.3-18 11.6 2.2.1 4.4-.6 6-2C3 15.5.5 9.6 3 5c2.2 2.6 5.6 4.1 9 4-.9-4.2 4-6.6 7-3.8 1.1 0 3-1.2 3-1.2z"></path></svg>',
                  'http://localhost:3000/#', // Replace with actual Twitter link
                ),
                SizedBox(width: 24.0), // space-x-6 (approx)
                _buildSocialIcon(
                  // LinkedIn icon SVG data
                  '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-linkedin h-5 w-5"><path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z"></path><rect width="4" height="12" x="2" y="9"></rect><circle cx="4" cy="4" r="2"></circle></svg>',
                  'http://localhost:3000/#', // Replace with actual LinkedIn link
                ),
              ],
            ),
            SizedBox(height: 32.0), // mt-8 (approx)
            // Copyright
            Container(
              // border-t border-gray-700 mt-8 pt-8 text-center text-gray-400
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey[700]!), // border-t border-gray-700
                ),
              ),
              padding: const EdgeInsets.only(top: 32.0), // pt-8
              child: Text(
                '© 2024 Precision Machine Works. All rights reserved.',
                textAlign: TextAlign.center, // text-center
                style: TextStyle(
                  fontSize: 16, // text-gray-400
                  color: Colors.grey[400],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build social media icons with links
  Widget _buildSocialIcon(String svgData, String url) {
    return InkWell(
      onTap: () {
        // TODO: Open the social media link
      },
      child: SvgPicture.string(
        svgData,
        color: Colors.grey[400], // text-gray-400
        width: 20, // h-5 w-5
        height: 20, // h-5 w-5
      ),
    );
  }
}
