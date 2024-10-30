import 'package:flutter/material.dart';
import 'package:petapp/textfield.dart';
import 'date.dart';
import 'board.dart';
class Caretakers extends StatefulWidget {
  @override
  _CaretakerState createState() => _CaretakerState();
}

class _CaretakerState extends State<Caretakers> {

  @override
  Widget build(BuildContext context) {
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
                text: "Caretakers",
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
                      text: "9",
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
              value: 9/ 9, // Step 5 of 9
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow[700]!),
            ),
          ),
          SizedBox(height: 80),
          Container(
            width: 200,
            height: 130,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/Border Collie.jpeg'),
              radius: 70,
            ),
          ),
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              height: 64,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.grey.shade200,
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.3), // Shadow color
                    offset: Offset(0, 4), // Change x and y offsets to position the shadow
                  ),
                ],
              ),
              child: Center(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Image.asset(
                        "assets/images/search.png",
                        height: 20,
                        width: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child:
                      PoppinsTextWidget(
                        fontsize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600,
                        text: "Search by name, tag, email...",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Added contacts",style: TextStyle(fontSize: 14,fontFamily: 'Nato Sans',
                    fontWeight: FontWeight.w500, color: Colors.grey[800],
                ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            height: 84,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.grey.shade200,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5), // Shadow color
                  blurRadius: 4.0, // Spread radius
                  offset: Offset(0, 4), // Change x and y offsets to position the shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Image.asset("assets/images/p.png",height: 54,width: 54,),
                ),
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
          SizedBox(height: 185.0,),
          Padding(
              padding: EdgeInsets.all( 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  minimumSize: Size(
                      double.infinity, 60), // Full-width button
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Board()),
                  );
                },
                child:
                PoppinsTextWidget(
                  fontsize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  text: "Continue",
                ),
              ),
            ),

        ],
      ),
    );
    }
  }