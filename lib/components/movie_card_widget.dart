import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieCardWidget extends StatelessWidget {
  // final Future<UpcomingMovieModel> future;
  // final String headLineText;
  const MovieCardWidget(
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width: 200, // Takes up the full width of the parent
                                height: 50, // Set the desired height of the container
                                child: CachedNetworkImage(
                                  imageUrl: "https://www.colorhexa.com/242424.png",
                                  fit: BoxFit.cover, // Ensures the image covers the entire container
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              );
      // FutureBuilder(
      //   future: future,
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       var data = snapshot.data?.results;
      //       return
    //       Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(
      //             headLineText,
      //             style: const TextStyle(fontWeight: FontWeight.bold),
      //           ),
      //           SizedBox(
      //             height: 20,
      //           ),
      //           Expanded(
      //             child: ListView.builder(
      //                 itemCount: data!.length,
      //                 scrollDirection: Axis.horizontal,
      //                 itemBuilder: (context, index) {
      //                   return Container(
      //                     padding: const EdgeInsets.all(5),
      //                     decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(20),
      //                     ),
      //                     child: Image.network(
      //                         "${imageUrl}${data[index].posterPath}"),
      //                   );
      //                 }),
      //           )
      //         ],
      //       );
      //     } else {
      //       return const SizedBox.shrink();
      //     }
      //   });
  }
}
