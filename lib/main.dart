import 'package:flutter/material.dart';
import 'Createaccount.dart'; // Import the second screen
import 'dart:async';



class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Splash Screen is being built");

    Timer(Duration(seconds: 3), () {
      print("Navigating to Main Screen");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    });

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 30.0,
                top: 50.0,
                right: 20.0,
                bottom: 24.0,
              ),
              width: 400,
              height: 300,
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 180,
                  height: 150,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  right: 64.0,
                  top: 58.0,
                ),
                width: double.infinity,
                child: Center(
                  child: Image.asset(
                    'assets/images/sc.png',
                    width: 500,
                    height: 800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet App',
      home: SplashScreen(),
    );
  }
}
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<Map<String, String>> _sliderData = [
    {
      'title': 'Personalized Pet Profiles',
      'description': 'Create personalized profiles for each of your beloved pets on PawBuddy. Share their name, breed, and age while connecting with a vibrant community.',
    },
    {
      'title': 'Track Your Pet’s Health',
      'description': 'Keep a log of your pet’s health records, from vaccinations to vet visits, all in one place. Stay updated and never miss an important date.',
    },
    {
      'title': 'Join a Community',
      'description': 'Join a growing community of pet lovers. Share tips, stories, and advice, and connect with other pet owners just like you.',
    },
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _sliderData.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/sc.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                      bottom: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 50),
                      // Adding the separator line before the text
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            width: 40,
                            height: 6,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 30),

                      // Slider for both title and description
                      SizedBox(
                        height: 150, // Adjust as per the content
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (int index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                          itemCount: _sliderData.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Text(
                                  _sliderData[index]['title']!,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  _sliderData[index]['description']!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 28),

                      SizedBox(
                        width: 372,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to the second screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Createaccount()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child: Text(
                            'Get started',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          // Define action for "Sign up later"
                        },
                        child: Text(
                          'Sign up later',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle, // Use circular shape for rounded button/icon
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 3,
                    offset: Offset(0, 4), // Offset to place shadow correctly
                  ),
                ],
              ),
              child: Image.asset(
                'assets/images/icon.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}




