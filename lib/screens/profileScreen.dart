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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
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
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 600,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.jpeg'), // Use your asset image here
                  fit: BoxFit.cover, // Adjust the image fit as needed
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.9), // Adjust the opacity here (0.0 to 1.0)
                    BlendMode.dstATop, // Choose a blending mode
                  ),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 10,
                    right: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 300,
                        height: 150,
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
                    top: 180,
                    left: 10,
                    right: 10,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Effervescence: Magic meets Mystery',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 210,
                    left: 10,
                    right: 10,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Text(
                          'IIITA welcomes you to the Biggest Cultural festival of the North',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, color: Colors.black45),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 280,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 350,
                        width: 300,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      title: Text("Name",
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 15)),
                                      subtitle: Text("Mokshe Jain",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 20)),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: ListTile(
                                      title: Text("Order Number",
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 15)),
                                      subtitle: Text("CL9738PL",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 20)),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      title: Text("Begin-Date",
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 15)),
                                      subtitle: Text("Oct 24 2024",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 20)),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: ListTile(
                                      title: Text("End-Date",
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 15)),
                                      subtitle: Text("Oct 27 2024",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 20)),
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
