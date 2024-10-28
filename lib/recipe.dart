import 'package:flutter/material.dart';

class Recipe extends StatelessWidget {
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
            Text('Recipes', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          Row(
            children: [
              CircleAvatar(backgroundImage: AssetImage("assets/images/Chow Chow.jpeg"), radius: 20.0),
              Text("Maxi", style: TextStyle(color: Colors.black)),
            ],
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Recipe card grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  buildRecipeCard('Doggy Meatloaf with Vegetables', 'assets/images/meat.png'),
                  buildRecipeCard('Peanut Butter and Banana Biscuits', 'assets/images/butter.png'),
                  buildRecipeCard('Blueberry Cream Cupcake', 'assets/images/cake.png'),
                ],
              ),
            ),
            // Add Recipe Button
            SizedBox(
              height: 74,
              width: 327,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Navigate to Add Recipe Page
                  },
                  icon: Icon(Icons.add),
                  label: Text("Add recipe"),
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
    );
  }

  Widget buildRecipeCard(String title, String imagePath) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              imagePath,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
