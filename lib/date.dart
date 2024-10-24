import 'package:flutter/material.dart';
import 'caretakers.dart';

class PetProfileSummaryScreen extends StatelessWidget {
  final DateTime birthDate;
  final DateTime adoptionDate;

  PetProfileSummaryScreen(
      {required this.birthDate, required this.adoptionDate});

  int calculateAge(DateTime birthDate) {
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;

    // Check if the birthday has already occurred this year
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    return age;
  }

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Add Pet Profile',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
              Text('Important Dates',
                  style: TextStyle(color: Colors.grey, fontSize: 14)),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              children: [
                Text('Step', style: TextStyle(color: Colors.black)),
                Row(
                  children: [
                    Text('8', style: TextStyle(color: Colors.black)),
                    Text('/9', style: TextStyle(color: Colors.grey))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: LinearProgressIndicator(
              value: 8 / 9, // Step 8 of 9
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow[700]!),
            ),
          ),
          SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                    'assets/images/Border Collie.jpeg'), // Your pet image path
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'Time to Celebrate!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 10.0,
              ),
              child: Card(
                elevation: 4,
                child: ListTile(
                  leading:Image.asset("assets/images/birth.png",height: 42,width: 42,),
                  title: Text('Birthday'),
                  subtitle: Text(
                      '${birthDate.day}/${birthDate.month}/${birthDate.year}'),
                  trailing: Text('${calculateAge(birthDate)} y.o'),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 10.0,
              ),
              child: Card(
                elevation: 4,
                child: ListTile(
                  leading:Image.asset("assets/images/adopt.png",height: 42,width: 42,),
                  title: Text('Adoption Day'),
                  subtitle: Text(
                      '${adoptionDate.day}/${adoptionDate.month}/${adoptionDate.year}'),
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                minimumSize: Size(double.infinity, 60), // Full-width button
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Caretakers()),
                );
              },
              child: Text('Continue'),
            ),
          ),
        ],
      ),
    );
  }
}

class AddPetProfileScreen extends StatefulWidget {
  @override
  _AddPetProfileScreenState createState() => _AddPetProfileScreenState();
}

class _AddPetProfileScreenState extends State<AddPetProfileScreen> {
  DateTime? birthDate;
  DateTime? adoptionDate;
  bool isBirthDateSelected = true; // Track which date type is selected

