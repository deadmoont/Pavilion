import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pavilion/screens/MapScreen.dart';

class Neweventdetail extends StatefulWidget {
  final String image;
  final String title;
  final String des;
  final String venue;
  final String form;
  const Neweventdetail(
      {super.key,
      required this.image,
      required this.title,
      required this.des,
      required this.venue,
      required this.form});

  @override
  State<Neweventdetail> createState() => _NeweventdetailState();
}

class _NeweventdetailState extends State<Neweventdetail> {
  final GlobalKey _repaintKey = GlobalKey(); // To capture the widget
  String message =
      "🌟 You're invited to our exciting event this Friday at 6 PM! 🎉 Join us for a night of fun, laughter, and great company. 🎈 We'll have games, food, and surprises! 🍕🥳 Don't miss out on the chance to make unforgettable memories! See you there! 🎊✨";

  // Future<void> _exportToPdf(Uint8List imageBytes) async {
  // final pdf = pw.Document();

  // final image = pw.MemoryImage(imageBytes);

  // pdf.addPage(
  //   pw.Page(
  //     build: (pw.Context context) {
  //       return pw.Center(child: pw.Image(image));
  //     },
  //   ),
  // );

  // // // Save PDF to temporary directory
  // // final output = await getTemporaryDirectory();
  // // final file = File("${output.path}/event_details.pdf");
  // // await file.writeAsBytes(await pdf.save());

  // // // Preview the PDF
  // // await Printing.layoutPdf(
  // //   onLayout: (PdfPageFormat format) async => pdf.save(),
  // );
  // }

  // Future<void> _captureAndExportPdf() async {
  //   try {
  //     // Capture the widget as an image
  //     // RenderRepaintBoundary boundary = _repaintKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  //     // var image = await boundary.toImage();
  //     // ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
  //     // Uint8List pngBytes = byteData!.buffer.asUint8List();

