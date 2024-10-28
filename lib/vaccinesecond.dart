import 'package:flutter/material.dart';
import 'vaccine.dart';
import 'vaccinethird.dart';

class InsuranceScreen extends StatelessWidget {
  int selectedIndex = 0;
  PageController _pageController = PageController();

  final List<String> labels = ["About", "Health", "Nutrition", "Activities"];

  String selectedPet = 'Maxi'; // Initially selected pet

  // List of pet names
  List<String> pets = ['Maxi', 'Fiona'];

  // Map of pet names to their corresponding avatar image names
  Map<String, String> petAvatars = {
    'Maxi': 'Chow Chow',
    'Fiona': 'Boxer',
  };

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showInsuranceDetails(context);
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pet Profile",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            Text(
              "Insurance",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          DropdownButton<String>(
            value: selectedPet,
            icon: Icon(Icons.arrow_drop_down, color: Colors.black),
            onChanged: (String? newValue) {},
            items: pets.map<DropdownMenuItem<String>>((String pet) {
              return DropdownMenuItem<String>(
                value: pet,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/${petAvatars[pet]}.jpeg'),
                    ),
                    SizedBox(width: 10),
                    Text(pet),
                  ],
                ),
              );
            }).toList(),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 120.0),
              Image.asset("assets/images/gaurd.png"),
              Text(
                "No insurance added",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Nato Sans',
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 20.0, top: 10, bottom: 10.0),
                child: Text(
                  "Our pet insurance plans can help reimburse vet bills related to injuries and illnesses, helping provide a financial safety net for unplanned circumstances.",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Nato Sans',
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showInsuranceDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: 600,
          width: 500,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 4,
                    width: 50,
                    color: Colors.grey.shade500,
                  ),
                ),
                SizedBox(height: 10.0,),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Vaccine()));
                      },
                    ),
                    Expanded(
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'Add Insurance',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Package Details',
                              style: TextStyle(fontSize: 12,),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "Step",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w500

                          ),
                        ),
                        Row(
                          children: [
                            Text("2",style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.w500
                            ),),
                            Text("/"),
                            Text("3"),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: LinearProgressIndicator(
                    value: 2 / 3,
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow[700]!),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Comfy Pack',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),

                // Scrollable detail rows
                Expanded(
                  child: SingleChildScrollView(

                    child: Column(
                      children: [

                        _buildDetailRow('Accidents and Injuries', '\$ 20.000'),
                        SizedBox(height: 10.0,),
                        _buildDetailRow('Illnesses and Conditions', '\$ 20.000'),
                        SizedBox(height: 10.0,),
                        _buildDetailRow('Exams and Prescriptions', '\$ 10.000'),
                        SizedBox(height: 10.0,),
                        _buildDetailRow('Procedures and Diagnostics', '\$ 10.000'),
                        SizedBox(height: 10.0,),
                        _buildDetailRow('Holistic/Alternative Therapies', '\$ 3.000'),
                        SizedBox(height: 10.0,),
                        _buildDetailRow('Other Emergencies', '\$ 3.000'),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>Insurance()),);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    minimumSize: Size(double.infinity, 50), // Full width button
                  ),
                  child: Text('Next', style: TextStyle(fontSize: 18,color: Colors.white)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(String title, String price) {
    return
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.2), // Shadow color
              offset: Offset(0, 1), // Change x and y offsets to position the shadow
            ),
          ],
        ),
        child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              price,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
            ),
      );
  }
}
