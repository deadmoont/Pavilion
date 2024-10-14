import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: (size.height * 0.33 < 200) ? 200 : size.height * 0.33,
      child: CarouselSlider.builder(
          // itemCount: data.results.length,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            // var url = data.results[index].backdropPath.toString();

            return GestureDetector(
              child: Expanded(
                child: Column(
                children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: double.infinity, // Takes up the full width of the parent
                          height: 200, // Set the desired height of the container
                          child: CachedNetworkImage(
                            imageUrl: "https://tse1.mm.bing.net/th?id=OIP.gYoxieJMypWGDNMBHu7nLwHaFL&pid=Api&P=0&h=180",
                            fit: BoxFit.cover, // Ensures the image covers the entire container
                          ),
                        ),
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // Text("Dr Doom", style: TextStyle(color: Colors.white),),
                ],
            ),

            ),
            );
          },
          options: CarouselOptions(
              height: (size.height * 0.33 < 200) ? 200 : size.height * 0.33,
              aspectRatio: 16 / 9,
              reverse: false,
              initialPage: 0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal)),
    );
  }
}
