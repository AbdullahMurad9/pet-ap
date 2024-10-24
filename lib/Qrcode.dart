import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:math';
import 'link.dart';
class QRCodeScreen extends StatefulWidget {
  @override
  _QRCodeScreenState createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  String _randomData = '';

  @override
  void initState() {
    super.initState();
    _generateRandomData();
  }

  void _generateRandomData() {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    Random random = Random();
    _randomData = List.generate(10, (index) => characters[random.nextInt(characters.length)]).join();

    // Update the state to display the new QR code
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Column(
            children: [
              Text('Sharing profiles',style: TextStyle(fontSize: 16.0,fontFamily: 'Nato Sans',color: Colors.grey[800]),),
              Text("Maxi",style: TextStyle(fontSize: 12.0,fontFamily: 'Nato Sans',color: Colors.grey[800]),),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _generateRandomData,
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
    // decoration: BoxDecoration(
    // borderRadius: BorderRadius.circular(30.0),
    // border: Border.all(
    // color: Colors.grey.shade200,
    // width: 1.5,
    // ),),
        child: Center(
            child: Stack(
              children: [


                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30,),
                    Container(
                     height: 400,
                     width: 350,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(30.0),
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
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [

                     SizedBox(height: 15),

                     // Name below the profile picture
                     Text(
                       'Maxi',
                       style: TextStyle(fontSize: 20,),
                     ),

                     // QR Code with generated random data
                     QrImageView(
                       data: _randomData,
                       version: QrVersions.auto,
                       size: 280,
                       gapless: false,
                     ),
                       ],
                     ),
                                      ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 140,  // Set the desired width
                          height: 0,   // Set the height to 0
                          child: Divider(color: Colors.grey[300]), // The divider color
                        ),
                        SizedBox(width: 5.0,),
                        Text("or",style: TextStyle(color: Colors.grey[600],fontSize: 14.0,)),
                        SizedBox(width: 5.0,),
                        Container(
                          width: 140,
                          height: 0.0,
                          child: Divider(
                            color: Colors.grey[300],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.0,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(
                            builder:(context)=>Link()),);
                      },
                      child:
                      Container(
                        height: 74,
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text("Share invite link",style: TextStyle(fontSize: 14.0,color: Colors.black,fontFamily: 'Nato Sans',),),
                              Spacer(),
                              Icon(Icons.share,color: Colors.lightBlue,),
                            ],
                          ),
                        ),
                        // child: ElevatedButton.icon(
                        //   onPressed: () {
                        //   },
                        //   label: Text('Share invite link'),
                        //   icon: Icon(Icons.share),
                        //   style: ElevatedButton.styleFrom(
                        //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        //   ),
                        // ),
                      ),
                    ),

                  ],
                ), Positioned(
                  top: 80.0,
                  left: 160.0,
                  child: CircleAvatar(
                    maxRadius:40.0,
                    backgroundImage: AssetImage("assets/images/Boxer.jpeg",), // Replace with your image URL or local asset
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
