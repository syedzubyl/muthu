import 'package:flutter/material.dart';
import '../widgets/navigation_bar_widget.dart';
import '../widgets/hero_section_widget.dart';
import '../widgets/products_section_widget.dart';
import '../widgets/services_section_widget.dart';
import '../widgets/testimonials_section_widget.dart';
import '../widgets/location_section_widget.dart';
import '../widgets/contact_section_widget.dart';
import '../widgets/footer_widget.dart'; // Import the new footer widget

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: NavigationBarWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSectionWidget(),
            ProductsSectionWidget(),
            ServicesSectionWidget(),
            TestimonialsSectionWidget(),
            LocationSectionWidget(),
            ContactSectionWidget(),
            FooterWidget(), // Add the footer widget here
          ],
        ),
      ),
    );
  }
}
