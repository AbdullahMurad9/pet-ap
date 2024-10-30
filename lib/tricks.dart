import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'calender.dart';

class TrickScreen extends StatefulWidget {
  @override
  _TrickScreenState createState() => _TrickScreenState();
}

class _TrickScreenState extends State<TrickScreen> {
  void _playVideo(String videoUrl) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => VideoPlayerScreen(videoUrl: videoUrl),
      ),
    );
  }

  Widget buildVideoCard(String title, String skillLevel, String duration, String videoUrl, String thumbnailUrl) {
    return Container(
    height: 202,
    width: 140,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
    BoxShadow(
    color: Colors.black.withOpacity(0.1),
    spreadRadius: 1,
    blurRadius: 5,
    offset: Offset(0, 3),
    ),
    ],
    ),
     child:  GestureDetector(
      onTap: () => _playVideo(videoUrl),
        child: Stack(
          children: [
            // Thumbnail image as background
            Container(
                height: 120,
                width: 140,
              child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    thumbnailUrl,
                    height: 120,
                    width: 140,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Image.asset("assets/images/play.png",height: 38,width: 38,),
              ),
                ],
              )
            ),
            // Title, skill level, and duration overlay
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      skillLevel,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.purple.shade700,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 14,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 4),
                      Text(
                        duration,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
          );
  }
  Widget buildVideoCardsecond(String title, String skillLevel, String duration, String videoUrl, String thumbnailUrl) {
    return Container(
      height: 202,
      width: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child:  GestureDetector(
        onTap: () => _playVideo(videoUrl),
        child: Stack(
          children: [
            // Thumbnail image as background
            Container(
                height: 120,
                width: 140,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          thumbnailUrl,
                          height: 120,
                          width: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Center(
                      child: Image.asset("assets/images/play.png",height: 38,width: 38,),
                    ),
                  ],
                )
            ),
            // Title, skill level, and duration overlay
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      skillLevel,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.orange.shade700,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 14,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 4),
                      Text(
                        duration,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildVideoCardthird(String title, String skillLevel, String duration, String videoUrl, String thumbnailUrl) {
    return Container(
      height: 202,
      width: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child:  GestureDetector(
        onTap: () => _playVideo(videoUrl),
        child: Stack(
          children: [
            // Thumbnail image as background
            Container(
                height: 120,
                width: 140,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          thumbnailUrl,
                          height: 120,
                          width: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Center(
                      child: Image.asset("assets/images/play.png",height: 38,width: 38,),
                    ),
                  ],
                )
            ),
            // Title, skill level, and duration overlay
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      skillLevel,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green.shade700,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 14,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 4),
                      Text(
                        duration,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
          onPressed: () {},
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pet Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Tricks',
              style: TextStyle(color: Colors.black, fontSize: 15),
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
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Your tricks",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Image.asset("assets/images/dot.png", height: 40, width: 40),
                ],
              ),
              SizedBox(height: 15.0,),
              Container(
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset("assets/images/Visual.png",width: 65,height: 54,),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Paw",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                              SizedBox(width: 140.0,),
                              Text("75%"),

                            ],
                          ),
                          Row(children:
                          [
                            Image.asset("assets/images/c.png",height: 25,width: 25,),
                            Text("20.04.23"),
                            SizedBox(width: 70.0,),
                            Image.asset("assets/images/blueline.png",height: 6,width: 70,),


                          ],),

                        ],

                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 15.0,),
              Container(
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset("assets/images/Visualtwo.png",width: 65,height: 54,),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Sit",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                              SizedBox(width: 150.0,),
                              Text("100%"),

                            ],
                          ),
                          Row(children:
                          [
                            Image.asset("assets/images/c.png",height: 25,width: 25,),
                            Text("20.04.23"),
                            SizedBox(width: 70.0,),
                            Image.asset("assets/images/greenline.png",height: 6,width: 70,),


                          ],),

                        ],

                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 20.0,),
              // "Learn Next" section with video cards
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Text(
                      "Learn Next",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "See all",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Image.asset(
                      "assets/images/rightarrow.png",
                      height: 20,
                      width: 20,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              Container(
                height: 220,
                  width:370 ,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildVideoCard("Lay Down", "Beginner", "3 minutes", "https://youtu.be/UiZFM_q1bNw?si=4La3Ad372Q87cFhx", "https://img.youtube.com/vi/UiZFM_q1bNw/0.jpg"),
                      SizedBox(width: 20.0),
                      buildVideoCardsecond("Stay", "Intermediate", "5 minutes", "https://youtube.com/shorts/QX6E65Lo7a8?si=CCp7DwrfaSFk3YWe", "https://img.youtube.com/vi/QX6E65Lo7a8/0.jpg"),
                      SizedBox(width: 20.0),
                      buildVideoCardthird("Roll Over", "Advanced", "4 minutes", "https://youtu.be/IsJ0VdeOJcg?si=bt47pMf8AsphbBZS", "https://img.youtube.com/vi/IsJ0VdeOJcg/0.jpg"),
                    ],
                  ),
                ),
              ),
        Spacer(),
        InkWell(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>CalendarScreen()));
          },
          child: Container(
            height: 64,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: Colors.blue.shade500,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.3),
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                "Learn new tricks",
                style: TextStyle(
                  color: Colors.blue.shade500,
                  fontFamily: 'Nato Sans',
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
          ],
          ),
        ),
      ),
    );
  }
}

// Separate video player screen
class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  VideoPlayerScreen({required this.videoUrl});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
