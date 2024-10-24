import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'shareprofile.dart';
class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final PageController _pageController = PageController();
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      drawer: Container(
        color: Colors.grey[900],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey[900],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/Avatar.png'),
                          radius: 20,
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello,',
                              style: TextStyle(
                                color: Colors.grey[200],
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Esther',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            _advancedDrawerController.hideDrawer();
                          },
                          child: Image.asset(
                            "assets/images/Vector.png",
                            height: 12,
                            width: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("Your Pets", style: TextStyle(fontSize: 16.0, color: Colors.grey[200])),
            ),
            SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildPetAvatar('assets/images/Chow Chow.jpeg', 'Maxi', true),
                    _buildPetAvatar('assets/images/Boxer.jpeg', 'Fiona', false),
                    _buildAddNewPetButton(),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                width: 222,  // Set the desired width
                height: 0,   // Set the height to 0
                child: Divider(color: Colors.grey[700]), // The divider color
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
              child: Center(
                child: Column(
                  children: [
                    _buildMenuItem(Icons.dashboard, 'Dashboard'),
                    _buildMenuItem(Icons.contacts, 'Contacts'),
                    _buildMenuItem(Icons.calendar_today, 'Calendar'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40.0,),
            Center(
              child: Container(
                width: 222,  // Set the desired width
                height: 0,   // Set the height to 0
                child: Divider(color: Colors.grey[700]), // The divider color
              ),
            ),
            SizedBox(height: 20.0,),
            _buildMenuItem(Icons.person, 'Account'),
            _buildMenuItem(Icons.settings, 'Settings'),
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/Avatar.png'),
                radius: 20,
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello,',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Esther',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () {
                // Add search functionality here
              },
            ),
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  _advancedDrawerController.showDrawer();
                },
              ),
            ),
          ],
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Active pet profiles",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Nato Sans',
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Container(
                      height: 28,
                      width: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "2",
                          style: TextStyle(
                            fontFamily: 'Nato Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                Center(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset("assets/images/Cards.png", height: 200, width: 350),
                          Container(
                            height: 160,
                            width: 350,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: PageView(
                                controller: _pageController,
                                children: [
                                  profileCard('Maxi', 'Dog | Chow Chow', 'assets/images/Chow Chow.jpeg'),
                                  profileCard('Bella', 'Dog | Border Collie', 'assets/images/Border Collie.jpeg'),
                                  profileCard('Charlie', 'Dog | Beagle', 'assets/images/Beagle.jpeg'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
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
                    ],
                  ),
                ),

                SizedBox(height: 90),

                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      buildMenuCardWithArrow(
                        'Share profile',
                        'Easily share your pet’s profile or add a new one',
                      ),
                      buildMenuCardWithBackground(
                        'Nutrition',
                        'assets/images/foodcard.png',
                      ),
                      buildMenuCardWithBackground(
                        'Health Card',
                        'assets/images/carddoctor.png',
                      ),
                      buildMenuCardWithBackground(
                        'Activities',
                        'assets/images/perosncard.png',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget profileCard(String name, String breed, String imagePath) {
    return Container(
      height: 143,
      width: 350,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                breed,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Spacer(),
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(imagePath),
          ),
        ],
      ),
    );
  }

  Widget buildMenuCardWithBackground(String title, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        image: DecorationImage(
          image: AssetImage(imagePath), // Your background image from assets
          fit: BoxFit.cover, // Adjust the fit of the background image as needed
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget buildMenuCardWithArrow(String title, String subtitle) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: InkWell(
              onTap: () {
                // Navigate to Shareprofile screen when button is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Shareprofile(),
                  ),
                );
              },
              child: Icon(Icons.arrow_forward, size: 20, color: Colors.black)
          ),
        ),
      ],
    );
  }



  Widget _buildPetAvatar(String imagePath, String name, bool isActive) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(height: 5),
          Text(name, style: TextStyle(color: isActive ? Colors.white : Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildAddNewPetButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey,
            child: Icon(Icons.add, color: Colors.white),
          ),
          SizedBox(height: 5),
          Text("Add Pet", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }


  Widget _buildMenuItem(IconData icon, String title,) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[200]),
      title: Text(title, style: TextStyle(color: Colors.grey[200])),
      // trailing: hasNotification
      //     ? Container(
      //   padding: EdgeInsets.all(5),
      //   decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
      //   child: Text('!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      // )
      //     : null,
      // onTap: () {
      //   // Handle menu item tap
      // },
    );
  }
}
