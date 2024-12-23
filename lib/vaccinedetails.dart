import 'package:flutter/material.dart';
import 'package:petapp/textfield.dart';
import 'about.dart';


class VaccineScreen extends StatelessWidget {
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
            PoppinsTextWidget(
              fontsize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade600,
              text: "Pet Profile",
            ),
            PoppinsTextWidget(
              fontsize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade800,
              text: "Vaccines",
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              CircleAvatar(backgroundImage: AssetImage("assets/images/Chow Chow.jpeg"), radius: 20.0),
              PoppinsTextWidget(
                fontsize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800,
                text: "Maxi",
              ),
            ],
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
            children: [
              SizedBox(height: 20.0,),
              Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child:
                          Container(
                            height: 54,
                            width: 261,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey.shade100),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0),
                                  offset: Offset(2, 3),
                                ),
                              ],
                            ),
                            child: Center(
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade500,),
                                  hintText: 'Search by vaccine type',
                                  hintStyle: TextStyle(color: Colors.grey.shade500,fontSize: 16), // Sets hint text color
                                  border: InputBorder.none,
                                  // Removes the border
                                ),
                              ),
                            ),
                          ),

                        ),
                        SizedBox(width: 10,),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Container(
                            width: 54, // Adjust the width as needed
                            height: 54, // Adjust the height as needed
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.tune, // Adjust the icon as needed
                              color: Colors.white,
                              size: 20, // Adjust the size as needed
                            ),
                          ),
                        ),
                      ],
                  ),



              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      VaccineYearSection(year: "2023", vaccines: [
                        VaccineItem(name: "Nobivac Parvo-C", date: "11.03.2023", doctor: "dr. Martha Roth"),
                      ]),
                      VaccineYearSection(year: "2022", vaccines: [
                        VaccineItem(name: "Nobivac Parvo-C", date: "13.03.2022", doctor: "dr. Martha Roth"),
                        VaccineItem(name: "Rabisin", date: "20.08.2022", doctor: "dr. Martha Roth"),
                        VaccineItem(name: "Nobivac KV", date: "08.06.2022", doctor: "dr. Martha Roth"),
                      ]),
                      VaccineYearSection(year: "2021", vaccines: [
                        VaccineItem(name: "Nobivac Parvo-C", date: "13.03.2021", doctor: "dr. Martha Roth"),
                        VaccineItem(name: "Rabisin", date: "20.08.2021", doctor: "dr. Martha Roth"),
                      ]),
                    ],
                  ),
                ),

              ),
            ],
          ),
    );
  }
}

class VaccineYearSection extends StatelessWidget {
  final String year;
  final List<VaccineItem> vaccines;

  const VaccineYearSection({
    required this.year,
    required this.vaccines,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PoppinsTextWidget(
            fontsize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade800,
            text: year,
          ),
          SizedBox(height: 10),
          Column(
            children: vaccines
                .map((vaccine) => Padding(
              padding: const EdgeInsets.only(bottom: 15.0), // Add space here
              child: VaccineCard(vaccine: vaccine),
            ))
                .toList(),
          ),
        ],
      ),
    );
  }
}


class VaccineItem {
  final String name;
  final String date;
  final String doctor;

  VaccineItem({required this.name, required this.date, required this.doctor});
}

class VaccineCard extends StatelessWidget {
  final VaccineItem vaccine;

  const VaccineCard({required this.vaccine});

  @override
  Widget build(BuildContext context) {
    return       InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          ),
          builder: (context) => VaccineDetailBottomSheet(vaccine: vaccine),
        );
      },
      child: Center(
        child: Container(
          height:70,
          width: 327,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.shade100),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0),
                offset: Offset(0, 1),
                blurRadius: 20,
                spreadRadius: -2
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PoppinsTextWidget(
                  fontsize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade800,
                  text: vaccine.name,
                ),
                Row(
                  children: [
                    Image.asset("assets/images/c.png",height: 18,width: 18,),
                    SizedBox(width: 5.0,),
                    PoppinsTextWidget(
                      fontsize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                      text: "${vaccine.date} | ${vaccine.doctor}",
                    ),
                  ],
                ),
              ],
            ),
          ),

          ),
      ),
    );
  }
}

class VaccineDetailBottomSheet extends StatelessWidget {
  final VaccineItem vaccine;

  const VaccineDetailBottomSheet({required this.vaccine});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 605,
      width: 420,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 4,
                  width: 40,
                  color: Colors.grey[300],
                ),
              ),
              SizedBox(height: 16),
              Text(vaccine.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              PoppinsTextWidget(
                fontsize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800,
                text: "Details",
              ),              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child:                     PoppinsTextWidget(
                      fontsize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade700,
                      text: "Lot",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child:
                    PoppinsTextWidget(
                      fontsize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade700,
                      text: "Expiry Date",
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child:
                    PoppinsTextWidget(
                      fontsize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                      text: "A583D01",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child:
                    PoppinsTextWidget(
                      fontsize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                      text: "07-2026",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              PoppinsTextWidget(
                fontsize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800,
                text: "Date",
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child:
                    PoppinsTextWidget(
                      fontsize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade700,
                      text: "Vaccination date",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child:
                    PoppinsTextWidget(
                      fontsize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade700,
                      text: "Valid until",
                    ),
                  ),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child:
                      PoppinsTextWidget(
                        fontsize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade800,
                        text: "18.05.2023",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child:
                      PoppinsTextWidget(
                        fontsize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade800,
                        text: "18.09.2025",
                      ),                    ),
                  ],
                ),
              SizedBox(height: 20),
              PoppinsTextWidget(
                fontsize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800,
                text: "Veterinarian",
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/doc.png'), // Placeholder image path
                ),
                title:
                PoppinsTextWidget(
                  fontsize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade600,
                  text: "Martha Roth",
                ),
                subtitle:
                PoppinsTextWidget(
                  fontsize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade600,
                  text: "Veterinary Specialist",
                ),                trailing: Image.asset("assets/images/sign.png"),
              ),
              SizedBox(height: 20),
              PoppinsTextWidget(
                fontsize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800,
                text: "Notes",
              ),              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 10.0),
                child:
                PoppinsTextWidget(
                  fontsize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade800,
                  text: "No bad reactions",
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>About())

                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    minimumSize: Size(double.infinity, 50), // Full width button
                  ),
                  child:
                  PoppinsTextWidget(
                    fontsize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    text: "Done",
                  ),                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Function to show the bottom sheet
void showVaccineDetails(BuildContext context, VaccineItem vaccine) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Allows the height of SizedBox to take effect
    builder: (context) {
      return VaccineDetailBottomSheet(vaccine: vaccine);
    },
  );
}
