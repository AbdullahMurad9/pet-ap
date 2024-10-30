import 'package:flutter/material.dart';
import 'package:petapp/Dashboard.dart';
import 'package:petapp/textfield.dart';
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
              PoppinsTextWidget(
                fontsize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade800,
                text: "Add Pet Profile",
              ),
              PoppinsTextWidget(
                fontsize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade600,
                text: "Name",
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0,top: 10),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PoppinsTextWidget(
                  fontsize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade800,
                  text: "Step",
                ),
                Row(
                  children: [
                    PoppinsTextWidget(
                      fontsize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade800,
                      text: "3",
                    ),
                    PoppinsTextWidget(
                      fontsize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade400,
                      text: "/9",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container
          (
          child: Stack(
            children: [
            Column(
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
                  child: Container(
                          width: 385,
                          height: 300,
                          child: SizedBox(
                            height: 150,
                            width: 150,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/Border Collie.jpeg'), // Ensure image format is correct
                              radius: 50, // Adjusted radius for better visibility
                            ),
                          ),
                        ),

                ),
                SizedBox(height: 40),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0), // Side padding
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PoppinsTextWidget(
                        fontsize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade800,
                        text: "What’s your pet’s name?",

                      ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 12.0,bottom: 12.0),
                    child: Container(
                      height: 54,
                      width: 327,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey.shade100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0),
                            offset: Offset(2, 3),
                          ),
                        ],
                      ),
                       child:  Padding(
                          padding: EdgeInsets.all(16.0), // Adjust the padding as needed
                          child: TextField(
                            controller: _petname,
                            // Assign the controller to the TextField
                            decoration: InputDecoration(
                              labelText: 'Your pet’s name',
                              labelStyle: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w400),// Label inside the TextField
                              border: InputBorder.none,
                            ),
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
              Positioned(
                top: 336,
                left: 175,
                child: Center(
                  child: Image.asset(
                    'assets/images/btn.png',
                    height: 46,
                    width: 46,
                  ),
                ),
              ),
      ],
          ),
        ),
      ),

    );
  }
}