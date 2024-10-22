import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';

import '../models/artists.dart';

class NewCustomCarousel extends StatelessWidget {
  final List<Artists> data;
  const NewCustomCarousel({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: 350,
      child: CarouselSlider.builder(
        itemCount: data.length, // Use the length of the data list
        itemBuilder: (BuildContext context, int index, int realIndex) {
          // Get the image URL and text data from the artist data
          var imageUrl = data[index].image ?? '';
          var title = data[index].name ?? 'Effe 24';
          // var subtitle = data[index].?? '17 Oct 2024, Kanpur';
          var subtitle = "";
          // var description = data[index]["description"] ?? 'India';
          var description = "";

          return GestureDetector(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16), // Rounded corners for the container
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5), // Black shadow
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(2, 6), // Position of the shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(16), // Match the border radius with ClipRRect
                ),
                child: InkWell(
                  onTap: () {
                    // log("hello reel url :  ${data[index].reels}");
                    // Navigator.push(context,MaterialPageRoute(builder: (context)=>EventDetailsPage()));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16), // Apply rounded corners to the image itself
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: imageUrl.isNotEmpty
                              ? imageUrl
                              : "fallback_image_url", // Provide a fallback image if URL is empty
                          fit: BoxFit.cover, // Ensure the image covers the container
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                          width: double.infinity,
                          height: double.infinity,
                        ),
                        Positioned(
                          bottom: 80, // Position of the first text widget
                          left: 20,
                          child: Text(
                            title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 5.0,
                                  color: Colors.black,
                                  offset: Offset(1.0, 1.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 40, // Position of the second text widget
                          left: 20,
                          child: Text(
                            subtitle,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              shadows: [
                                Shadow(
                                  blurRadius: 5.0,
                                  color: Colors.black,
                                  offset: Offset(1.0, 1.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 15, // Position of the third text widget
                          left: 20,
                          child: Text(
                            description,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              shadows: [
                                Shadow(
                                  blurRadius: 5.0,
                                  color: Colors.black,
                                  offset: Offset(1.0, 1.0),
                                ),
                              ],
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
        },
        options: CarouselOptions(
          height: 280,
          aspectRatio: 20 / 5,
          reverse: false,
          initialPage: 0,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 1000),
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}