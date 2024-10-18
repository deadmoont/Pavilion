import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:pavilion/screens/SpecificEvents.dart';

import '../models/artists.dart';

class CustomCarouselSlider extends StatelessWidget {
  final List<Artists> data; // Accepting a list of Artists

  const CustomCarouselSlider({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: (size.height * 0.33 < 200) ? 200 : size.height * 0.33,
      child: CarouselSlider.builder(
        itemCount: data.length, // Use the length of the data list
        itemBuilder: (BuildContext context, int index, int realIndex) {
          // Get the image URL from the artist data
          var imageUrl = data[index].image ?? '';

          return GestureDetector(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2), // Add a white border
                  borderRadius: BorderRadius.circular(20), // Match the border radius with ClipRRect
                ),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>SpecificEvent(image: imageUrl, title: data[index].name ?? '', des: data[index].desc ?? '', venue: data[index].venue ?? '',)));
                  },
                  child: CachedNetworkImage(
                    imageUrl: imageUrl.isNotEmpty ? imageUrl : "fallback_image_url", // Provide a fallback image if URL is empty
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
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
          autoPlayAnimationDuration: Duration(milliseconds: 1000),
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
