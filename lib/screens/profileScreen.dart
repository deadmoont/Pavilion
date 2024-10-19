import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:animate_gradient/animate_gradient.dart';
import 'package:sensors_plus/sensors_plus.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double _rotationY = 0.0;

  @override
  void initState() {
    super.initState();

    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _rotationY += event.y * 0.07;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        leading: Icon(Icons.arrow_back, color: Colors.white),
        title: Text("Profile Page", style: TextStyle(color: Colors.white)),
      ),
      body: AnimateGradient(
        primaryBegin: Alignment.topLeft,
        primaryEnd: Alignment.bottomLeft,
        secondaryBegin: Alignment.bottomLeft,
        secondaryEnd: Alignment.topRight,
        primaryColors: const [
          Colors.pink,
          Colors.pinkAccent,
          Colors.white,
        ],
        secondaryColors: const [
          Colors.white,
          Colors.blueAccent,
          Colors.blue,
        ],
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001) // Perspective transformation
            ..rotateY(_rotationY), // Rotate around the Y-axis
          alignment: Alignment.center,
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              width: double.infinity,
              height: screenHeight * 0.75, // Adjusted to a percentage of screen height
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.jpeg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.9),
                    BlendMode.dstATop,
                  ),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: screenHeight * 0.02, // Adjusted position based on screen height
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: double.infinity,
                        height: screenHeight * 0.2, // Responsive height for image container
                        child: CachedNetworkImage(
                          imageUrl:
                          "https://tse4.mm.bing.net/th?id=OIP._NeG9n7B41ih3dDn92Aw3AHaE8&pid=Api&P=0&h=180",
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.white, BlendMode.colorBurn),
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.28, // Responsive position
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                        child: Text(
                          'Effervescence: Magic meets Mystery',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth * 0.05, // Responsive font size
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.33,
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                        child: Text(
                          'IIITA welcomes you to the Biggest Cultural festival of the North',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color: Colors.black45,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.4,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: screenHeight * 0.45, // Adjusted scrollable container height
                        width: screenWidth * 0.8, // Responsive width for scrollable content
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: ListTile(
                                      title: Text(
                                        "Name",
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: screenWidth * 0.04, // Responsive font
                                        ),
                                      ),
                                      subtitle: Text(
                                        "Mokshe Jain",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: screenWidth * 0.05,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.05),
                                  Flexible(
                                    child: ListTile(
                                      title: Text(
                                        "Order Number",
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: screenWidth * 0.04,
                                        ),
                                      ),
                                      subtitle: Text(
                                        "CL9738PL",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: screenWidth * 0.05,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: ListTile(
                                      title: Text(
                                        "Begin-Date",
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: screenWidth * 0.04,
                                        ),
                                      ),
                                      subtitle: Text(
                                        "Oct 24 2024",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: screenWidth * 0.05,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.05),
                                  Flexible(
                                    child: ListTile(
                                      title: Text(
                                        "End-Date",
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: screenWidth * 0.04,
                                        ),
                                      ),
                                      subtitle: Text(
                                        "Oct 27 2024",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: screenWidth * 0.05,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
      ),
    );
  }
}
