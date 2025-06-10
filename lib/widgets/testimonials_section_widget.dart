import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Assuming you'll use flutter_svg for stars

class TestimonialsSectionWidget extends StatefulWidget {
  @override
  _TestimonialsSectionWidgetState createState() =>
      _TestimonialsSectionWidgetState();
}

class _TestimonialsSectionWidgetState extends State<TestimonialsSectionWidget> {
  // TODO: Implement state management for pagination

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
              'Client Testimonials',
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
                'What our clients say about our precision manufacturing services.',
                textAlign: TextAlign.center, // text-center
                style: TextStyle(
                  fontSize: 16, // text-gray-600
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(height: 48), // mb-12
            Container(
              // relative max-w-4xl mx-auto
              constraints: BoxConstraints(maxWidth: 900), // max-w-4xl (approx)
              child: Card(
                // rounded-lg border bg-card text-card-foreground border-none shadow-xl
                elevation: 8.0, // shadow-xl
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // rounded-lg
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32.0), // p-8
                  child: Column(
                    children: [
                      Row(
                        // flex flex-col md:flex-row gap-6 items-center
                        mainAxisAlignment: MainAxisAlignment.center, // Added for centering in Column
                        children: [
                          // Client Image
                          Container(
                            // relative w-24 h-24 rounded-full overflow-hidden shrink-0
                            width: 96, // w-24
                            height: 96, // h-24
                            margin: EdgeInsets.only(right: 24.0), // gap-6 (approx)
                            decoration: BoxDecoration(
                              shape: BoxShape.circle, // rounded-full
                              image: DecorationImage(
                                image: NetworkImage(
                                  './resource/placeholder-user.jpg', // Replace with actual image path
                                ),
                                fit: BoxFit.cover, // object-cover
                              ),
                            ),
                          ),
                          // Testimonial Content
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Rating (Stars)
                                Row(
                                  // flex items-center mb-2
                                  children: [
                                    _buildStarIcon(Colors.yellow[400]!),
                                    _buildStarIcon(Colors.yellow[400]!),
                                    _buildStarIcon(Colors.yellow[400]!),
                                    _buildStarIcon(Colors.yellow[400]!),
                                    _buildStarIcon(Colors.grey[400]!),
                                  ],
                                ),
                                SizedBox(height: 8.0), // mb-2
                                // Quote
                                Text(
                                  '"Precision Machine Works delivered exceptional quality components for our new vehicle line. Their attention to detail and precision cutting services exceeded our expectations."',
                                  style: TextStyle(
                                    fontSize: 16, // text-gray-700
                                    color: Colors.grey[700],
                                    fontStyle: FontStyle.italic, // italic
                                  ),
                                ),
                                SizedBox(height: 16.0), // mb-4
                                // Client Name and Title
                                Text(
                                  'Automotive Solutions Inc.',
                                  style: TextStyle(
                                    fontSize: 18, // font-bold text-lg
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4.0), // mt-1 (approx)
                                Text(
                                  'Car Manufacturer',
                                  style: TextStyle(
                                    fontSize: 16, // text-gray-600
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.0), // mt-6
            // Pagination (Placeholders)
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // justify-center
              children: [
                _buildPaginationButton(Icons.chevron_left, () {
                  // TODO: Implement previous testimonial
                }),
                _buildPaginationButton(null, () {
                  // TODO: Implement jump to page 1
                }, pageNumber: 1, isSelected: true),
                _buildPaginationButton(null, () {
                  // TODO: Implement jump to page 2
                }, pageNumber: 2),
                _buildPaginationButton(null, () {
                  // TODO: Implement jump to page 3
                }, pageNumber: 3),
                _buildPaginationButton(Icons.chevron_right, () {
                  // TODO: Implement next testimonial
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build star icons
  Widget _buildStarIcon(Color color) {
    return Icon(
      Icons.star,
      size: 20, // h-5 w-5
      color: color,
    );
  }

  // Helper method to build pagination buttons
  Widget _buildPaginationButton(IconData? icon, VoidCallback onPressed,
      {int? pageNumber, bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0), // gap-2 (approx)
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.grey[800],
          backgroundColor: isSelected ? Colors.blue[600] : Colors.white, // Conditional text color
          shape: CircleBorder(
            side: BorderSide(
              color: isSelected ? Colors.blue[600]! : Colors.grey[400]!, // Conditional border color
            ),
          ),
          padding: EdgeInsets.all(0), // Remove default padding
          minimumSize: Size(40, 40), // h-10 w-10
        ),
        child: icon != null
            ? Icon(icon, size: 20) // h-5 w-5
            : Text(
                pageNumber!.toString(),
                style: TextStyle(
                  fontSize: 14, // text-sm
                  fontWeight: FontWeight.w500, // font-medium
                ),
              ),
      ),
    );
  }
}
