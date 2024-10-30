import 'package:flutter/material.dart';
import 'package:petapp/textfield.dart';
import 'bookdate.dart';


class ContactDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Stack(
            children: [
              Center(child: Text('View Contact')
              )
            ],
        ),
        backgroundColor: Colors.white,

      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile image section
            Container(
              height: 350,
              width: double.infinity,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/shop.png', // Replace with your image URL
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 260,
                    left: 20,
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      height: 90,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Shinny Fur Saloon',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Grooming',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            SizedBox(width: 128,),
                            Image.asset("assets/images/rights.png",height: 20,width: 20,),

                          ],
                        ),
                      ),
                    ),
                  ),
                ]
              ),
            ),

            // Rating and Review count
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text('4.6', style: TextStyle(fontSize: 18)),
                  SizedBox(width: 5.0,),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.grey),

                  Spacer(),
                  Text('230 reviews', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
              Divider(color: Colors.grey.shade200,),
            ListTile(
              leading:Text("Contact",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 18),),
              trailing:
              Image.asset("assets/images/minus.png",height: 30,width: 30,color: Colors.grey.shade500,),
            ),
            // Contact details
            ListTile(
              leading: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Phone:",style: TextStyle(fontSize: 16,),),
                  Text('079 1234 7777',style: TextStyle(fontSize: 16),),

                ],
              ),
              trailing:
                Image.asset("assets/images/phone.png",height: 38,width: 38,)
            ),
            SizedBox(height: 10.0,),
            ListTile(
              leading:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text("Email:",style: TextStyle(fontSize: 16,),),
                  Text('contact@shinnyfur@gmail.com',style: TextStyle(fontSize: 16,),),

                ],
              ),
              trailing:
              Image.asset("assets/images/email.png",height: 38,width: 38,)
            ),

            // Location section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Location', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Spacer(),
                      Image.asset("assets/images/minus.png",height: 30,width: 30,color: Colors.grey.shade500,),
                      
                    ],
                  ),
                  Text("Street: 70 North Street",style: TextStyle(fontSize: 14,),),
                  SizedBox(height: 5.0,),

                  Text("City: London",style: TextStyle(fontSize: 14,),),
                  SizedBox(height: 5.0,),
                  Text("Country: United Kingdom",style: TextStyle(fontSize: 14,),),

                ],
              ),
            ),
            SizedBox(height: 10.0,),
              Center(
                child: Stack
                  (
                  children: 
              [
                Image.asset("assets/images/Mask group.png",width: 327,height: 150,),
                Positioned(
                  left:275,
                    top: 15,
                    child: Image.asset("assets/images/Button.png",height: 38,width: 38,))
              ],
              ),
            ),
            SizedBox(height: 10.0,),
            Divider(color: Colors.grey.shade300,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text('Availability', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  'M', 'T', 'W', 'T', 'F', 'Sat', 'S'
                ]
                    .map((day) =>
                    Container(
                      height: 40,
                  width: 38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                           color: day == 'S' ? Colors.grey : Colors.blue.shade500,
                        ),
                        color: day == 'S' ? Colors.grey.shade100 : Colors.blue.shade100,

                      ),
                  child: Center(child: Text(day, style: TextStyle(
                    color: day == 'S' ? Colors.grey : Colors.blue.shade500,
                  ))),
                ))
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text('Hours:', style: TextStyle(color: Colors.grey)),
                  Text('10:00 - 20:00', style: TextStyle(color: Colors.black)),

                ],
              ),
            ),
Divider(color: Colors.grey.shade300,),
            // Services and prices
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Text('Services', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Spacer(),
                  Image.asset("assets/images/minus.png",height: 30,width: 30,color: Colors.grey.shade500,),

                ],
              ),
            ),
            Center(
              child: Container(
                width: 350,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child:Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text('Haircut'),
                        Spacer(),
                        Text("\$",style: TextStyle(color: Colors.black,fontSize: 12),),
                        Text('30',style: TextStyle(color: Colors.black,fontSize: 18),),
                      ],
                    ),
                ),
                ),
              ),
            SizedBox(height: 10.0,),
            Center(
              child: Container(
                width: 350,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child:Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text('Bath'),
                      Spacer(),
                      Text("\$",style: TextStyle(color: Colors.black,fontSize: 12),),
                      Text('20',style: TextStyle(color: Colors.black,fontSize: 18),),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0,),

            Center(
              child: Container(
                width: 350,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child:Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text('Nail Trimming'),
                      Spacer(),
                      Text("\$",style: TextStyle(color: Colors.black,fontSize: 12),),
                      Text('20',style: TextStyle(color: Colors.black,fontSize: 18),),
                    ],
                  ),
                ),
              ),
            ),

            // Book a date button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=>BookingScreen()));
                },
                child: PoppinsTextWidget(
                  fontsize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  text: "Book a date",

                ),
                // Text('Book a date',style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),

            // Add to contacts button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text('+ Add to contacts',style: TextStyle(color: Colors.grey.shade500),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
