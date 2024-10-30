import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'Contacts.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  Map<DateTime, List<Color>> _events = {
    DateTime(2023, 6, 1): [Colors.green],
    DateTime(2023, 6, 2): [Colors.purple],
    DateTime(2023, 6, 4): [Colors.pink, Colors.purple],
    DateTime(2023, 6, 9): [Colors.green],
    DateTime(2023, 6, 10): [Colors.blue],
    DateTime(2023, 6, 15): [Colors.orange],
    DateTime(2023, 6, 20): [Colors.green, Colors.orange],
  };

  List<Color> _getEventColorsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Calendar")),
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, day, events) {
                  List<Color> eventColors = _getEventColorsForDay(day);
                  if (eventColors.isNotEmpty) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: eventColors.map((color) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 1.0),
                          width: 5.0,
                          height: 5.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: color,
                          ),
                        );
                      }).toList(),
                    );
                  }
                  return null;
                },
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("Upcoming events",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          ),
          SizedBox(height: 10.0,),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: 1, // Replace with actual number of walks
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Contacts()));
                      },
                      child: Card(
                        margin: EdgeInsets.only(bottom: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 1,
                        child:ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage("assets/images/wicon.png"),
                              ),
                              title: Text("09.06.2023 | 09:30"),
                              subtitle:
                              Row(
                                children: [
                                  Image.asset("assets/images/shoes.png",height: 24,width: 24,),
                                  SizedBox(width: 5.0,),
                                  Text("Morning Walk"),
                                ],
                              ),
                        ),
                      ),
                    ),
                SizedBox(height: 10.0,),
                Card(
                margin: EdgeInsets.only(bottom: 10),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                ),
                elevation: 1,
                   child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/doc.png"),
                      ),
                      title: Text("12.06.2023 | 11:00"),
                      subtitle:
                      Row(
                        children: [
                          Image.asset("assets/images/pill.png",height: 24,width: 24,),
                          SizedBox(width: 5.0,),
                          Text("Flea Medication"),
                        ],
                      ),
                    ),
                ),
                    SizedBox(height: 10.0,),
                    Card(
                      margin: EdgeInsets.only(bottom: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 1,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/wicon.png"),
                        ),
                        title: Text("16.06.2023| 16:00"),
                        subtitle:
                        Row(
                          children: [
                            Image.asset("assets/images/scissors.png",height: 24,width: 24,),
                            SizedBox(width: 5.0,),
                            Text("Shinny Fur Saloon"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Card(
                      margin: EdgeInsets.only(bottom: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 1,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/doc.png"),
                        ),
                        title: Text("20.06.2023| 11:00"),
                        subtitle:
                        Row(
                          children: [
                            Image.asset("assets/images/stethoscope.png",height: 24,width: 24,),
                            SizedBox(width: 5.0,),
                            Text("Annual Checkup"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Card(
                      margin: EdgeInsets.only(bottom: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 1,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/wicon.png"),
                        ),
                        title: Text("21.06.2023 | 16:00"),
                        subtitle:
                        Row(
                          children: [
                            Image.asset("assets/images/shoes.png",height: 24,width: 24,),
                            SizedBox(width: 5.0,),
                            Text("Park Walk"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Card(
                      margin: EdgeInsets.only(bottom: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 1,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/doc.png"),
                        ),
                        title: Text("12.06.2023 | 11:00"),
                        subtitle:
                        Row(
                          children: [
                            Image.asset("assets/images/pill.png",height: 24,width: 24,),
                            SizedBox(width: 5.0,),
                            Text("Flea Medication"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Card(
                      margin: EdgeInsets.only(bottom: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 1,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/doc.png"),
                        ),
                        title: Text("12.06.2023 | 11:00"),
                        subtitle:
                        Row(
                          children: [
                            Image.asset("assets/images/pill.png",height: 24,width: 24,),
                            SizedBox(width: 5.0,),
                            Text("Flea Medication"),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),

    );
  }
}
