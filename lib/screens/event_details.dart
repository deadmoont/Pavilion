import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventDetailPage extends StatefulWidget {
  const EventDetailPage({super.key});

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  bool isReadMore = false; // To manage "Read More" state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Top image with gradient overlay
                Container(
                  height: 400,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://th.bing.com/th/id/OIP.GPFEY6kfgxbsja6gmrW6rwHaE7?rs=1&pid=ImgDetMain',
                      ), // Placeholder image URL
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
                // AppBar-like section (back button and status bar icons)
                Positioned(
                  top: 40,
                  left: 25,
                  right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back Button
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.arrow_back_ios, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                // Event details card at the bottom
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Card(
                    color: Colors.grey.shade200.withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Coldplay : Music of the Spheres",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.location_on, size: 16),
                              SizedBox(width: 5),
                              Flexible(
                                child: Text(
                                  "Gelora Bung Karno Stadium, Jakarta",
                                  style: GoogleFonts.poppins(fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.event, size: 16),
                              SizedBox(width: 5),
                              Text(
                                "November 15, 2023",
                                style: GoogleFonts.poppins(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Description section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    isReadMore
                        ? "Integer id augue iaculis, iaculis orci ut, blandit quam. Donec in elit auctor, finibus quam in, pharetra. Proin id ligula dictum, covalis enim ut, facilisis massa. Mauris a nisi ut sapien blandit imperdiet. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed posuere egestas nunc ut tempus. Fu ipsum dolor sit amet."
                        : "Integer id augue iaculis, iaculis orci ut, blandit quam. Donec in elit auctor, finibus quam in, pharetra.",
                    style: GoogleFonts.poppins(
                      color: Colors.grey.shade400,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isReadMore =
                            !isReadMore; // Toggle the "Read More" state
                      });
                    },
                    child: Text(
                      isReadMore ? "Read Less.." : "Read More..",
                      style: GoogleFonts.poppins(
                        color: Colors.blueAccent,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Gradient button (Society Name)
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      margin: EdgeInsets.only(right: 30),
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 40.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [
                            Colors.pink,
                            Colors.purple,
                            Colors.blue,
                          ],
                        ),
                      ),
                      child: Text(
                        "Society Name",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Other Events section
                  Text(
                    "Other Events:",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Grid for other events
                  // GridView.count(
                  //   crossAxisCount: 2,
                  //   shrinkWrap: true,
                  //   physics: NeverScrollableScrollPhysics(),
                  //   childAspectRatio: 1.2,
                  //   children: List.generate(4, (index) {
                  //     return Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(20),
                  //           gradient: LinearGradient(
                  //             colors: [
                  //               Colors.purple,
                  //               Colors.blue,
                  //               Colors.green,
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     );
                  //   }),
                  // ),

                  SizedBox(
                    height: 200, // Fixed height for the ListView
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 12, // 12 boxes
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200, // Width of each box (adjustable)
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.purple,
                                  Colors.blue,
                                  Colors.green,
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