  Future<void> _showDatePicker(BuildContext context, bool isBirthDate) async {
    DateTime selectedDate = isBirthDate
        ? birthDate ?? DateTime.now()
        : adoptionDate ?? DateTime.now();

    await showModalBottomSheet(
      context: context,
      isScrollControlled: false, // Remove full-screen scrollable behavior
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              height: 880.0, // Adjusted height for modal
              child: Column(
                children: [
                  // Rounded divider
                  SizedBox(
                    width: 80, // Set the width to 80
                    child: Container(
                      height: 10, // Set the height (thickness) of the divider
                      decoration: BoxDecoration(
                        color: Colors.grey[400], // Light grey color
                        borderRadius: BorderRadius.circular(5), // Rounded corners
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setModalState(() {
                            isBirthDateSelected = true;
                          });
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.cake,
                                    size: 16.0,
                                    color: isBirthDateSelected
                                        ? Colors.yellow[700]
                                        : Colors.grey,
                                  ),
                                ),
                                Text(
                                  "Birth date",
                                  style: TextStyle(
                                    color: isBirthDateSelected
                                        ? Colors.yellow[700]
                                        : Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            if (isBirthDateSelected)
                              Container(
                                height: 4.0,
                                width: 200.0,
                                color: Colors.yellow[700],
                                margin: const EdgeInsets.only(top: 4.0),
                              ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setModalState(() {
                            isBirthDateSelected = false;
                          });
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.home,
                                    size: 16.0,
                                    color: !isBirthDateSelected
                                        ? Colors.yellow[700]
                                        : Colors.grey,
                                  ),
                                ),
                                Text(
                                  "Adoption date",
                                  style: TextStyle(
                                    color: !isBirthDateSelected
                                        ? Colors.yellow[700]
                                        : Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            if (!isBirthDateSelected)
                              Container(
                                height: 4.0,
                                width: 200.0,
                                color: Colors.yellow[700],
                                margin: const EdgeInsets.only(top: 4.0),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),

                  // Custom Calendar Picker
                  Expanded(
                    child: _buildCustomCalendarPicker(selectedDate, (newDate) {
                      setModalState(() {
                        selectedDate = newDate;
                      });
                    }),
                  ),
                  const SizedBox(height: 16.0),

                  // Done button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // "Done" button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: Size(double.infinity, 50), // Full-width button
                    ),
                    onPressed: () {
                      setState(() {
                        if (isBirthDateSelected) {
                          birthDate = selectedDate;
                        } else {
                          adoptionDate = selectedDate;
                        }
                      });

                      // Check if both dates are selected
                      if (birthDate == null) {
                        // Prompt user to select the birth date
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please select the birth date.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        setModalState(() {
                          isBirthDateSelected = true;
                        });
                      } else if (adoptionDate == null) {
                        // Prompt user to select the adoption date
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please select the adoption date.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        setModalState(() {
                          isBirthDateSelected = false;
                        });
                      } else {
                        // If both dates are selected, navigate to the next screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PetProfileSummaryScreen(
                              birthDate: birthDate!,
                              adoptionDate: adoptionDate!,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text('Done', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showDatePicker(context, true); // Show birth date picker initially
    });
  }

  Widget _buildCustomCalendarPicker(
      DateTime selectedDate, Function(DateTime) onDateChanged) {
    List<String> dayNames = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    // Helper method to get the number of days in a given month and year
    int _getDaysInMonth(int year, int month) {
      return DateTime(year, month + 1, 0).day;
    }

    // Helper method to get the month name from month number
    String _getMonthName(int month) {
      List<String> monthNames = [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December'
      ];
      return monthNames[month - 1];
    }

    // Get the number of days in the selected month
    int daysInMonth = _getDaysInMonth(selectedDate.year, selectedDate.month);

    // Get the first day of the selected month
    DateTime firstDayOfMonth =
        DateTime(selectedDate.year, selectedDate.month, 1);
    int firstWeekday = firstDayOfMonth.weekday; // 1 = Monday, ..., 7 = Sunday

    // Adjust for the start of the week to align with dayNames array (Mon = 0, Sun = 6)
    int adjustedStartIndex =
        firstWeekday == 7 ? 0 : firstWeekday; // Adjust for Sunday
    int selectedDayOfWeek = selectedDate.weekday % 7;

    return Column(
      children: [
        // Year Selector
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 100, // Set a large number for infinite scroll effect
            itemBuilder: (context, index) {
              int year =
                  2000 + (index % 100); // Loop through years 2000 to 2099
              return GestureDetector(
                onTap: () {
                  onDateChanged(
                      DateTime(year, selectedDate.month, selectedDate.day));
                },
                child: Container(
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    border: year == selectedDate.year
                        ? Border.all(
                            color: Colors.grey.shade200,
                            width: 1.5,
                          )
                        : null, // No border for non-selected years
                    color: year == selectedDate.year
                        ? Colors.blue[100]
                        : Colors
                            .transparent, // Only selected year has blue background
                  ),
                  width: 80,
                  alignment: Alignment.center,
                  child: Text(
                    year.toString(),
                    style: TextStyle(
                      fontSize: 24,
                      color: year == selectedDate.year
                          ? Colors.blue[400]
                          : Colors
                              .black, // Text color white for selected year, black for others
                      fontWeight: year == selectedDate.year
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        Divider(
          thickness: 1,
        ),
        // Month Selector
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey.shade200, width: 1.5),
          ),
          child: SizedBox(
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 12,
              itemBuilder: (context, index) {
                String month = _getMonthName(index + 1);
                return GestureDetector(
                  onTap: () {
                    onDateChanged(DateTime(
                        selectedDate.year, index + 1, selectedDate.day));
                  },
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      border: selectedDate.month == index + 1
                          ? Border.all(
                              color: Colors.grey.shade200,
                              width: 1.5,
                            )
                          : null, // No border for non-selected months
                      color: selectedDate.month == index + 1
                          ? Colors.blue[100]
                          : Colors
                              .transparent, // Only selected month has blue background
                    ),
                    width: 120,
                    alignment: Alignment.center,
                    child: Text(
                      month,
                      style: TextStyle(
                        fontSize: 18,
                        color: selectedDate.month == index + 1
                            ? Colors.blue[400]
                            : Colors
                                .black, // Text color white for selected month, black for others
                        fontWeight: selectedDate.month == index + 1
                            ? FontWeight.w500
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        // Day names (Mon, Tue, etc.)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: dayNames.map((dayName) {
              // Get the index of the day name (0 = Sunday, 6 = Saturday)
              int dayIndex = dayNames.indexOf(dayName);

              // Check if the current day name matches the selected date's weekday
              bool isSelectedDayName = dayIndex == selectedDayOfWeek;

              return Expanded(
                child: Center(
                  child: Text(
                    dayName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: isSelectedDayName
                          ? Colors.blue[200]
                          : Colors.black, // Highlight the selected day name
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),

        // Day Selector with GridView
        Expanded(
          child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
            itemCount: daysInMonth +
                adjustedStartIndex, // Include space for leading empty days
            itemBuilder: (context, index) {
              if (index < adjustedStartIndex) {
                // Return an empty container for leading empty days
                return Container();
              }

              int day = index -
                  adjustedStartIndex +
                  1; // Adjust index for day counting
              DateTime currentDay =
                  DateTime(selectedDate.year, selectedDate.month, day);
              bool isSelectedDay = day == selectedDate.day;

              return GestureDetector(
                onTap: () {
                  // Create a new DateTime object with the selected day
                  DateTime newSelectedDate =
                      DateTime(selectedDate.year, selectedDate.month, day);
                  onDateChanged(newSelectedDate);
                },
                child: Container(
                  margin:
                      const EdgeInsets.all(4.0), // Margin around each day box
                  padding: const EdgeInsets.all(10.0), // Padding inside the box
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle, // Change to rectangle for a box
                    color: isSelectedDay
                        ? Colors.blue
                        : Colors.transparent, // Highlight selected day
                    border: Border.all(
                        color: Colors.grey), // Add border for visibility
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  child: Center(
                    child: Text(
                      day.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight:
                            isSelectedDay ? FontWeight.bold : FontWeight.normal,
                        fontSize:
                            16, // Increase font size for better visibility
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Add Pet Profile',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
              Text('Important Dates',
                  style: TextStyle(color: Colors.grey, fontSize: 14)),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              children: [
                Text(
                  'Step',
                  style: TextStyle(color: Colors.black),
                ),
                Row(
                  children: [
                    Text(
                      '8',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      '/9',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: LinearProgressIndicator(
                value: 8 / 9, // Step 5 of 9
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow[700]!),
              ),
            ),
            Center(
                child: Text('Select Birth and Adoption Dates',
                    style: TextStyle(fontSize: 18))),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showDatePicker(context, true);
              },
              child: Text('Pick Dates'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: AddPetProfileScreen(),
    ));
