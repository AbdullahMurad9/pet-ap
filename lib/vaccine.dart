import 'package:flutter/material.dart';

class Vaccine extends StatefulWidget{

  @override
  _VaccineState createState()=> _VaccineState();
}

class _VaccineState extends State<Vaccine>{
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
  Widget build(BuildContext context){
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
      body:Container(
        
        child: Center(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 120.0,),
                Image.asset("assets/images/gaurd.png"),
                Text("No insurance added",style:TextStyle(color: Colors.black,
                    fontFamily: 'Nato Sans',fontSize: 24.0,fontWeight:FontWeight.w500) ,),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0,right: 20.0,
                  top: 10,bottom: 10.0),
                  child: Text("Our pet insurance plans can help reimburse vet bills related to injuries and illnesses, helping provide a financial safety net for unplanned circumstances.",
                  style: TextStyle(fontSize: 16.0,fontFamily: 'Nato Sans',color: Colors.grey,),),
                ),

              ],
            ),
          ),
        ),
      ),
      

    );
  }
}