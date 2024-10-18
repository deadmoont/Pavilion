import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import '../models/artists.dart';
import '../screens/SpecificEvents.dart';

class SocietyCarousel extends StatelessWidget {
  final List<Artists> data; // Accepting a list of Artists
  const SocietyCarousel({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: (size.height * 0.23 < 150) ? 150 : size.height * 0.23,
      child: CarouselSlider.builder(
        itemCount: data.length, // Use the length of the data list
        itemBuilder: (BuildContext context, int index, int realIndex) {
          // Get the image URL from the artist data
          var imageUrl = data[index].image ?? '';

          return GestureDetector(
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>SpecificEvent(image: imageUrl, title: data[index].name ?? '', des: data[index].desc ?? '', venue: data[index].venue ?? '',)));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2), // White border
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
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
          height: (size.height * 0.23 < 100) ? 100 : size.height * 0.33,
          aspectRatio: 20/ 5,
          reverse: false,
          initialPage: 0,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 1000),
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
