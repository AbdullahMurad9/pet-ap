import 'package:flutter/material.dart';
import 'profilebread.dart';

class ValidationCode extends StatefulWidget {
  @override
  _ValidationCodeState createState() => _ValidationCodeState();
}

class _ValidationCodeState extends State<ValidationCode> {
  double _position = 0.0;
  bool _isCompleted = false;
  double maxSlideDistance =250;

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _position += details.delta.dx;
      if (_position > maxSlideDistance) {
        _position = maxSlideDistance;
        _isCompleted = true;
      } else if (_position < 0) {
        _position = 0;
        _isCompleted = false;
      }
    });
  }

  void _onPanEnd(DragEndDetails details) {
    if (_isCompleted) {
      // Reset _isCompleted before navigating to the next screen
      setState(() {
        _isCompleted = false;
        _position = 0;
      });

      // Navigate to the next screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileBreed()),
      );
    } else {
      // If not completed, reset position
      setState(() {
        _position = 0;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back arrow
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/Avatar.png'),
              radius: 20,
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello,',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Esther',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Add search functionality here
            },
          ),
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              // Add menu functionality here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: 375,
                height: 566,
                child: Image.asset(
                  'assets/images/space.png',
                  height: 344,
                  width: 327,
                ),
              ),
            ),
          ),
          Container(
            width: 310,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.blue[100], // Background color
              borderRadius: BorderRadius.circular(30),
            ),
            child: Stack(
              children: [
                Center(
                  child: Text(
                    "Swipe to continue",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
                Positioned(
                  left: _position,
                  child: GestureDetector(
                    onPanUpdate: _onPanUpdate,
                    onPanEnd: _onPanEnd,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.blue, // Button color
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.double_arrow,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20), // Add some spacing below the slider
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ValidationCode(),
  ));
}
