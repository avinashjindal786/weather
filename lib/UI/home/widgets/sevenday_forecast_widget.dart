import 'package:flutter/material.dart';
import 'package:flutter_assignment/UI/home/widgets/common_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ForcastWidget extends StatelessWidget {
  const ForcastWidget({
    super.key,
    required this.size,
    required this.minTemp,
    required this.maxTemp,
  });

  final Size size;
  final int minTemp;
  final int maxTemp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.height * 0.02,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.white.withOpacity(0.05),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.02,
                  left: size.width * 0.03,
                ),
                child: Text(
                  '7-day forecast',
                  style: GoogleFonts.questrial(
                    color: Colors.white,
                    fontSize: size.height * 0.025,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.005),
              child: Column(
                children: [
                  buildSevenDayForecast(
                    "Today", //day
                    minTemp, //min temperature
                    maxTemp, //max temperature
                    FontAwesomeIcons.cloud, //weather icon
                    size,
                  ),
                  buildSevenDayForecast(
                    "Wed",
                    -5,
                    5,
                    FontAwesomeIcons.sun,
                    size,
                  ),
                  buildSevenDayForecast(
                    "Thu",
                    -2,
                    7,
                    FontAwesomeIcons.cloudRain,
                    size,
                  ),
                  buildSevenDayForecast(
                    "Fri",
                    3,
                    10,
                    FontAwesomeIcons.sun,
                    size,
                  ),
                  buildSevenDayForecast(
                    "San",
                    5,
                    12,
                    FontAwesomeIcons.sun,
                    size,
                  ),
                  buildSevenDayForecast(
                    "Sun",
                    4,
                    7,
                    FontAwesomeIcons.cloud,
                    size,
                  ),
                  buildSevenDayForecast("Mon", -2, 1, FontAwesomeIcons.snowflake, size),
                  buildSevenDayForecast("Tues", 0, 3, FontAwesomeIcons.cloudRain, size),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
