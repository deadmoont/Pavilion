import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingView extends StatelessWidget {
  final double height;
  final double width;

  // Constructor to accept height and width as parameters
  const LoadingView({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset(
          'assets/animation/LoadingNew.json', // Replace with your Lottie JSON path
          height: height,
          width: width,
          fit: BoxFit.cover,
        ),
    );
  }
}
