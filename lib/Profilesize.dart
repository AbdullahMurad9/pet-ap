import 'package:flutter/material.dart';
import 'petweight.dart';
class Profilesize extends StatefulWidget {
  @override
  _ProfilesizeState createState() => _ProfilesizeState();
}

class _ProfilesizeState extends State<Profilesize> {
  final TextEditingController _petname = TextEditingController();
  int _selectedCardIndex = -1; // No card selected by default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Add Pet Profile',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
              Text('Size', style: TextStyle(color: Colors.grey, fontSize: 14)),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              children: [
                Text(
                  'Step',
                  style: TextStyle(color: Colors.black),
                ),
                Row(
                  children: [
                    Text(
                      '5',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      '/9',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress Bar
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: LinearProgressIndicator(
              value: 5 / 9, // Step 5 of 9
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow[700]!),
            ),
          ),
          SizedBox(height: 80),
          Container(
            width: 200,
            height: 130,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/Border Collie.jpeg'),
              radius: 70,
            ),
          ),
          SizedBox(height: 40),
          Column(
            children: [
              Text(
                'What’s your pet’s size?',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                child: Column(
                  children: [
                    Text(
                      'Automatic selection based on your pet’s breed.',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      'Adjust according to reality',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 250, // Set a fixed height for the card view
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.all(16),
                        children: [
                          // Small card
                          _buildCard(0, 'Small', 'under 14kg', 'assets/images/small.png'),
                          // Medium card
                          _buildCard(1, 'Medium', '14-25kg', 'assets/images/medium.png'),
                          // Large card
                          _buildCard(2, 'Large', 'over 25kg', 'assets/images/large.png'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 90.0, right: 20.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          minimumSize: Size(double.infinity, 60), // Full-width button
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PetWeight()),
                          );
                        },
                        child: Text(
                          'Continue',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Method to build a card
  Widget _buildCard(int index, String title, String subtitle, String imagePath) {
    bool isSelected = _selectedCardIndex == index;
    return GestureDetector(

      onTap: () {
        setState(() {
          _selectedCardIndex = index; // Update selected card index
        });
      },
      child: Card(
        elevation: 4,
        margin: EdgeInsets.only(right: 16),
        child: Container(
          width: 200,
          height: 250,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  height: 55,
                  width: 55,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    color: isSelected ? Colors.blue : Colors.grey, // Change color if selected
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 16,
                    color: isSelected ? Colors.blue : Colors.grey, // Change color if selected
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
