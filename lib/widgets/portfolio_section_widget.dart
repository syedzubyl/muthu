import 'package:flutter/material.dart';

class PortfolioSectionWidget extends StatefulWidget {
  @override
  _PortfolioSectionWidgetState createState() => _PortfolioSectionWidgetState();
}

class _PortfolioSectionWidgetState extends State<PortfolioSectionWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
              'Our Portfolio',
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
                'Explore our previous projects and see the quality of our work.',
                textAlign: TextAlign.center, // text-center
                style: TextStyle(
                  fontSize: 16, // text-gray-600
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(height: 48), // mb-12
            Container(
              // w-full max-w-4xl mx-auto
              constraints: BoxConstraints(maxWidth: 900), // max-w-4xl (approx)
              child: Column(
                children: [
                  TabBar(
                    controller: _tabController,
                    labelColor: Colors.blue[600], // Active tab text color
                    unselectedLabelColor: Colors.grey[800], // Inactive tab text color
                    indicatorColor: Colors.blue[600], // Indicator color
                    tabs: [
                      Tab(text: 'Automotive'),
                      Tab(text: 'Aerospace'),
                      Tab(text: 'Industrial'),
                    ],
                  ),
                  SizedBox(height: 32), // mb-8
                  Container(
                    // This container holds the TabBarView and manages its height
                    height: _getPortfolioGridHeight(context), // Adjust height as needed
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // Automotive Portfolio Grid
                        _buildPortfolioGrid('Automotive'),
                        // Aerospace Portfolio Grid
                        _buildPortfolioGrid('Aerospace'),
                        // Industrial Portfolio Grid
                        _buildPortfolioGrid('Industrial'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to determine the height of the portfolio grid based on content
  double _getPortfolioGridHeight(BuildContext context) {
    // This is a placeholder. You'll need to calculate the actual height
    // based on the number of items in the grid and the item height.
    // For simplicity, returning a fixed height here.
    return 600.0; // Adjust this value as needed
  }

  // Helper method to build the portfolio grid for a given category
  Widget _buildPortfolioGrid(String category) {
    // This is where you'll fetch and display portfolio items based on the category.
    // For simplicity, returning a placeholder grid here.
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: _getCrossAxisCount(context), // Responsive column count
      crossAxisSpacing: 24.0, // gap-6 (approx)
      mainAxisSpacing: 24.0, // gap-6 (approx)
      children: [
        // TODO: Build individual portfolio item cards here
        // You'll need to create a separate widget for the portfolio item card
        Text('Portfolio items for $category'), // Placeholder
      ],
    );
  }

  // Helper method to determine the crossAxisCount for GridView
  int _getCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 992) {
      return 3; // lg:grid-cols-3
    } else if (screenWidth > 768) {
      return 2; // md:grid-cols-2
    } else {
      return 1; // Default to 1 column on small screens
    }
  }
}
