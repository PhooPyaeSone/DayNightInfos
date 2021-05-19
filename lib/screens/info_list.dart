import 'package:animation/models/checking_entry.dart';
import 'package:animation/models/shoot_entry.dart';
import 'package:animation/size_config.dart';
import 'package:flutter/material.dart';
import 'package:animation/models/information_data.dart';
import 'package:provider/provider.dart';

import 'login/components/land.dart';

class InformationList extends StatelessWidget {
  static const String id = 'info_list_screen';

  @override
  Widget build(BuildContext context) {
    //Bg colors for night
    List<Color> darkBgColors = [
      Color(0xFF410d14),
      Color(0xFFce0f28),
      Color(0xFF8D0B04)
    ];
    return Scaffold(
      backgroundColor: Color(0xFF410d14),
      body: SafeArea(
        child: Consumer3<InformationData, CheckingEntry, ShootEntry>(
            builder: (context, infoData, checking, shootentry, child) {
          return ListView.builder(
            itemCount: infoData.informationLength,
            itemBuilder: (context, index) {
              return AnimatedContainer(
                duration: Duration(seconds: 1),
                width: double.infinity,
                height: SizeConfig.screenHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomRight,
                      colors: darkBgColors),
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'Burmese Spring Revolution Notes',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        VerticalSpacing(),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 10.0),
                          child: Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          '${infoData.informations[index].location ?? " "} မှာ စစ်ကား ${infoData.informations[index].numoftrack.toString() ?? " "} ကားရှိပါတယ် ${infoData.informations[index].note ?? " "}',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.warning,
                                        size: 33,
                                        color: Colors.redAccent,
                                      ),
                                      Text(
                                        'မအလစစ်ဆေး သတိထားရန် ',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 20),
                                      ),
                                      Icon(
                                        Icons.warning,
                                        size: 33,
                                        color: Colors.redAccent,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: checking.filter
                                        .map(
                                          (check) => Text(
                                            check + '    /   ',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 20),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ],
                              ),
                              VerticalSpacing(),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.error,
                                        size: 33,
                                        color: Colors.redAccent,
                                      ),
                                      Text(
                                        'လက်နက်အခြေအနေ',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 20),
                                      ),
                                      Icon(
                                        Icons.error,
                                        size: 33,
                                        color: Colors.redAccent,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: shootentry.filters
                                        .map(
                                          (shoot) => Text(
                                            shoot + '    /   ',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 20),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ],
                              ),
                              VerticalSpacing(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'အရေးတော်ပုံအောင်ရမည်',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Land(),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
