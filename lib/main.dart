import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app/pages/explore_page.dart';
import 'package:news_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static const List pages = [HomePage(), ExplorePage()];

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.light, seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Arham News 24/7',
            style: TextStyle(
                fontFamily: "inter", fontSize: 24, color: Colors.blue.shade400),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: MyApp.pages[selectedIndex],
        floatingActionButton: Container(
          margin: const EdgeInsets.only(left: 30),
          decoration: BoxDecoration(
            color: Colors.blue.shade300,
            borderRadius: BorderRadius.circular(100),
          ),
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
                selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
