import 'package:flutter/material.dart';
import 'package:pavilion/components/SocietyCard.dart';
import 'package:pavilion/components/custom_carousel.dart';
import 'package:pavilion/components/movie_card_widget.dart';
import 'package:pavilion/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ApiServices apiServices = ApiServices();
  //
  // late Future<MovieModel> upcomingFuture;
  // late Future<MovieModel> nowPlaying;
  // late Future<TvSeriesModel> topRatedShows;

  @override
  void initState() {
    // upcomingFuture = apiServices.getUpcomingMovies();
    // nowPlaying = apiServices.getNowPlayingMovies();
    // topRatedShows = apiServices.getTopRatedSeries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.BLACK,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CustomCarouselSlider(),
            // FutureBuilder<TvSeriesModel>(
            //   future: topRatedShows,
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return CustomCarouselSlider(data: snapshot.data!);
            //     }s
            //     return const SizedBox();
            //   },
            // ),
            const SizedBox(
              height: 5,
            ),
            Text("Upcomming Events" , style: TextStyle(color: Color(0xFFF802AC), fontSize: 35 , fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 100,
              child: MovieCardWidget(),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 100,
              child: MovieCardWidget(),
            ),
            Text("Society  events" , style: TextStyle(color: Color(0xFFF802AC), fontSize: 35 , fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 150,
              child: SocietyCard(),
            ),
          ],
        ),
      ),
    );
  }
}
