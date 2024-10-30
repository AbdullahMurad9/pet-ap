import 'package:flutter/material.dart';
import 'vaccinesecond.dart';

class Vaccine extends StatefulWidget {
  @override
  _VaccineState createState() => _VaccineState();
}

class _VaccineState extends State<Vaccine> {
  int selectedIndex = 0;
  String selectedPackage = 'Comfy Pack'; // Initially selected insurance pack

  final List<String> labels = ["About", "Health", "Nutrition", "Activities"];
  String selectedPet = 'Maxi'; // Initially selected pet

  // List of pet names
  List<String> pets = ['Maxi', 'Fiona'];

  // Map of pet names to their corresponding avatar image names
  Map<String, String> petAvatars = {
    'Maxi': 'Chow Chow',
    'Fiona': 'Boxer',
  };

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                  height: 4,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Vaccine()));
                      },

                      child: Image.asset("assets/images/arrow.png",height: 20,width: 20,)),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(
                            "Add Insurance",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          Text(
                            "Packages",
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  Padding(
                    padding: const EdgeInsets.only(left: 56.0),
                    child: Column(
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
                            Text("1",style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.w500
                            ),),
                            Text("/"),
                            Text("2"),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: LinearProgressIndicator(
                  value: 1/ 3,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow[700]!),
                ),
              ),
              SizedBox(height: 20.0),
              SingleChildScrollView(
              child: Column(children: [
        _buildInsurancefirst(
                context,
                title: 'Basic Pack',
                price: '\$20 / month',
                isSelected: selectedPackage == 'Basic Pack',
                onTap: () {
                  setState(() {
                    selectedPackage = 'Basic Pack';
                  });
                  Navigator.pop(context);
                  _showBottomSheet(context); // Reopen to reflect change
                },
              ),
              _buildInsurancesecond(
                context,
                title: 'Comfy Pack',
                price: '\$25 / month',
                isSelected: selectedPackage == 'Comfy Pack',
                onTap: () {
                  setState(() {
                    selectedPackage = 'Comfy Pack';
                  });
                  Navigator.pop(context);
                  _showBottomSheet(context); // Reopen to reflect change
                },
              ),
              _buildInsurancethird(
                context,
                title: 'King Pack',
                price: '\$35 / month',
                isSelected: selectedPackage == 'King Pack',
                onTap: () {
                  setState(() {
                    selectedPackage = 'King Pack';
                  });
                  Navigator.pop(context);
                  _showBottomSheet(context); // Reopen to reflect change
                },
              ),
        ],
        ),
              ),
              SizedBox(height: 35.0),
              Center(
                child: Padding(
                  padding: EdgeInsets.only( left:10.0,right: 15.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: Size(
                          double.infinity, 60), // Full-width button
                    ),
                    onPressed: () {

                    },
                    child: Text(
                      'Next',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInsurancefirst(
      BuildContext context, {
        required String title,
        required String price,
        required bool isSelected,
        required Function onTap,
      }) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: 70.0,
        width: 400.0,
        margin: EdgeInsets.only(bottom: 15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: 2.0,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Stack(children: [

                Image.asset("assets/images/border.png",height: 70,width: 70,
                  color: isSelected ? Colors.blue: Colors.grey[700],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Center(child: Image.asset("assets/images/um.png",height: 35,width: 35,
                    color: isSelected ? Colors.blue: Colors.grey[700],

                  )),
                ),

          ],
        ),
        ),
            Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    color: isSelected ? Colors.blue : Colors.grey,

                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Text(
                    price,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                              ),
                ),
            // if (isSelected)
            //   Icon(
            //     Image.,
            //     color: Colors.blue,
            //     size: 24,
            //   ),
          ],
        ),
      ),
    );
  }
  Widget _buildInsurancesecond(
      BuildContext context, {
        required String title,
        required String price,
        required bool isSelected,
        required Function onTap,
      }) {
    return GestureDetector(
      onTap: () => onTap(),
      child: InkWell(
        onTap: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>InsuranceScreen()
              ));
        },
        child: Container(
          height: 70.0,
          width: 400.0,
          margin: EdgeInsets.only(bottom: 15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: isSelected ? Colors.blue : Colors.grey.shade300,
              width: 2.0,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Stack(children: [
                  Image.asset("assets/images/border.png",height: 70,width: 70,
                    color: isSelected ? Colors.blue : Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Center(child: Image.asset("assets/images/u.png",height: 40,width: 40,
                      color: isSelected ? Colors.blue : Colors.grey[700],
                    )),
                  ),
                ],
                ),
              ),
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: isSelected ? Colors.blue : Colors.grey,
                    ),
                  ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Text(
                  price,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildInsurancethird(
      BuildContext context, {
        required String title,
        required String price,
        required bool isSelected,
        required Function onTap,
      }) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: 70.0,
        width: 400.0,
        margin: EdgeInsets.only(bottom: 15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: 2.0,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Stack(children: [

                Image.asset("assets/images/border.png",height: 70,width: 70,
                  color: isSelected ? Colors.blue : Colors.grey,

                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Center(child: Image.asset("assets/images/crown.png",height: 40,width: 40,
                      color: isSelected ? Colors.blue : Colors.grey[700],
                  )),
                ),
              ],
              ),
            ),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    color: isSelected ? Colors.blue : Colors.grey,

                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Text(
                    price,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
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
            onChanged: (String? newValue) {
              setState(() {
                selectedPet = newValue!;
              });
            },
            items: pets.map<DropdownMenuItem<String>>((String pet) {
              return DropdownMenuItem<String>(
                value: pet,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/images/${petAvatars[pet]}.jpeg'),
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
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 40.0, right: 20.0, top: 10, bottom: 10.0),
                child: Text(
                  "Our pet insurance plans can help reimburse vet bills related to injuries and illnesses, helping provide a financial safety net for unplanned circumstances.",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Nato Sans',
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 120.0),
              GestureDetector(
                onTap: () {
                  _showBottomSheet(context);
                },
                child:
                Container(
                  height: 64,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.blue.shade500,
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.3),
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/plus.png",
                        height: 40,
                        width: 40,
                      ),
                      Text(
                        "Add insurance",
                        style: TextStyle(
                          color: Colors.blue.shade500,
                          fontFamily: 'Nato Sans',
                          fontSize: 16.0,
                        ),
                      )
                    ],
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
