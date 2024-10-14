import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({super.key});

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  List<StepperData> stepperData = [
    temp(),
    temp(),
    temp(),
    temp(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "TimeLine",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Text(
                "Day 1",
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
              const SizedBox(height: 50),
              AnotherStepper(
                stepperList: stepperData,
                stepperDirection: Axis.vertical,
                activeBarColor: Colors.red,
                inActiveBarColor: Colors.grey,
                activeIndex: 2,
                barThickness: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static StepperData temp(){
    return StepperData(
      title: StepperText(
        "Concert",
        textStyle: const TextStyle(
          color: Colors.white, // Updated to make the title more visible
          fontSize: 38,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: StepperText(
        "Main Stage",
        textStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 24,
        ),
      ),
      iconWidget: Container(
        width: 15,
        height: 15,
        decoration: const BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}