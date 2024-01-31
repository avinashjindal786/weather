import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildForecastToday(
  String time,
  int temp,
  int wind,
  int rainChance,
  IconData weatherIcon,
  size,
) {
  return Padding(
    padding: EdgeInsets.all(size.width * 0.025),
    child: Column(
      children: [
        Text(
          time,
          style: GoogleFonts.questrial(
            color: Colors.white,
            fontSize: size.height * 0.02,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.005,
              ),
              child: FaIcon(
                weatherIcon,
                color: Colors.white,
                size: size.height * 0.03,
              ),
            ),
          ],
        ),
        Text(
          '$temp˚C',
          style: GoogleFonts.questrial(
            color: Colors.white,
            fontSize: size.height * 0.025,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01,
              ),
              child: FaIcon(
                FontAwesomeIcons.wind,
                color: Colors.grey,
                size: size.height * 0.03,
              ),
            ),
          ],
        ),
        Text(
          '$wind km/h',
          style: GoogleFonts.questrial(
            color: Colors.grey,
            fontSize: size.height * 0.02,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01,
              ),
              child: FaIcon(
                FontAwesomeIcons.umbrella,
                color: Colors.blue,
                size: size.height * 0.03,
              ),
            ),
          ],
        ),
        Text(
          '$rainChance %',
          style: GoogleFonts.questrial(
            color: Colors.blue,
            fontSize: size.height * 0.02,
          ),
        ),
      ],
    ),
  );
}

Widget buildSevenDayForecast(
  String time,
  int minTemp,
  int maxTemp,
  IconData weatherIcon,
  size,
) {
  return Padding(
    padding: EdgeInsets.all(
      size.height * 0.005,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.02,
              ),
              child: Text(
                time,
                style: GoogleFonts.questrial(
                  color: Colors.white,
                  fontSize: size.height * 0.025,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.25,
              ),
              child: FaIcon(
                weatherIcon,
                color: Colors.white,
                size: size.height * 0.03,
              ),
            ),
            Align(
              child: Padding(
                padding: EdgeInsets.only(
                  left: size.width * 0.15,
                ),
                child: Text(
                  '$minTemp˚C',
                  style: GoogleFonts.questrial(
                    color: Colors.white38,
                    fontSize: size.height * 0.025,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                ),
                child: Text(
                  '$maxTemp˚C',
                  style: GoogleFonts.questrial(
                    color: Colors.white,
                    fontSize: size.height * 0.025,
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(
          color: Colors.white,
        ),
      ],
    ),
  );
}
