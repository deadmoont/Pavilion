import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:pavilion/database/Apis.dart';
import 'package:pavilion/screens/event_screen.dart';
import 'loading_view.dart';

class SocietyCarousel extends StatelessWidget {
  final List<String> data; // Accepting a list of Artists
  const SocietyCarousel({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: (size.height * 0.23 < 150) ? 150 : size.height * 0.187,
      child: CarouselSlider.builder(
        itemCount: data.length, // Use the length of the data list
        itemBuilder: (BuildContext context, int index, int realIndex) {
          // Get the image URL from the artist data
          Map<String, String> list = {
            "Sarasva": "https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/cover%20page%2Fsarsva%2Fcover%20sarasva.jpg?alt=media&token=e9f9bed9-14ff-4260-a1ca-8f6bc4c13724",
            "nirmiti": "https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/cover%20page%2Fnirmiti%2F53652925228_b28ccb3b24_o.jpg?alt=media&token=6ecb4670-563e-4a38-a4e3-6e449be01b2d",
            "AMS": "https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/cover%20page%2Fams%2FScreenshot%202024-10-23%20031440.png?alt=media&token=38a45e84-6e10-4179-b404-6cf9a281c0a0",
            "GeneticX":"https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/cover%20page%2FgeneticX%2F53119356397_4b9ba6d9e2_o.jpg?alt=media&token=22b3e698-312c-40bc-80a9-863d31a3adbd",
            "Rangtarangini": "https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/cover%20page%2Frangtarangini%2Fcover%20rang.jpg?alt=media&token=8add05a3-fb9a-4659-a15f-56e8a7f78539",
            "Virtuosi": "https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/cover%20page%2Fvirtuosi%2F53125815465_ca3b4e2ab6_o.jpg?alt=media&token=a87f1474-d20a-4216-950f-113fc4d2573c",
            "Informal": "https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Main%20Stage%2FAlaMode%2FScreenshot%202024-10-17%20212502.png?alt=media&token=8773e1d7-b287-4f92-a3b6-41c455e38d91",
            "Main Stage": "https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Main%20Stage%2Fpexels-teddy-2263435.jpg?alt=media&token=e57c153a-f73f-4f52-a07f-9907d376b93e",
          };

          return GestureDetector(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => EventScreen(
                              list: APIs.societyeventslist[index],
                              item: data[index],
                            )));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.white, width: 2), // White border
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: list[data[index]] ?? "https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/cover%20page%2Fsarsva%2Fcover%20sarasva.jpg?alt=media&token=e9f9bed9-14ff-4260-a1ca-8f6bc4c13724", // Provide a fallback image if URL is empty
                    fit: BoxFit.fill,
                    placeholder: (context, url) => Image.asset(
                        "assets/images/placeholder.png",
                        fit: BoxFit.cover), // Placeholder image
                    errorWidget: (context, url, error) => Image.asset(
                        "assets/images/placeholder.png",
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: (size.height * 0.23 < 100) ? 100 : size.height * 0.33,
          aspectRatio: 20 / 5,
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
