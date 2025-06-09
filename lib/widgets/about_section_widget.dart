import 'package:flutter/material.dart';

class AboutSectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80.0), // py-20
      // No background color specified in HTML, using transparent
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0), // px-4
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Responsive layout: image and text side-by-side on medium/large screens, stacked on small screens
            MediaQuery.of(context).size.width > 768 // md breakpoint
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image
                      Expanded(
                        flex: 1, // md:w-1/2
                        child: Container(
                          margin: const EdgeInsets.only(right: 32.0), // md:pr-8 (approx)
                          child: AspectRatio(
                            aspectRatio: 16 / 9, // aspect-video
                            child: ClipRRect(
                              // rounded-lg overflow-hidden
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                './resource/placeholder(9).svg', // Replace with actual image path
                                fit: BoxFit.cover, // object-cover
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Text Content
                      Expanded(
                        flex: 1, // md:w-1/2
                        child: _buildAboutContent(),
                      ),
                    ],
                  )
                : Column(
                    // Stacked on small screens
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Image
                      Container(
                        margin: const EdgeInsets.only(bottom: 32.0), // mb-8
                        child: AspectRatio(
                          aspectRatio: 16 / 9, // aspect-video
                          child: ClipRRect(
                            // rounded-lg overflow-hidden
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              './resource/placeholder(9).svg', // Replace with actual image path
                              fit: BoxFit.cover, // object-cover
                            ),
                          ),
                        ),
                      ),
                      // Text Content
                      _buildAboutContent(),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Our Company',
          style: TextStyle(
            fontSize: 28, // text-3xl (adjust for responsiveness)
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 24), // mb-6
        Text(
          'With over 15 years of experience in the automotive parts manufacturing industry, we specialize in precision machining services for small components.',
          style: TextStyle(
            fontSize: 16, // text-gray-600
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 16), // mb-4
        Text(
          'Our state-of-the-art facility is equipped with the latest technology to deliver high-quality results with tight tolerances.',
          style: TextStyle(
            fontSize: 16, // text-gray-600
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 16), // mb-4
        Text(
          'We serve automotive manufacturers and suppliers across the region, providing reliable and cost-effective solutions.',
          style: TextStyle(
            fontSize: 16, // text-gray-600
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 24), // mb-6
        // Stats Grid
        GridView.count(
          shrinkWrap: true, // Important for nested GridView
          physics: NeverScrollableScrollPhysics(), // Disable scrolling
          crossAxisCount: 2, // grid-cols-2
          crossAxisSpacing: 16.0, // gap-4
          mainAxisSpacing: 16.0, // gap-4
          childAspectRatio: 2.0, // Adjust as needed to fit content
          children: [
            _buildStatCard('15+', 'Years Experience'),
            _buildStatCard('500+', 'Projects Completed'),
            _buildStatCard('50+', 'Team Members'),
            _buildStatCard('100+', 'Happy Clients'),
          ],
        ),
      ],
    );
  }

  // Helper method to build individual stat cards
  Widget _buildStatCard(String count, String label) {
    return Container(
      padding: const EdgeInsets.all(16.0), // p-4
      decoration: BoxDecoration(
        color: Colors.grey[100], // bg-gray-100
        borderRadius: BorderRadius.circular(8.0), // rounded-lg
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count,
            style: TextStyle(
              fontSize: 18, // font-bold text-lg
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.0), // mb-1
          Text(
            label,
            style: TextStyle(
              fontSize: 16, // text-gray-600
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
