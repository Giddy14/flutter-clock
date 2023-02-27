import 'package:flutter/material.dart';
import 'package:flutter_application_2/clock_widgets.dart';
import 'package:flutter_application_2/style.dart';
import 'package:flutter_application_2/time_model.dart';
import 'package:timer_builder/timer_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              //upgrading the clock
              // ignore: prefer_const_constructors
              TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
                var currentTime = DateTime.now();
                //string clock values
                String seconds = currentTime.second < 10
                    ? "0${currentTime.second}"
                    : "${currentTime.second}";

                String minute = currentTime.minute < 10
                    ? "0${currentTime.minute}"
                    : "${currentTime.minute}";

                String hours = currentTime.hour < 10
                    ? "0${currentTime.hour}"
                    : "${currentTime.hour}";

                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Today", style: AppStyle.mainTextThin),
                        Text(
                          "$hours:$minute:$seconds",
                          style: AppStyle.mainText,
                        ),
                      ],
                    ),
                    Center(
                        child: ClockWidget(TimeModel(currentTime.hour,
                            currentTime.minute, currentTime.second))),
                  ],
                );
              }),
              SizedBox(
                height: 60.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "select another Time Zone",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Divider(
                    color: Colors.black45,
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 24.0),
                      width: MediaQuery.of(context).size.width - 52,
                      height: 100.0,
                      padding: EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: AppStyle.primaryColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Bei JIn",
                                style: AppStyle.mainTextwhite,
                              ),
                              Text(
                                "${DateTime.now().hour}:${DateTime.now().minute}",
                                style: AppStyle.mainTextwhite,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "Today",
                            style: AppStyle.mainTextThinWhite,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 24.0),
                      width: MediaQuery.of(context).size.width - 52,
                      height: 100.0,
                      padding: EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: AppStyle.primaryColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Bei JIn",
                                style: AppStyle.mainTextwhite,
                              ),
                              Text(
                                "${DateTime.now().hour}:${DateTime.now().minute}",
                                style: AppStyle.mainTextwhite,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "Today",
                            style: AppStyle.mainTextThinWhite,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60.0,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppStyle.primaryColor,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.watch_later), label: "Clock"),
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: "Alarm"),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: "Stopwatch"),
          BottomNavigationBarItem(
              icon: Icon(Icons.timelapse_outlined), label: "Timer"),
        ],
      ),
    );
  }
}
