import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.arrow_back, color: Colors.white),
        title: Text("Profile Page", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
            color: Colors.white,
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
                    height: 200,
                    child: CachedNetworkImage(
                      imageUrl: "https://tse4.mm.bing.net/th?id=OIP._NeG9n7B41ih3dDn92Aw3AHaE8&pid=Api&P=0&h=180",
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
                      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 220,
                left: 10,
                right: 10,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Effervescence: Magic meets Mystery',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                top: 255,
                left: 10,
                right: 10,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'IIITA welcomes you to the Biggest Cultural festival of the North',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.black45),
                  ),
                ),
              ),
              Positioned(
                top: 300,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 200,
                    width: 300,
                    child: SingleChildScrollView( // Wrap the Column in a SingleChildScrollView
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Expanded( // Use Expanded to prevent overflow
                                child: ListTile(
                                  title: Text("Name", style: TextStyle(color: Colors.black45, fontSize: 15)),
                                  subtitle: Text("Mokshe Jain", style: TextStyle(fontWeight: FontWeight.bold , color: Colors.black, fontSize: 20)),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded( // Use Expanded to prevent overflow
                                child: ListTile(
                                  title: Text("Order Number", style: TextStyle(color: Colors.black45, fontSize: 15)),
                                  subtitle: Text("CLD09738PL", style: TextStyle(fontWeight: FontWeight.bold , color: Colors.black, fontSize: 20)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded( // Use Expanded to prevent overflow
                                child: ListTile(
                                  title: Text("Begin-Date", style: TextStyle(color: Colors.black45, fontSize: 15)),
                                  subtitle: Text("Oct 24 2024", style: TextStyle(fontWeight: FontWeight.bold , color: Colors.black, fontSize: 20)),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded( // Use Expanded to prevent overflow
                                child: ListTile(
                                  title: Text("End-Date", style: TextStyle(color: Colors.black45, fontSize: 15)),
                                  subtitle: Text("Oct 27 2024", style: TextStyle(fontWeight: FontWeight.bold , color: Colors.black, fontSize: 20)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded( // Use Expanded to prevent overflow
                                child: ListTile(
                                  title: Text("Gate", style: TextStyle(color: Colors.black45, fontSize: 15)),
                                  subtitle: Text("Yellow", style: TextStyle(fontWeight: FontWeight.bold , color: Colors.black, fontSize: 20)),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded( // Use Expanded to prevent overflow
                                child: ListTile(
                                  title: Text("Seat", style: TextStyle(color: Colors.black45, fontSize: 15)),
                                  subtitle: Text("West B", style: TextStyle(fontWeight: FontWeight.bold , color: Colors.black, fontSize: 20)),
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
              Positioned(
                top: 400,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 50,
                    width: 300,
                    child: SingleChildScrollView( // Wrap the Column in a SingleChildScrollView
                      child: Row(
                        children: [
                          Image.asset("assets/svgIcons/circle1.png" , height: 50,)
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
    );
  }
}
