import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';

class LocationSectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80.0),
      color: Colors.grey[100],
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Our Location',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Container(
              constraints: BoxConstraints(maxWidth: 600),
              child: Text(
                'Visit our state-of-the-art manufacturing facility or contact us directly.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ),
            SizedBox(height: 48),
            MediaQuery.of(context).size.width > 992
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 1, child: _buildContactInfoCard()),
                      SizedBox(width: 32.0),
                      Expanded(flex: 1, child: _buildMapWidget(400.0)),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildContactInfoCard(),
                      SizedBox(height: 32.0),
                      _buildMapWidget(400.0),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfoCard() {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Container(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  child: SvgPicture.string(
                    '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-map-pin h-5 w-5 mr-2 text-blue-600"><path d="M20 10c0 4.993-5.539 10.193-7.399 11.799a1 1 0 0 1-1.202 0C9.539 20.193 4 14.993 4 10a8 8 0 0 1 16 0"></path><circle cx="12" cy="10" r="3"></circle></svg>',
                    color: Colors.blue[600],
                  ),
                ),
                Text(
                  'Company Address',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text('123 Manufacturing Drive', style: _addressTextStyle()),
            SizedBox(height: 8.0),
            Text('Industrial Park, Suite 500', style: _addressTextStyle()),
            SizedBox(height: 8.0),
            Text('Detroit, MI 48201', style: _addressTextStyle()),
            SizedBox(height: 8.0),
            Text('United States', style: _addressTextStyle()),
            SizedBox(height: 24.0),
            Text(
              'Contact Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text('Phone: (555) 123-4567', style: _addressTextStyle()),
            SizedBox(height: 8.0),
            Text(
              'Email: info@precisionmachineworks.com',
              style: _addressTextStyle(),
            ),
            SizedBox(height: 8.0),
            Text(
              'Hours: Monday-Friday, 8am-6pm EST',
              style: _addressTextStyle(),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _addressTextStyle() {
    return TextStyle(fontSize: 16, color: Colors.grey[600]);
  }

  Widget _buildMapWidget(double height) {
    final staticMapUrl =
        'https://maps.googleapis.com/maps/api/staticmap?center=40.758896,-73.985130&zoom=13&size=600x400&key=AIzaSyAbwu984LJcbE81ZOip1pmfAqfFbw5jd7g';
    final mapsUrl =
        'https://www.google.com/maps/search/?api=1&query=40.758896,-73.985130';

    return GestureDetector(
      onTap: () async {
        if (await canLaunchUrl(Uri.parse(mapsUrl))) {
          await launchUrl(Uri.parse(mapsUrl));
        }
      },
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            staticMapUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Center(
              child: Text(
                'Map preview is not available.',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
