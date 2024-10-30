import 'package:flutter/material.dart';
import 'package:petapp/textfield.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool locationAccess = false;
  bool photoAccess = false;
  bool appNotifications = false;
  bool emailNotifications = false;
  bool _lights = false;
  bool _light = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Settings')),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PoppinsTextWidget(
                    fontsize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade600,
                    text: "Personalisation",
                  ),
                  SizedBox(height: 30.0,),
        
                  Center(
                child: Container(
                  height:80,
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
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Image.asset("assets/images/time.png",height: 54,width: 54,),
                        SizedBox(width: 10,),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PoppinsTextWidget(
                                fontsize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade800,
                                text: "Time Zone",
                              ),
                              PoppinsTextWidget(
                                fontsize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade700,
                                text: "Choose your timezone",
                              ),
                            ],
                          ),
                        Spacer(),
                        Image.asset("assets/images/rightarrow.png",height: 20,width: 20,),
        
                      ],
                    ),
                  ),
                ),
              ),
        SizedBox(height: 15.0,),
                  Center(
                    child: Container(
                      height:80,
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
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Image.asset("assets/images/lang.png",height: 54,width: 54,),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PoppinsTextWidget(
                                  fontsize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade800,
                                  text: "Language",
                                ),
                                PoppinsTextWidget(
                                  fontsize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade700,
                                  text: "Set the app language",
                                ),
                              ],
                            ),
                            Spacer(),
                            Image.asset("assets/images/rightarrow.png",height: 20,width: 20,),
        
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  Center(
                    child: Container(
                      height:80,
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
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Image.asset("assets/images/dark.png",height: 54,width: 54,),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PoppinsTextWidget(
                                  fontsize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade800,
                                  text: "Dark mode",
                                ),
                                PoppinsTextWidget(
                                  fontsize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade700,
                                  text: "Choose view mode",
                                ),
                              ],
                            ),
                            Spacer(),
                             Switch(
                              value: _lights,
                              onChanged: (bool value) {
                                setState(() {
                                  _lights = value;
                                });
                              },
                              activeColor: Colors.black, // Set active color to blue
                              inactiveTrackColor: Colors.white, // Set inactive track color (optional)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  PoppinsTextWidget(
                    fontsize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade600,
                    text: "Access",
                  ),
                  SizedBox(height: 30.0,),
                  Center(
                    child: Container(
                      height:80,
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
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Image.asset("assets/images/loc.png",height: 54,width: 54,),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PoppinsTextWidget(
                                  fontsize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade800,
                                  text: "Location access",
                                ),
                                PoppinsTextWidget(
                                  fontsize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade700,
                                  text: "Access to your location",
                                ),
                              ],
                            ),
                            Spacer(),
                            Switch(
                              value: locationAccess,
                              onChanged: (bool value) {
                                setState(() {
                                  locationAccess = value;
                                });
                              },
                              activeColor: Colors.blue, // Set active color to blue
                              inactiveTrackColor: Colors.white, // Set inactive track color (optional)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  Center(
                    child: Container(
                      height:80,
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
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Image.asset("assets/images/gallery.png",height: 54,width: 54,),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PoppinsTextWidget(
                                  fontsize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade800,
                                  text: "Photo access",
                                ),
                                PoppinsTextWidget(
                                  fontsize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade700,
                                  text: "Access to your media",
                                ),
                              ],
                            ),
                            Spacer(),
                            Switch(
                              value: photoAccess,
                              onChanged: (bool value) {
                                setState(() {
                                  photoAccess = value;
                                });
                              },
                              activeColor: Colors.blue, // Set active color to blue
                              inactiveTrackColor: Colors.white, // Set inactive track color (optional)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25.0,),
                  PoppinsTextWidget(
                    fontsize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade600,
                    text: "Access",
                  ),
                  SizedBox(height: 30.0,),
                  Center(
                    child: Container(
                      height:80,
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
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Image.asset("assets/images/bell.png",height: 54,width: 54,),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PoppinsTextWidget(
                                  fontsize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade800,
                                  text: "App Notifications",
                                ),
                                PoppinsTextWidget(
                                  fontsize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade700,
                                  text: "Get push notifications",
                                ),
                              ],
                            ),
                            Spacer(),
                            Switch(
                              value: appNotifications,
                              onChanged: (bool value) {
                                setState(() {
                                  appNotifications = value;
                                });
                              },
                              activeColor: Colors.blue, // Set active color to blue
                              inactiveTrackColor: Colors.white, // Set inactive track color (optional)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
        SizedBox(height: 15.0,),
                  Center(
                    child: Container(
                      height:80,
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
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Image.asset("assets/images/mail.png",height: 54,width: 54,),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PoppinsTextWidget(
                                  fontsize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade800,
                                  text: "Email Notifications",
                                ),
                                PoppinsTextWidget(
                                  fontsize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade700,
                                  text: "Get regular updates",
                                ),
                              ],
                            ),
                            Spacer(),
                            Switch(
                              value: emailNotifications,
                              onChanged: (bool value) {
                                setState(() {
                                  emailNotifications = value;
                                });
                              },
                              activeColor: Colors.blue, // Set active color to blue
                              inactiveTrackColor: Colors.white, // Set inactive track color (optional)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
        
                ],
              ),
            ),
        ),
      ),
    );
  }
}

