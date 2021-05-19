import 'package:animation/models/checking_entry.dart';
import 'package:animation/models/shoot_entry.dart';
import 'package:animation/screens/login/components/shoot_filter.dart';
import 'package:animation/size_config.dart';
import 'package:flutter/material.dart';
import 'land.dart';
import 'tabs.dart';
import 'package:provider/provider.dart';
import 'package:animation/models/information_data.dart';
import 'package:animation/screens/info_list.dart';
import 'checking_chip.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String newLoc;
  int newNumofTra;
  int newTime;
  String newNote;
  String newCheck;
  String newShoot;
  bool isFullSun = false;
  bool isDayMood = true;
  bool remember = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isFullSun = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    CheckingEntry checkingentry = CheckingEntry();
    ShootEntry shootentry = ShootEntry();

    List<Color> lightBgColors = [
      Color(0xFF8C2480),
      Color(0xFFCE587D),
      Color(0xFFFF9485),
      if (isFullSun) Color(0xFFFF9D80),
    ];
//Bg colors for night
    List<Color> darkBgColors = [
      Color(0xFF410d14),
      Color(0xFFce0f28),
      Color(0xFF8D0B04)
    ];

    Duration duration = Duration(seconds: 1);
    return SingleChildScrollView(
      child: AnimatedContainer(
        duration: duration,
        width: double.infinity,
        height: SizeConfig.screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDayMood ? darkBgColors : darkBgColors,
          ),
        ),
        child: Stack(
          children: [
            // AnimatedPositioned(
            //   curve: Curves.easeInOut,
            //   duration: duration,
            //   left: getProportionateScreenWidth(30),
            //   bottom: getProportionateScreenWidth(isFullSun ? -45 : -120),
            //   child: SvgPicture.asset("assets/icons/Sun.svg"),
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VerticalSpacing(),
                      Text(
                        'Burmese Spring Revolution Notes',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                      VerticalSpacing(of: 40),
                      Text(
                        'Location',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      TextField(
                        autofocus: true,
                        style: TextStyle(color: Colors.white),
                        onChanged: (value) => newLoc = value,
                      ),
                      VerticalSpacing(),
                      Text(
                        'Number of track',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      TextField(
                        autofocus: true,
                        style: TextStyle(color: Colors.white),
                        onChanged: (value) => newNumofTra = int.parse(value),
                      ),
                      VerticalSpacing(),
                      Text(
                        'Note',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      TextField(
                        autofocus: true,
                        style: TextStyle(color: Colors.white),
                        onChanged: (value) => newNote = value,
                      ),
                      VerticalSpacing(),
                      Text(
                        'Checking',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      CheckingChips(),
                      Text(
                        'Shoot',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      ShootFilter(),
                      VerticalSpacing(
                        of: 50.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FlatButton(
                            color: Colors.white,
                            onPressed: () {
                              Provider.of<InformationData>(context,
                                      listen: false)
                                  .addNewInformation(
                                      newLoc,
                                      newNumofTra,
                                      newNote,
                                      checkingentry.filter,
                                      shootentry.filters);
                              Navigator.pushNamed(context, InformationList.id);
                            },
                            child: Text(
                              'Convert',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void changeMood(int activeTab) {
    if (activeTab == 0) {
      //daymood
      setState(() {
        isDayMood = true;
      });
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          isFullSun = true;
        });
      });
    } else {
      setState(() {
        isFullSun = false;
      });
      Future.delayed(Duration(milliseconds: 100), () {
        setState(() {
          isDayMood = false;
        });
      });
    }
  }
}
