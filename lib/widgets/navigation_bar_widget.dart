import 'package:flutter/material.dart';

class NavigationBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[900],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              text: 'Precision',
              style: TextStyle(
                color: Colors.blue[400],
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              children: const <TextSpan>[
                TextSpan(
                  text: ' Machine Works',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // This part needs to be handled based on screen size in Flutter.
          // For simplicity, I'm showing a basic row for larger screens.
          // You would typically use a responsive layout builder for this.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  // TODO: Implement navigation to Home section
                },
                child: Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Implement navigation to Products section
                },
                child: Text(
                  'Products',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Implement navigation to Services section
                },
                child: Text(
                  'Services',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Implement navigation to Portfolio section
                },
                child: Text(
                  'Portfolio',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Implement navigation to About section
                },
                child: Text(
                  'About',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Implement navigation to Contact section
                },
                child: Text(
                  'Contact',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          // Hamburger icon for smaller screens would be implemented here,
          // typically within a Builder or using a responsive layout.
        ],
      ),
    );
  }
}