  //     // // Export the captured image as a PDF
  //     // await _exportToPdf(pngBytes);
  //   } catch (e) {
  //     // print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: RepaintBoundary(
                key: _repaintKey, // RepaintBoundary to capture widget
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          widget.image,
                          height: 492,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          height: 492,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.5),
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 50,
                          left: 16,
                          right: 16,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  // Define your action here (e.g., go back)
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[800]?.withOpacity(0.4),
                                    shape: BoxShape.circle,
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  child: const Icon(
                                    Icons.keyboard_arrow_left,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              // InkWell(
                              //   onTap: () async {
                              //     // await _captureAndExportPdf(); // Share button triggers the PDF export
                              //   },
                              //   child: Container(
                              //     decoration: BoxDecoration(
                              //       color: Colors.grey[800]?.withOpacity(0.4),
                              //       shape: BoxShape.circle,
                              //     ),
                              //     padding: const EdgeInsets.all(12),
                              //     child: const Icon(
                              //       Icons.ios_share,
                              //       color: Colors.white,
                              //     ),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 30,
                          left: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: const [
                                  Icon(Icons.calendar_today_outlined,
                                      color: Colors.white),
                                  SizedBox(width: 4),
                                  Text(
                                    "25-27 October",
                                    style: TextStyle(
                                        color: Color.fromRGBO(238, 66, 116, 1), fontSize: 20),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: const [
                                  Icon(Icons.location_on_outlined,
                                      color: Colors.white),
                                  SizedBox(width: 4),
                                  Text(
                                    "IIIT Allahabad",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Row(
                            //   children: [
                            //     // Event organizer details
                            //     Container(
                            //       width: 60, // Set the width
                            //       height: 60, // Set the height
                            //       decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(
                            //             10), // Set border radius to 10
                            //         image: DecorationImage(
                            //           image: AssetImage("assets/images/p.png"),
                            //           fit: BoxFit
                            //               .cover, // Ensures the image fits the container
                            //         ),
                            //       ),
                            //     ),
                            //     const SizedBox(width: 15),
                            //     Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         const Text(
                            //           "Carnival",
                            //           style: TextStyle(
                            //               fontSize: 26, color: Colors.white),
                            //         ),
                            //         const SizedBox(height: 6),
                            //         Text("10.5k followers",
                            //             style: TextStyle(
                            //                 fontSize: 18,
                            //                 color: Colors.grey[500])),
                            //       ],
                            //     ),
                            //     const Spacer(),
                            //     ElevatedButton.icon(
                            //       onPressed: () {},
                            //       icon: Icon(Icons.person_add,
                            //           color: Colors.white), // Leading icon
                            //       label: const Text(
                            //         "Follow",
                            //         style: TextStyle(color: Colors.white),
                            //       ),
                            //       style: ElevatedButton.styleFrom(
                            //         backgroundColor: const Color(0xFFFFD5D8)
                            //             .withOpacity(
                            //                 0.5), // Background color with opacity
                            //         shape: RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.circular(15),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // const SizedBox(height: 16),
                            const Divider(color: Colors.grey),
                            const SizedBox(height: 8),
                            Text(
                              "About this event",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.des,
                              // "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer euismod commodo eros vel dapibus. Integer ipsum nibh, ornare in maximus vel, egestas at purus. Lorem ipsum dolor sit amet, consectetur",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            const SizedBox(height: 16),
                            const Divider(color: Colors.grey),
                            const SizedBox(height: 25),
                            Text(
                              "Information",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.location_pin,
                                          color: Colors.white),
                                      SizedBox(width: 15),
                                      Text("venue: ${widget.venue}",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                  // const SizedBox(height: 8),
                                  // Row(
                                  //   children: const [
                                  //     Icon(Icons.person,
                                  //         size: 16, color: Colors.white),
                                  //     SizedBox(width: 25),
                                  //     Text("Age: 18+",
                                  //         style:
                                  //             TextStyle(color: Colors.white)),
                                  //   ],
                                  // ),
                                  // const SizedBox(height: 8),
                                  // Row(
                                  //   children: const [
                                  //     Icon(Icons.group_outlined,
                                  //         color: Colors.white),
                                  //     SizedBox(width: 15),
                                  //     Text("Limit: max 14000 participants",
                                  //         style:
                                  //             TextStyle(color: Colors.white)),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                            // const SizedBox(height: 42),
                            // Container(
                            //   width: double
                            //       .infinity, // Ensures the container takes the full width of the screen
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment
                            //         .spaceAround, // Adjusts spacing between buttons
                            //     children: [
                            //       Container(
                            //         height: 50,
                            //         width: 150,
                            //         child: ElevatedButton(
                            //           onPressed: () async {
                            //             // Trigger the PDF export instead of navigating
                            //             // await _captureAndExportPdf();
                            //           },
                            //           style: ElevatedButton.styleFrom(
                            //             backgroundColor: Color(0xFF4655)
                            //                 .withOpacity(
                            //                     0.5), // Red background with opacity
                            //             shape: RoundedRectangleBorder(
                            //               borderRadius: BorderRadius.circular(
                            //                   10), // Rectangle shape with rounded corners
                            //             ),
                            //           ),
                            //           child: Text(
                            //             'Book', // Update the button text
                            //             style: TextStyle(
                            //               color:
                            //                   Colors.white, // White text color
                            //               fontSize:
                            //                   20, // Adjust font size as needed
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //       Container(
                            //         height: 50,
                            //         width: 150,
                            //         child: ElevatedButton(
                            //           onPressed: () async {
                            //             // Share.share(message); // Share the event message
                            //           },
                            //           style: ElevatedButton.styleFrom(
                            //             backgroundColor: Color(0xFF4655)
                            //                 .withOpacity(
                            //                     0.5), // Red background with opacity
                            //             shape: RoundedRectangleBorder(
                            //               borderRadius: BorderRadius.circular(
                            //                   10), // Rectangle shape with rounded corners
                            //             ),
                            //           ),
                            //           child: Text(
                            //             'Share',
                            //             style: TextStyle(
                            //               color:
                            //                   Colors.white, // White text color
                            //               fontSize:
                            //                   20, // Adjust font size as needed
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            const SizedBox(height: 42),
                            Text(
                              'Location',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'IIIT Allahabad , Jhalwa',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70,
                              ),
                            ),
                            const SizedBox(height: 15),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            Mapscreen())); // Navigate to MapScreen
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    10), // Set the border radius
                                child: Container(
                                  width: double.infinity,
                                  height: 200,
                                  child: Image.asset(
                                    "assets/images/mpa.jpeg", // Specify your image path
                                    height: double
                                        .infinity, // Set the desired height
                                    width: double
                                        .infinity, // Set the desired width
                                    fit: BoxFit
                                        .cover, // Adjust the image to cover the box
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
