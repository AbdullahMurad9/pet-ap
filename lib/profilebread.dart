import 'package:flutter/material.dart';
import 'package:petapp/textfield.dart';
import 'profilename.dart';
class ProfileBreed extends StatefulWidget {
  @override
  _ProfileBreedState createState() => _ProfileBreedState();
}

class _ProfileBreedState extends State<ProfileBreed> {
  String selectedBreed = '';

  @override
  Widget build(BuildContext context) {
    // List of breeds (replace with actual breed data)
    final List<String> breeds = [
      'Akita',
      'Beagle',
      'Bichon Frise',
      'Border Collie',
      'Boxer',
      'Chow Chow',
      // Add more breeds if needed
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Add back button functionality here
            Navigator.pop(context);
          },
        ),
        title:Center(
          child:
          Column(
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
              text: "Breed",
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
                      text: "2",
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
      body: Column(
        children: [
          // Progress Bar
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: LinearProgressIndicator(
              value: 2 / 9, // Step 2 of 9
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow[700]!),
            ),
          ),
          SizedBox(height: 20),

          // Grid of Breeds
          Expanded(
            child:
            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                childAspectRatio: 1.2,
              ),
              itemCount: breeds.length,
              itemBuilder: (context, index) {
                String breed = breeds[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedBreed = breed;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selectedBreed == breed
                            ? Colors.blue
                            : Colors.transparent,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Card(
                      elevation: 5,// Adds shadow to the card
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),// Rounded corners
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PoppinsTextWidget(
                            fontsize: 14,
                            fontWeight: FontWeight.w600,
                            color: selectedBreed == breed
                                ? Colors.blue
                                : Colors.grey.shade800,
                            text: breed,
                          ),
                          SizedBox(height: 10),
                      Image.asset(
                        'assets/images/$breed.jpeg',
                        width: 145,
                        height: 100,
                        // Ensure image format is correct
                        // Set desired width
                      ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Continue Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    minimumSize: Size(double.infinity, 60), // Full-width button
                  ),
                  onPressed: selectedBreed.isNotEmpty
                      ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileName()),
                      );
                  } : null, // Disable if no breed is selected
                  child:
                  PoppinsTextWidget(
                    fontsize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    text: "Continue",
                  ),
                ),
                SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    // Handle "Skip for now" action
                  },
                  child: Text('Skip for now', style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
          ),
          SizedBox(height: 20), // Add some bottom padding
        ],
      ),
    );
  }
}

