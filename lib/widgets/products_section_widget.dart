import 'package:flutter/material.dart';

class ProductsSectionWidget extends StatefulWidget {
  @override
  _ProductsSectionWidgetState createState() => _ProductsSectionWidgetState();
}

class _ProductsSectionWidgetState extends State<ProductsSectionWidget> {
  String _selectedFilter = 'all';

  void _onFilterSelected(String filter) {
    setState(() {
      _selectedFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80.0), // py-20
      color: Colors.white, // bg-white
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0), // px-4
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Our Products & Services',
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
                'Delivering precision-engineered components for the automotive industry with state-of-the-art technology and expert craftsmanship.',
                textAlign: TextAlign.center, // text-center
                style: TextStyle(
                  fontSize: 16, // text-gray-600
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(height: 48), // mb-12
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // To allow horizontal scrolling of filter buttons
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // justify-center
                children: [
                  _buildFilterButton('All', 'all'),
                  _buildFilterButton('Cutting', 'cutting'),
                  _buildFilterButton('Trimming', 'trimming'),
                  _buildFilterButton('Welding', 'welding'),
                  _buildFilterButton('Joining', 'joining'),
                ],
              ),
            ),
            SizedBox(height: 32), // mb-8
            // Product Grid goes here
            // You will need to implement the grid layout and individual product cards
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(String text, String filter) {
    final isSelected = _selectedFilter == filter;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0), // gap-2 (approx)
      child: ElevatedButton(
        onPressed: () => _onFilterSelected(filter),
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.grey[800],
          backgroundColor: isSelected ? Colors.blue[600] : Colors.grey[200], // Conditional text color
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10), // px-4 py-2 (approx)
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4), // rounded-md
            side: BorderSide(
              color: isSelected ? Colors.blue[600]! : Colors.grey[400]!, // Conditional border color
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14, // text-sm
            fontWeight: FontWeight.w500, // font-medium
          ),
        ),
      ),
    );
  }
}
