import 'package:flutter/material.dart';
import 'about.dart';

class Link extends StatefulWidget{

  @override
  _LinkState createState() => _LinkState();
}

class _LinkState extends State<Link>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      title: Center(
           child:
           Text('Add Profile',style: TextStyle(fontSize: 16.0,fontFamily: 'Nato Sans',color: Colors.black,fontWeight: FontWeight.bold),),
      ),
      ),
      body: SingleChildScrollView(
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
                  padding: const EdgeInsets.only(left: 30.0,top: 20.0,),
                  child: Image.asset("assets/images/fr.png",height: 162,width: 162,),
                ),
              Positioned(
                left: 42.0,
                top: 32.0,
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
              Text("Fiona",style: TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.w500,fontFamily: 'Nato Sans')),
              Text("Felin | European",style: TextStyle(color: Colors.grey,fontFamily: 'Nato Sans'),)
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
                        '3 November 2022'),
                    trailing: Text('1 y.o'),
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
                        '14 February 2023'),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => About()),
                  );
                },
                child: Text(
                  'Add too account',
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
    );
  }
  }
