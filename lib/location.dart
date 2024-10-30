import 'package:flutter/material.dart';
import 'tricks.dart';
class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Morning Walk', style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold)),

            Row(
              children: [
                Image.asset("assets/images/c.png",height: 15,width: 15,),
                SizedBox(width: 5.0,),
                Text('09.06.2023', style: TextStyle(color: Colors.black, fontSize: 15,)),
              ],
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              CircleAvatar(backgroundImage: AssetImage("assets/images/Chow Chow.jpeg"), radius: 20.0),
              SizedBox(width: 8),
              Text("Maxi", style: TextStyle(color: Colors.black)),
            ],
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            // Fullscreen background image
            Image.asset(
              "assets/images/Content.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
                  top: 570.0,
                  left: 50,
                    child:
                    Container(
                      height: 202,
                      width: 327,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                      BoxShadow(
                      color: Colors.white.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                            ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child:
                            Row(
                              children: [
                                SizedBox(width:15.0,),
                                Image.asset("assets/images/wicon.png",height: 46,width: 46,),
                                SizedBox(width: 10.0,),
                                Column(
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
                                    Text("Dog Walker",style: TextStyle(fontSize: 16,color: Colors.grey),),
                                  ],
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Image.asset("assets/images/minus.png",height: 25,width: 25,),
                                ),

                              ],
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text("Start Time",style: TextStyle(fontSize: 16,color: Colors.grey),),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Text("09:30",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text("Distance",style: TextStyle(fontSize: 16,color: Colors.grey),),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Text("2.7 Km",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text("Timer",style: TextStyle(fontSize: 16,color: Colors.grey),),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Text("32:12 min",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

            )
          ],
        ),
      ),
    );
  }
}
