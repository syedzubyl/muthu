import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Assuming you'll use flutter_svg for the map-pin icon
import 'package:webview_flutter/webview_flutter.dart'; // For displaying the map

class LocationSectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80.0), // py-20
      color: Colors.grey[100], // bg-gray-100
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0), // px-4
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Our Location',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28, // text-3xl (adjust for responsiveness)
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16), // mb-4
            Container(
              constraints: BoxConstraints(maxWidth: 600), // max-w-3xl
              child: Text(
                'Visit our state-of-the-art manufacturing facility or contact us directly.',
                textAlign: TextAlign.center, // text-center
                style: TextStyle(
                  fontSize: 16, // text-gray-600
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(height: 48), // mb-12
            // Responsive layout: contact info and map side-by-side on large screens, stacked on small/medium screens
            MediaQuery.of(context).size.width > 992 // lg breakpoint
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Contact Information
                      Expanded(
                        flex: 1, // lg:w-1/2
                        child: _buildContactInfoCard(),
                      ),
                      SizedBox(width: 32.0), // gap-8 (approx)
                      // Map
                      Expanded(
                        flex: 1, // lg:w-1/2
                        child: _buildMapWidget(400.0), // h-[400px]
                      ),
                    ],
                  )
                : Column(
                    // Stacked on small/medium screens
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Contact Information
                      _buildContactInfoCard(),
                      SizedBox(height: 32.0), // gap-8 (approx)
                      // Map
                      _buildMapWidget(400.0), // h-[400px]
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfoCard() {
    return Card(
      // bg-white p-6 rounded-lg shadow-lg h-full
      elevation: 4.0, // shadow-lg
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // rounded-lg
      ),
      child: Container(
        padding: const EdgeInsets.all(24.0), // p-6
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // flex items-center mb-4
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 8.0), // mr-2
                  child: SvgPicture.string(
                    // map-pin icon SVG data
                    '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-map-pin h-5 w-5 mr-2 text-blue-600"><path d="M20 10c0 4.993-5.539 10.193-7.399 11.799a1 1 0 0 1-1.202 0C9.539 20.193 4 14.993 4 10a8 8 0 0 1 16 0"></path><circle cx="12" cy="10" r="3"></circle></svg>',
                    color: Colors.blue[600], // text-blue-600
                  ),
                ),
                Text(
                  'Company Address',
                  style: TextStyle(
                    fontSize: 20, // text-xl
                    fontWeight: FontWeight.bold, // font-bold
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0), // mb-4
            Text(
              '123 Manufacturing Drive',
              style: TextStyle(
                fontSize: 16, // text-gray-600
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8.0), // mb-2
            Text(
              'Industrial Park, Suite 500',
              style: TextStyle(
                fontSize: 16, // text-gray-600
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8.0), // mb-2
            Text(
              'Detroit, MI 48201',
              style: TextStyle(
                fontSize: 16, // text-gray-600
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8.0), // mb-2
            Text(
              'United States',
              style: TextStyle(
                fontSize: 16, // text-gray-600
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 24.0), // mb-6
            Text(
              'Contact Information',
              style: TextStyle(
                fontSize: 20, // text-xl
                fontWeight: FontWeight.bold, // font-bold
              ),
            ),
            SizedBox(height: 16.0), // mb-4
            Text(
              'Phone: (555) 123-4567',
              style: TextStyle(
                fontSize: 16, // text-gray-600
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8.0), // mb-2
            Text(
              'Email: info@precisionmachineworks.com',
              style: TextStyle(
                fontSize: 16, // text-gray-600
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8.0), // mb-2
            Text(
              'Hours: Monday-Friday, 8am-6pm EST',
              style: TextStyle(
                fontSize: 16, // text-gray-600
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMapWidget(double height) {
    // You need to use a package like webview_flutter to display a map iframe
    // Add webview_flutter to your pubspec.yaml
    // And configure it for your platform (Android and iOS)
    return Container(
      height: height, // h-[400px]
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0), // rounded-lg
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // shadow-lg (approx)
            blurRadius: 8.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0), // rounded-lg overflow-hidden
        child: WebView(
          initialUrl: 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1dlatitude!2dlongitude!3dlatitude!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMjfCsDIyJzU0LjAiTiA4M8KwMTknMzkuMCJF!5e0!3m2!1sen!2sus!4v1646014026525!5m2!1sen!2sus', // Replace with your actual embed map URL
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
