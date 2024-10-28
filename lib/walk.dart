import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WalksScreen extends StatelessWidget {
  final PageController _pageController = PageController();

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
            Text('Pet Profile', style: TextStyle(color: Colors.black, fontSize: 14)),
            Text('Walks', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
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
      body: Column(
        children: [
          SizedBox(height: 20.0,),
          Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: Center(
                    child:Image.asset("assets/images/Back Cards.png")
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                  child: Positioned(
                    bottom: 10,
                      child: Image.asset("assets/images/Map.png"
                      )
                  ),
                ),
                Positioned(
                  top: 80,
                    left: 140,
                    child: Center(
                        child: Image.asset("assets/images/Shape.png",width: 110,height: 120,))),
                Positioned(
                  top: 100,
                  left: 175,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 26,
                      backgroundImage: AssetImage("assets/images/Chow Chow.jpeg"),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/images/wicon.png"),
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("09.06.2023 | 09:30", style: TextStyle(fontSize: 12)),
                              Text("Morning Walk", style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.directions_walk, color: Colors.green),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          SizedBox(height: 10.0,),
          SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.amber,
              dotColor: Colors.grey,
              dotHeight: 8,
              dotWidth: 8,
              expansionFactor: 2,
            ),
          ),
          SizedBox(height: 60.0,),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: 3, // Replace with actual number of walks
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.only(bottom: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/wicon.png"),
                    ),
                    title: Text("09.06.2023 | 09:30"),
                    subtitle: Text("Morning Walk"),
                    trailing: Icon(Icons.directions_walk, color: Colors.green),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
