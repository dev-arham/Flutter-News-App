import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'explore_page.dart';
import 'trending_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final List<Widget> pages = const [TrendingPage(), ExplorePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Arham News 24/7',
          style: TextStyle(
              fontFamily: "inter", fontSize: 24, color: Colors.blue.shade400),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: pages[selectedIndex], // Displays the selected page
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade300,
          borderRadius: BorderRadius.circular(100),
        ),
        padding: const EdgeInsets.all(8),
        child: GNav(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          rippleColor: Colors.grey.shade500,
          hoverColor: Colors.grey.shade300,
          activeColor: Colors.black,
          iconSize: 24,
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: Colors.white,
          color: Colors.black,
          tabMargin: const EdgeInsets.all(5),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          tabs: const [
            GButton(
              icon: Icons.flash_on_outlined,
              text: 'Trending',
            ),
            GButton(
              icon: Icons.compass_calibration_outlined,
              text: 'Explore',
            ),
          ],
          selectedIndex: selectedIndex,
          onTabChange: (index) {
            setState(() {
              selectedIndex = index; // Updates the selected tab index
            });
          },
        ),
      ),
    );
  }
}
