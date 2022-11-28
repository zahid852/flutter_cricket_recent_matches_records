import 'package:country_code_picker/country_code_picker.dart';
import 'package:cricket_app/cricketStatModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class details extends StatefulWidget {
  static const route = '/details-pages';
  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> matchData =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    CricketMatchStatsModel data = matchData[0];

    String dateWithT = data.MatchInfo.date.substring(0, 8);

    DateTime dateTime = DateTime.parse(dateWithT);
    // DateTime tempDate = new DateFormat("yyyy-MM-dd").parse(dateWithT);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text('Match Details'),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                    child: Text(
                  data.MatchInfo.seriesName,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Center(
                    child: Text(
                  data.MatchInfo.matchDesc,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 70,
                            width: double.infinity,
                            child: CountryCodePicker(
                              padding: EdgeInsets.all(0),
                              enabled: false,
                              initialSelection: '${matchData[1]}',
                              hideMainText: true,
                              flagWidth: double.infinity,
                              showCountryOnly: true,
                            )),
                        Text(
                          data.Team1.teamName,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                data.Tscore.runs,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w400),
                              ),
                              Text(
                                '/${data.Tscore.wickets}',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Overs',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          data.Tscore.overs,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 70,
                            width: double.infinity,
                            child: CountryCodePicker(
                              padding: EdgeInsets.all(0),
                              enabled: false,
                              initialSelection: '${matchData[2]}',
                              hideMainText: true,
                              flagWidth: double.infinity,
                              showCountryOnly: true,
                            )),
                        Text(
                          data.Team2.teamName,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                data.Team2Score.runs,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w400),
                              ),
                              Text(
                                '/${data.Team2Score.wickets}',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Overs',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          data.Team2Score.overs,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                    child: Text(
                  data.MatchInfo.status,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                    child: Text(
                  '${dateTime}',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
