import 'package:flutter/material.dart';
import 'package:flutter_assignment/UI/home/widgets/common_widget.dart';
import 'package:flutter_assignment/UI/home/widgets/sevenday_forecast_widget.dart';
import 'package:flutter_assignment/UI/home/widgets/today_forecast_widget.dart';
import 'package:flutter_assignment/core/provider/user.dart';
import 'package:flutter_assignment/core/utils/fonts_and_sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/drawer/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String cityName = "Katowice"; //city name
    int currTemp = 30; // current temperature
    int maxTemp = 30; // today max temperature
    int minTemp = 2; // today min temperature
    Size size = MediaQuery.of(context).size;
    Provider.of<UserProvider>(context).getUserData();
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerUtil.getDrawer(context),
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/background.png"), fit: BoxFit.fill)),
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.01,
                          horizontal: size.width * 0.05,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                scaffoldKey.currentState!.openDrawer();
                              },
                              child: const FaIcon(
                                FontAwesomeIcons.bars,
                                color: Colors.white,
                              ),
                            ),
                            Align(
                              child: Text(
                                'Weather App',
                                style: GoogleFonts.questrial(
                                  color: Colors.white,
                                  fontSize: size.height * 0.02,
                                ),
                              ),
                            ),
                            const FaIcon(
                              FontAwesomeIcons.plusCircle,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                        ),
                        child: Align(
                          child: Text(
                            cityName,
                            style: GoogleFonts.questrial(
                              color: Colors.white,
                              fontSize: size.height * 0.06,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.005,
                        ),
                        child: Align(
                          child: Text(
                            'Today', //day
                            style: GoogleFonts.questrial(
                              color: Colors.white54,
                              fontSize: size.height * 0.035,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                        ),
                        child: Align(
                          child: Text(
                            '$currTemp˚C', //curent temperature
                            style: GoogleFonts.questrial(
                              color: FontColors.primaryColor,
                              fontSize: size.height * 0.13,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.25),
                        child: const Divider(color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.005,
                        ),
                        child: Align(
                          child: Text(
                            'Sunny', // weather
                            style: GoogleFonts.questrial(
                              color: Colors.white54,
                              fontSize: size.height * 0.03,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                          bottom: size.height * 0.01,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$minTemp˚C', // min temperature
                              style: GoogleFonts.questrial(
                                color: minTemp <= 0
                                    ? Colors.blue
                                    : minTemp > 0 && minTemp <= 15
                                        ? Colors.indigo
                                        : minTemp > 15 && minTemp < 30
                                            ? Colors.deepPurple
                                            : Colors.pink,
                                fontSize: size.height * 0.03,
                              ),
                            ),
                            Text(
                              '/',
                              style: GoogleFonts.questrial(
                                color: Colors.white54,
                                fontSize: size.height * 0.03,
                              ),
                            ),
                            Text(
                              '$maxTemp˚C', //max temperature
                              style: GoogleFonts.questrial(
                                color: FontColors.primaryColor,
                                fontSize: size.height * 0.03,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TodayForecastWidget(size: size, currTemp: currTemp),
                      ForcastWidget(size: size, minTemp: minTemp, maxTemp: maxTemp),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
