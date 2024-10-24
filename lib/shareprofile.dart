import 'package:flutter/material.dart';
import 'Qrcode.dart';
class Shareprofile extends StatefulWidget {
  @override
  _ShareprofileState createState() => _ShareprofileState();
}

class _ShareprofileState extends State<Shareprofile> {
  bool isGenerateCodeSelected = true; // Track which button is selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            'Sharing profiles',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 50.0,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 62,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(
                  color: Colors.grey.shade100,
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200.withOpacity(0.5), // Shadow color
                    offset: Offset(0, 1), // Change x and y offsets to position the shadow
                  ),
                ],
              ),
              child:
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Generate Code Button
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isGenerateCodeSelected = true; // Mark this as selected
                        });
                      },
                      child: Container(

                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        decoration: BoxDecoration(
                          color: isGenerateCodeSelected ? Colors.amber : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Text(
                          'Generate Code',
                          style: TextStyle(
                            color: isGenerateCodeSelected ? Colors.white : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    // Scan Code Button
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isGenerateCodeSelected = false; // Mark this as selected
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        decoration: BoxDecoration(
                          color: isGenerateCodeSelected ? Colors.grey.shade200 : Colors.amber,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QRCodeScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Scan Code',
                            style: TextStyle(
                              color: isGenerateCodeSelected ? Colors.grey : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          // Pet profile 1: Maxi
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder:(context)=>QRCodeScreen(),),);
            },
            child: Container(
              height: 84,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: Colors.grey.shade200,
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(1.0), // Shadow color
                    blurRadius: 4.0, // Spread radius
                    offset: Offset(0, 4), // Change x and y offsets to position the shadow
                  ),
                ],
              ),
              child: Center(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/Chow Chow.jpeg'), // Use a placeholder or network image
                    radius: 30,
                  ),
                  title: Text('Maxi'),
                  subtitle: Text('Dog | Border Collie'),
                  trailing: Icon(Icons.male, color: Colors.blue),
                ),
              ),
            ),
          ),
          // Pet profile 2: Fiona
          SizedBox(height: 15.0,),
          Container(
            height: 84,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: Colors.grey.shade200,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(1.0), // Shadow color
                  blurRadius: 4.0, // Spread radius
                  offset: Offset(0, 4), // Change x and y offsets to position the shadow
                ),
              ],
            ),
            child: Center(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Boxer.jpeg'), // Use a placeholder or network image
                  radius: 30,
                ),
                title: Text('Fiona'),
                subtitle: Text('Feline | European'),
                trailing: Icon(Icons.female, color: Colors.pink),
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Generate a QR code and invite link for each pet and easily synchronize data with other users',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
