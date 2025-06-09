import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Assuming you'll use flutter_svg for icons

class ServicesSectionWidget extends StatelessWidget {
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
              'Our Services',
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
                'We offer comprehensive manufacturing solutions tailored to your specific requirements.',
                textAlign: TextAlign.center, // text-center
                style: TextStyle(
                  fontSize: 16, // text-gray-600
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(height: 48), // mb-12
            // Service Cards Grid
            GridView.count(
              shrinkWrap: true, // Important to prevent unbounded height
              physics: NeverScrollableScrollPhysics(), // Disable scrolling within the grid
              crossAxisCount: _getCrossAxisCount(context), // Responsive column count
              crossAxisSpacing: 32.0, // gap-8 (approx)
              mainAxisSpacing: 32.0, // gap-8 (approx)
              children: [
                _buildServiceCard(
                  context,
                  // Replace with actual SVG data or asset path
                  'M6 6m-3 0a3 3 0 1 0 6 0a3 3 0 1 0 -6 0m0 12m-3 0a3 3 0 1 0 6 0a3 3 0 1 0 -6 0m2.12 -9.88l3.88 3.88m8 -11.88l-11.88 11.88m6.7 -6.7l3.8 3.8',
                  'Precision Cutting',
                  'High-accuracy cutting services for metal parts with tight tolerances.',
                ),
                _buildServiceCard(
                  context,
                  'M6 6m-3 0a3 3 0 1 0 6 0a3 3 0 1 0 -6 0m0 12m-3 0a3 3 0 1 0 6 0a3 3 0 1 0 -6 0m2.12 -9.88l3.88 3.88m8 -11.88l-11.88 11.88m6.7 -6.7l3.8 3.8',
                  'Trimming',
                  'Precision trimming of metal components to exact specifications.',
                ),
                _buildServiceCard(
                  context,
                  'M8.5 14.5A2.5 2.5 0 0 0 11 12c0-1.38-.5-2-1-3-1.072-2.143-.224-4.054 2-6 .5 2.5 2 4.9 4 6.5 2 1.6 3 3.5 3 5.5a7 7 0 1 1-14 0c0-1.153.433-2.294 1-3a2.5 2.5 0 0 0 2.5 2.5z',
                  'Welding',
                  'Expert welding services for strong, durable joints in metal parts.',
                ),
                _buildServiceCard(
                  context,
                  'M19.439 7.85c-.049.322.059.648.289.878l1.568 1.568c.47.47.706 1.087.706 1.704s-.235 1.233-.706 1.704l-1.611 1.611a.98.98 0 0 1-.837.276c-.47-.07-.802-.48-.968-.925a2.501 2.501 0 1 0-3.214 3.214c.446.166.855.497.925.968a.979.979 0 0 1-.276.837l-1.61 1.61a2.404 2.404 0 0 1-1.705.707 2.402 2.402 0 0 1-1.704-.706l-1.568-1.568a1.026 1.026 0 0 0-.877-.29c-.493.074-.84.504-1.02.968a2.5 2.5 0 1 1-3.237-3.237c.464-.18.894-.527.967-1.02a1.026 1.026 0 0 0-.289-.877l-1.568-1.568A2.402 2.402 0 0 1 1.998 12c0-.617.236-1.234.706-1.704L4.23 8.77c.24-.24.581-.353.917-.303.515.077.877.528 1.073 1.01a2.5 2.5 0 1 0 3.259-3.259c-.482-.196-.933-.558-1.01-1.073-.05-.336.062-.676.303-.917l1.525-1.525A2.402 2.402 0 0 1 12 1.998c.617 0 1.234.236 1.704.706l1.568 1.568c.23.23.556.338.877.29.493-.074.84-.504 1.02-.968a2.5 2.5 0 1 1 3.237 3.237c-.464.18-.894-.527-.967 1.02Z',
                  'Joining',
                  'Specialized joining techniques for assembling small automotive components.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to determine the crossAxisCount for GridView
  int _getCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 992) {
      return 4; // lg:grid-cols-4
    } else if (screenWidth > 768) {
      return 2; // md:grid-cols-2
    } else {
      return 1; // Default to 1 column on small screens
    }
  }

  // Helper method to build individual service cards
  Widget _buildServiceCard(
      BuildContext context, String iconPath, String title, String description) {
    return Card(
      // Represents the div with styling for the card
      elevation: 4.0, // shadow-lg
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // rounded-lg
      ),
      child: InkWell(
        // For hover effects and tap
        onTap: () {
          // TODO: Implement service card tap action
        },
        child: Container(
          padding: const EdgeInsets.all(24.0), // p-6
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16.0), // mb-4
                child: SvgPicture.string(
                  // Using SvgPicture.string for inline SVG data
                  '<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-scissors h-10 w-10"><path d="$iconPath"></path></svg>',
                  color: Colors.blue[600], // text-blue-600
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20, // text-xl
                  fontWeight: FontWeight.bold, // font-bold
                ),
              ),
              SizedBox(height: 8.0), // mb-2
              Text(
                description,
                style: TextStyle(
                  fontSize: 16, // text-gray-600
                  color: Colors.grey[600],
                ),
              ),
              // TODO: Implement hover effects (shadow, transform, transition)
            ],
          ),
        ),
      ),
    );
  }
}
