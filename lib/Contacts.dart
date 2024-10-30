import 'package:flutter/material.dart';
import 'viewcontact.dart';
class Contacts extends StatefulWidget{

  @override
  _ContactsState createState() => _ContactsState();

}

class _ContactsState extends State<Contacts>{
  int selectedIndex = 0;

  PageController _pageController = PageController();

  final List<String> labels = ["All", "Caretakers", "Medical Care",];

  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Contacts")),
        backgroundColor: Colors.white,
      ),
      body:
      Column(
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
                        height: 60,
                        width: 140,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 20.0,),
                            Container(
                              height: 80,
                              width: 350,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Colors.grey.shade200,
                                  width: 1.5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.3),
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Image.asset("assets/images/Avatar.png",height: 54,width: 54,),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Esther Howard",style: TextStyle(fontSize: 14,color: Colors.black),),
                                          Text("esther.howard@gmail.com",style: TextStyle(color: Colors.grey),)
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Image.asset("assets/images/sarrow.png",height: 20,width: 20,),
                                  ],
                                ),
                              ),
                            ),
                          SizedBox(height: 10.0,),
                          Container(
                            height: 80,
                            width: 350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                color: Colors.grey.shade200,
                                width: 1.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Image.asset("assets/images/p.png",height: 54,width: 54,),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Guy Hawkins",style: TextStyle(fontSize: 14,color: Colors.black),),
                                        Text("guyhawkins@gmail.com",style: TextStyle(color: Colors.grey),)
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Image.asset("assets/images/sarrow.png",height: 20,width: 20,),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Container(
                            height: 80,
                            width: 350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                color: Colors.grey.shade200,
                                width: 1.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child:
                            Row(
                              children: [
                                SizedBox(width:15.0,),
                                Image.asset("assets/images/doc.png",height: 46,width: 46,),
                                SizedBox(width: 10.0,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: 5.0,),
                                          Text("Martha Roth",style: TextStyle(fontWeight: FontWeight.w500),),
                                          SizedBox(width: 10.0,),
                                          Text("(",style: TextStyle(fontSize: 16,color: Colors.grey),),
                                          Image.asset("assets/images/Star.png",height: 15,width: 15,),
                                          Text("4.9 )",style: TextStyle(fontSize: 16,color: Colors.grey),),

                                        ],
                                      ),
                                      Text("Veterinary Specialist",style: TextStyle(fontSize: 14,color: Colors.grey),),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Image.asset("assets/images/sarrow.png",height: 25,width: 25,),
                                ),

                              ],
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Container(
                            height: 80,
                            width: 350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                color: Colors.grey.shade200,
                                width: 1.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child:
                            Row(
                              children: [
                                SizedBox(width:15.0,),
                                Image.asset("assets/images/wicon.png",height: 46,width: 46,),
                                SizedBox(width: 10.0,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: 5.0,),
                                          Text("Hanna Blair",style: TextStyle(fontWeight: FontWeight.w500),),
                                          SizedBox(width: 10.0,),
                                          Text("(",style: TextStyle(fontSize: 16,color: Colors.grey),),
                                          Image.asset("assets/images/Star.png",height: 15,width: 15,),
                                          Text("3.5 )",style: TextStyle(fontSize: 16,color: Colors.grey),),

                                        ],
                                      ),
                                      Text("Dog Walker",style: TextStyle(fontSize: 14,color: Colors.grey),),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Image.asset("assets/images/sarrow.png",height: 25,width: 25,),
                                ),

                              ],
                            ),
                          ),

                          SizedBox(height: 20.0,),
                          Container(
                            height: 80,
                            width: 350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                color: Colors.grey.shade200,
                                width: 1.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child:
                            Row(
                              children: [
                                SizedBox(width:15.0,),
                                Image.asset("assets/images/av.png",height: 46,width: 46,),
                                SizedBox(width: 10.0,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: 5.0,),
                                          Text("Lana Polor",style: TextStyle(fontWeight: FontWeight.w500),),
                                          SizedBox(width: 10.0,),
                                          Text("(",style: TextStyle(fontSize: 16,color: Colors.grey),),
                                          Image.asset("assets/images/Star.png",height: 15,width: 15,),
                                          Text("4.7 )",style: TextStyle(fontSize: 16,color: Colors.grey),),

                                        ],
                                      ),
                                      Text("Pet Behavior Trainer",style: TextStyle(fontSize: 14,color: Colors.grey),),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Image.asset("assets/images/sarrow.png",height: 25,width: 25,),
                                ),

                              ],
                            ),
                          ),
                          SizedBox(height: 150.0,),
                          SizedBox(
                            height: 74,
                            width: 350,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>ContactDetailPage()));
                                },
                                icon: Icon(Icons.add),
                                label: Text("Add new Contact"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                ),

                // Health content (scrollable)
                SingleChildScrollView(

                ),

                SingleChildScrollView(
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}