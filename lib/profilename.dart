import 'package:flutter/material.dart';
import 'package:petapp/Dashboard.dart';
import 'Profilesize.dart';
class ProfileName extends StatefulWidget {
  @override
  _ProfileNameState createState() => _ProfileNameState();
}

class _ProfileNameState extends State<ProfileName> {

  final TextEditingController _petname = TextEditingController();

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
              Text('Add Pet Profile', style: TextStyle(color: Colors.black,fontSize:18)),
              Text('Name', style: TextStyle(color: Colors.grey, fontSize: 14)),
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
                    Text('3',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text('/9',
                      style: TextStyle(color: Colors.grey),

                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Progress Bar
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: LinearProgressIndicator(
                value: 3 / 9, // Step 2 of 9
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow[700]!),
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: Stack(
                alignment: Alignment.center, // Aligns all children to the center
                children: [
                  // Removed fixed height constraints to prevent overflow
                  Container(
                    width: 385,
                    height: 300,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/images/Border Collie.jpeg'), // Ensure image format is correct
                      radius: 70, // Adjusted radius for better visibility
                    ),
                  ),
                  Positioned(
                    bottom: -20.0,
                    child: Center(
                      child: Image.asset(
                        'assets/images/btn.png',
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0), // Side padding
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'What’s your pet’s name?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0), // Adjust the padding as needed
                    child: TextField(
                      controller: _petname,
                      // Assign the controller to the TextField
                      decoration: InputDecoration(
                        labelText: 'Your pet’s name', // Label inside the TextField
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0), // Rounded corners
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 80),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 100.0,
                    ), // Adjust the padding as needed
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        minimumSize: Size(double.infinity, 60), // Full-width button
                      ),
                      onPressed: () {
                        // Check if the pet name is empty
                        if (_petname.text.isEmpty) {
                          // Show a snackbar if the name is empty
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please enter your pet’s name'), // Snackbar message
                              duration: Duration(seconds: 2), // Duration to show the snackbar
                            ),
                          );
                        } else {
                          // Navigate to the next screen if the name is provided
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Profilesize()),
                          );
                        }
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
      ),

    );
  }
}