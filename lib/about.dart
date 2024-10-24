import 'package:flutter/material.dart';
import 'vaccine.dart';
class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
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
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Pet Profile",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
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
      body: Column(
        children: [
          SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(labels.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        _pageController.animateToPage(index,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? Colors.amber
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Center(
                          child: Text(
                            labels[index],
                            style: TextStyle(
                              color: selectedIndex == index ? Colors.white : Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          // PageView for swiping between sections
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              scrollDirection: Axis.horizontal, // Ensure horizontal scrolling
              children: [
                // About content (scrollable)
                SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(color: Colors.grey[200],),
                        Container(
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30.0,top: 10.0,),
                                    child: Image.asset("assets/images/fr.png",height: 162,width: 162,),
                                  ),
                                  Positioned(
                                    left: 42.0,
                                    top: 22.0,
                                    child: Center(
                                      child: CircleAvatar(
                                        maxRadius:68.0,
                                        backgroundImage: AssetImage("assets/images/Chow Chow.jpeg",), // Replace with your image URL or local asset
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 15.0,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("Maxi",style: TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.w500,fontFamily: 'Nato Sans')),
                                      SizedBox(width: 10.0,),
                                      Image.asset("assets/images/Primary.png")
                                    ],
                                  ),
                                  Text("Dog | Chow Chow",style: TextStyle(color: Colors.grey,fontFamily: 'Nato Sans'),)
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 30.0,),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 33.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Appearance and distinctive signs",style: TextStyle(color: Colors.black,fontFamily: 'Nato Sans',fontWeight: FontWeight.w500)),
                                SizedBox(height: 5.0,),
                                Text("Light brown with white patches",style: TextStyle(color: Colors.grey[600],fontFamily: 'Nato Sans')),
                                SizedBox(height: 14.0,),
                                Row(
                                  children: [
                                    Text("Gender",style: TextStyle(color: Colors.grey[600],fontFamily: 'Nato Sans'),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 33.0),
                                      child: Text("Female",style:TextStyle(color: Colors.black,fontFamily: 'Nato Sans',fontWeight: FontWeight.w500),),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 33.0),
                                  child: Divider(color: Colors.grey[100],),
                                ),
                                SizedBox(height: 10.0,),

                                Row(
                                  children: [
                                    Text("Size",style: TextStyle(color: Colors.grey[600],fontFamily: 'Nato Sans'),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 33.0),
                                      child: Text("Medium",style:TextStyle(color: Colors.black,fontFamily: 'Nato Sans',fontWeight: FontWeight.w500),),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 33.0),
                                  child: Divider(color: Colors.grey[100],),
                                ),

                                SizedBox(height: 10.0,),
                                Row(
                                  children: [
                                    Text("Weight",style: TextStyle(color: Colors.grey[600],fontFamily: 'Nato Sans'),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 33.0),
                                      child: Text("6 kg",style:TextStyle(color: Colors.black,fontFamily: 'Nato Sans',fontWeight: FontWeight.w500),),
                                    )
                                  ],
                                ),
                                SizedBox(height: 15.0,),
                                Text("Important Dates",style: TextStyle(color: Colors.black,
                                  fontFamily: 'Nato Sans',fontWeight: FontWeight.bold,fontSize: 18.0,)),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      right: 20.0,
                                      top: 10.0,
                                    ),
                                    child: Card(
                                      elevation: 4,
                                      child: ListTile(
                                        leading:Image.asset("assets/images/birth.png",height: 42,width: 42,),
                                        title: Text('Birthday'),
                                        subtitle: Text(
                                            '3 November 2019'),
                                        trailing: Text('3 y.o',style: TextStyle(fontWeight: FontWeight.w500),),
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      right: 20.0,
                                      top: 10.0,
                                    ),
                                    child: Card(
                                      elevation: 4,
                                      child: ListTile(
                                        leading:Image.asset("assets/images/birth.png",height: 42,width: 42,),
                                        title: Text('Adoption Day'),
                                        subtitle: Text(
                                            '14 january 2020'),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0,),
                                Text("Caretakers",style: TextStyle(color: Colors.black,
                                  fontFamily: 'Nato Sans',fontWeight: FontWeight.bold,fontSize: 18.0,)),
                                Container(
                                  height: 84,
                                  width: 350,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.3), // Shadow color
                                        blurRadius: 4.0, // Spread radius
                                        offset: Offset(0, 1), // Change x and y offsets to position the shadow
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset("assets/images/Avatar.png",height: 54,width: 54,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0,top: 18.0),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 70.0),
                                              child: Text("Esther Howard",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,
                                                  color: Colors.grey[800],fontFamily: 'Nato Sans'),),
                                            ),
                                            Text("esther.howard@gmail.com",style: TextStyle(fontFamily: 'Nato Sans',
                                                color: Colors.grey[600],fontSize: 14.0),)
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8.0,),
                                Container(
                                  height: 84,
                                  width: 350,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.3), // Shadow color
                                        blurRadius: 4.0, // Spread radius
                                        offset: Offset(0, 1), // Change x and y offsets to position the shadow
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset("assets/images/p.png",height: 54,width: 54,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0,top: 18.0),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 70.0),
                                              child: Text("Guy Hawkins",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,
                                                  color: Colors.grey[800],fontFamily: 'Nato Sans'),),
                                            ),
                                            Text("guyhawkins@gmail.com",style: TextStyle(fontFamily: 'Nato Sans',
                                                color: Colors.grey[600],fontSize: 14.0),)
                                          ],
                                        ),
                                      ),
                                      Stack(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left:50.0),
                                                child: Image.asset("assets/images/minus.png",height: 20,width: 20,),
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.0,),

                                Padding(
                                  padding: EdgeInsets.only( right: 20.0),
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
                                      'Edit',
                                      style: TextStyle(fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0,)
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),

                ),

                // Health content (scrollable)
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                   child: Column(
                     children: [
                     Container(
                     height: 82,
                     width: 350,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20.0),
                       border: Border.all(
                         color: Colors.grey.shade200,
                         width: 1.5,
                       ),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.white.withOpacity(1.0), // Shadow color
                           offset: Offset(0, 1), // Change x and y offsets to position the shadow
                         ),
                       ],
                     ),
                       child: Row(
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(left: 14.0),
                             child: Image.asset("assets/images/inssurance.png",height: 54,width: 54,),
                           ),
                           SizedBox(width: 10.0,),
                           Text("Insurance",style: TextStyle(color: Colors.black,
                               fontWeight: FontWeight.w500,fontFamily: 'Nato Sans'),),
                           Spacer(),
                           Padding(
                             padding: const EdgeInsets.only(right: 13.0),
                             child: Image.asset("assets/images/plus.png",height: 40,width: 40,),
                           ),
                         ],
                       ),

                     ),
                       SizedBox(height: 10.0,),

                       InkWell(
                         onTap: (){
                           Navigator.push(context,
                             MaterialPageRoute(builder:
                             (context)=> Vaccine()
                             ),
                           );
                         },
                         child: Container(
                           height: 82,
                           width: 350,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20.0),
                             border: Border.all(
                               color: Colors.grey.shade200,
                               width: 1.5,
                             ),
                             boxShadow: [
                               BoxShadow(
                                 color: Colors.white.withOpacity(1.0), // Shadow color
                                 offset: Offset(0, 1), // Change x and y offsets to position the shadow
                               ),
                             ],
                           ),
                           child: Row(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(left: 14.0),
                                 child: Image.asset("assets/images/injection.png",height: 54,width: 54,),
                               ),
                               SizedBox(width: 10.0,),
                               Text("Vaccines",style: TextStyle(color: Colors.black,
                                   fontWeight: FontWeight.w500,fontFamily: 'Nato Sans'),),
                               Spacer(),
                               Padding(
                                 padding: const EdgeInsets.only(right: 13.0),
                                 child: Image.asset("assets/images/plus.png",height: 40,width: 40,),
                               ),
                             ],
                           ),

                         ),
                       ),
                       SizedBox(height: 10.0,),

                       Container(
                         height: 82,
                         width: 350,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20.0),
                           border: Border.all(
                             color: Colors.grey.shade200,
                             width: 1.5,
                           ),
                           boxShadow: [
                             BoxShadow(
                               color: Colors.white.withOpacity(1.0), // Shadow color
                               offset: Offset(0, 1), // Change x and y offsets to position the shadow
                             ),
                           ],
                         ),
                         child: Row(
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 14.0),
                               child: Image.asset("assets/images/treatment.png",height: 54,width: 54,),
                             ),
                             SizedBox(width: 10.0,),
                             Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Anti-parasitical ",style: TextStyle(color: Colors.black,
                                     fontWeight: FontWeight.w500,fontFamily: 'Nato Sans'),),
                                 Text("treatments ",style: TextStyle(color: Colors.black,
                                     fontWeight: FontWeight.w500,fontFamily: 'Nato Sans'),),
                               ],
                             ),
                             Spacer(),
                             Padding(
                               padding: const EdgeInsets.only(right: 13.0),
                               child: Image.asset("assets/images/plus.png",height: 40,width: 40,),
                             ),
                           ],
                         ),

                       ),
                       SizedBox(height: 10.0,),

                       Container(
                         height: 82,
                         width: 350,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20.0),
                           border: Border.all(
                             color: Colors.grey.shade200,
                             width: 1.5,
                           ),
                           boxShadow: [
                             BoxShadow(
                               color: Colors.white.withOpacity(1.0), // Shadow color
                               offset: Offset(0, 1), // Change x and y offsets to position the shadow
                             ),
                           ],
                         ),
                         child: Row(
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 14.0),
                               child: Image.asset("assets/images/medical.png",height: 54,width: 54,),
                             ),
                             SizedBox(width: 10.0,),
                             Text("Medical interventions",style: TextStyle(color: Colors.black,
                                 fontWeight: FontWeight.w500,fontFamily: 'Nato Sans'),),
                             Spacer(),
                             Padding(
                               padding: const EdgeInsets.only(right: 13.0),
                               child: Image.asset("assets/images/plus.png",height: 40,width: 40,),
                             ),
                           ],
                         ),

                       ),
                       SizedBox(height: 10.0,),
                       Container(
                         height: 82,
                         width: 350,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20.0),
                           border: Border.all(
                             color: Colors.grey.shade200,
                             width: 1.5,
                           ),
                           boxShadow: [
                             BoxShadow(
                               color: Colors.white.withOpacity(1.0), // Shadow color
                               offset: Offset(0, 1), // Change x and y offsets to position the shadow
                             ),
                           ],
                         ),
                         child: Row(
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 14.0),
                               child: Image.asset("assets/images/other.png",height: 54,width: 54,),
                             ),
                             SizedBox(width: 10.0,),
                             Text("Other treatments",style: TextStyle(color: Colors.black,
                                 fontWeight: FontWeight.w500,fontFamily: 'Nato Sans'),),
                             Spacer(),
                             Padding(
                               padding: const EdgeInsets.only(right: 13.0),
                               child: Image.asset("assets/images/plus.png",height: 40,width: 40,),
                             ),
                           ],
                         ),

                       ),
                       SizedBox(height: 160.0,),
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
                               'Edit',
                               style: TextStyle(fontSize: 16, color: Colors.white),
                             ),
                           ),
                         ),
                       ),
                     ],
                   ),
                  ),
                ),

                // Nutrition content (scrollable)
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        "Nutrition Content",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ),

                // Activities content (scrollable)
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        "Activities Content",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
