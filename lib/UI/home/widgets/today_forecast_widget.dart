import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common_widget.dart';

class TodayForecastWidget extends StatelessWidget {
  const TodayForecastWidget({
    super.key,
    required this.size,
    required this.currTemp,
  });

  final Size size;
  final int currTemp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
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
                  top: size.height * 0.01,
                  left: size.width * 0.03,
                ),
                child: Text(
                  'Forecast for today',
                  style: GoogleFonts.questrial(
                    color: Colors.white,
                    fontSize: size.height * 0.025,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.005),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildForecastToday(
                      "Now", //hour
                      currTemp, //temperature
                      20, //wind (km/h)
                      0, //rain chance (%)
                      FontAwesomeIcons.sun, //weather icon
                      size,
                    ),
                    buildForecastToday(
                      "15:00",
                      1,
                      10,
                      40,
                      FontAwesomeIcons.cloud,
                      size,
                    ),
                    buildForecastToday(
                      "16:00",
                      0,
                      25,
                      80,
                      FontAwesomeIcons.cloudRain,
                      size,
                    ),
                    buildForecastToday(
                      "17:00",
                      -2,
                      28,
                      60,
                      FontAwesomeIcons.snowflake,
                      size,
                    ),
                    buildForecastToday(
                      "18:00",
                      -5,
                      13,
                      40,
                      FontAwesomeIcons.cloudMoon,
                      size,
                    ),
                    buildForecastToday(
                      "19:00",
                      -8,
                      9,
                      60,
                      FontAwesomeIcons.snowflake,
                      size,
                    ),
                    buildForecastToday(
                      "20:00",
                      -13,
                      25,
                      50,
                      FontAwesomeIcons.snowflake,
                      size,
                    ),
                    buildForecastToday(
                      "21:00",
                      -14,
                      12,
                      40,
                      FontAwesomeIcons.cloudMoon,
                      size,
                    ),
                    buildForecastToday(
                      "22:00",
                      -15,
                      1,
                      30,
                      FontAwesomeIcons.moon,
                      size,
                    ),
                    buildForecastToday(
                      "23:00",
                      -15,
                      15,
                      20,
                      FontAwesomeIcons.moon,
                      size,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
