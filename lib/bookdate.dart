import 'package:flutter/material.dart';
import 'package:petapp/textfield.dart';


class BookingScreen extends StatelessWidget {
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
            Text(
              'Book a Date',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/Chow Chow.jpeg"),
                radius: 20.0,
              ),
              SizedBox(width: 8),
              Text("Maxi", style: TextStyle(color: Colors.black)),
            ],
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Location Car
                  Center(
                    child: Container(
                                    width: 350,
                                    height: 160,
                    child:  Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        color: Colors.blue,
                          child:
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Shinny Fur Saloon',
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Colors.white),
                                      ),
                                      SizedBox(width: 70,),
                                    ],
                                  ),
                                  SizedBox(height: 4.0),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on, color: Colors.white),
                                              SizedBox(width: 5.0,),
                                      Text('70 North Street\nLondon, UK', style: TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      PoppinsTextWidget(
                                        fontsize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        text: "4.6",

                                      ),
                                      Icon(Icons.star, color: Colors.amber),
                                      Icon(Icons.star, color: Colors.amber),
                                      Icon(Icons.star, color: Colors.amber),
                                      Icon(Icons.star, color: Colors.amber),

                                    Spacer(),
                                      PoppinsTextWidget(
                                        fontsize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        text: "230 reviews",

                                      ),
                                    ],
                                  ),


                                ],
                                                          ),
                              ),
                              Positioned(
                                  left:250,
                                  top: -15,
                                  child: Image.asset("assets/images/photo.png",height: 90,width: 110,)),

                            ],
                              ),


                        ),


                                  ),
                  ),


              SizedBox(height: 20.0),
          
              // Date Selection
              Text('Monday, 13 March', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10.0),
              SingleChildScrollView(
                scrollDirection:  Axis.horizontal,
                child: Row(
                  children: List.generate(1, (index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DateTile(date: '11', day: 'Sat', ),
                        SizedBox(width: 10,),
                        DateTile(date: '12', day: 'Sun', ),
                        SizedBox(width: 10,),
                        DateTile(date: '13', day: 'Mon', ),
                        SizedBox(width: 10,),
                        DateTile(date: '14', day: 'Tue',),
                        SizedBox(width: 10,),
                        DateTile(date: '15', day: 'Wed', ),
                        SizedBox(width: 10,),

                        DateTile(date: '16', day: 'Thr',),
                        SizedBox(width: 10,),
                        DateTile(date: '13', day: 'Fri',),
                
                      ],
                    );
                  }),
                ),
              ),
              SizedBox(height: 20.0),
          
              // Time Slot Selection
              Text('Availability', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10.0),
              Center(
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 15.0,
                  children: ['09:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00']
                      .map((time) => TimeSlotTile(time: time, isSelected: time == '11:00'))
                      .toList(),
                ),
              ),
              SizedBox(height: 20.0),
          
              // Services Selection
              Text('Services', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10.0),
              ServiceTile(service: 'Haircut', price: 30),
              SizedBox(height: 10.0),

              ServiceTile(service: 'Bath', price: 20),
              SizedBox(height: 10.0),

              ServiceTile(service: 'Nail Trimming', price: 20),
              SizedBox(height: 20.0),
              PoppinsTextWidget(
                fontsize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade600,
                text: "Prices are estimative and the payment will be made at the location.",
              ),
              // Note Section
              SizedBox(height: 10.0),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Add note',
                  hintText: 'Suggested',
                  border: OutlineInputBorder(),
                  counterText: '0/250',
                ),
                maxLength: 250,
                maxLines: 3,
              ),
              SizedBox(height: 20.0),
          
              // Confirm Booking Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child:
                  PoppinsTextWidget(
                    fontsize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    text: "Confirm Booking",
                  ),                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widgets for Date, Time Slot, and Services

class DateTile extends StatelessWidget {
  final String date;
  final String day;
  final bool isSelected;

  DateTile({required this.date, required this.day, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue[800] : Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Text(day, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
          SizedBox(height: 4.0),
          Text(date, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
        ],
      ),
    );
  }
}

class TimeSlotTile extends StatelessWidget {
  final String time;
  final bool isSelected;

  TimeSlotTile({required this.time, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange : Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),

      child: Text(
        time,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black),
      ),
    );
  }
}

class ServiceTile extends StatefulWidget {
  final String service;
  final int price;

  ServiceTile({required this.service, required this.price});

  @override
  _ServiceTileState createState() => _ServiceTileState();
}

class _ServiceTileState extends State<ServiceTile> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      Container(
        height:60,
        width: 350,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
      border: Border.all(color: Colors.grey.shade400),
      boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Checkbox(
                value: _isChecked,
                onChanged: (bool? newValue) {
                  setState(() {
                    _isChecked = newValue!;
                  });
                },
              ),
              Expanded(child: Text(widget.service)),
              Text('\$${widget.price}'),
            ],
          ),
        ),
      ),
    );
  }
}

