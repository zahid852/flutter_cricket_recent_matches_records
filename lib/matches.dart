import 'package:country_code_picker/country_code_picker.dart';
import 'package:cricket_app/country_flag.dart';
import 'package:cricket_app/cricketStatModel.dart';
import 'package:cricket_app/detail_page.dart';
import 'package:flutter/material.dart';

Widget MatchesDone(
    BuildContext ctx, List<CricketMatchStatsModel> data, String search) {
  String countryName1 = "+91";
  String countryName2 = "+91";
  return Container(
    padding: EdgeInsets.only(top: 25),
    width: double.infinity,
    height: double.infinity,
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 20),
          child: Text(
            'Matches',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: Container(
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                  bottom: 25,
                ),
                itemCount: data.length,
                itemBuilder: (context, ind) {
                  switch (data[ind].Team1.teamName) {
                    case 'Ireland':
                      countryName1 = "+353";
                      break;
                    case 'England':
                      countryName1 = "United Kingdom";
                      break;
                    case 'Scotland':
                      countryName1 = "+44";
                      break;
                    case 'Netherlands':
                      countryName1 = "+31";
                      break;
                    case 'India':
                      countryName1 = "+91";
                      break;
                    default:
                      countryName1 = data[ind].Team1.teamName;
                  }
                  switch (data[ind].Team2.teamName) {
                    case 'Ireland':
                      countryName2 = "+353";
                      break;
                    case 'England':
                      countryName2 = "United Kingdom";
                      break;
                    case 'Scotland':
                      countryName2 = "+44";
                      break;
                    case 'Netherlands':
                      countryName2 = "+31";
                      break;
                    case 'India':
                      countryName2 = "+91";
                      break;
                    default:
                      countryName2 = data[ind].Team2.teamName;
                  }
                  if (search == '') {
                    return card(ctx, countryName1, countryName2, data[ind]);
                  } else if (data[ind]
                          .Team1
                          .teamSName
                          .toLowerCase()
                          .startsWith(search) ||
                      data[ind]
                          .Team2
                          .teamSName
                          .toLowerCase()
                          .startsWith(search)) {
                    return card(ctx, countryName1, countryName2, data[ind]);
                  } else {
                    return Container();
                  }
                }),
          ),
        ),
      ],
    ),
  );
}

Widget card(BuildContext context, String cn1, String cn2,
    CricketMatchStatsModel matchData) {
  return GestureDetector(
    onTap: () {
      Navigator.of(
        context,
      ).pushNamed(details.route, arguments: [matchData, cn1, cn2]);
    },
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 55,
                      child: CountryCodePicker(
                        padding: EdgeInsets.all(0),
                        enabled: false,
                        initialSelection: '${cn1}',
                        hideMainText: true,
                        flagWidth: 50,
                        showCountryOnly: true,
                      )),
                  Text(matchData.Team1.teamSName),
                ],
              ),
            ),
            Text(
              'vs',
              style: TextStyle(
                  color: Colors.red, fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 55,
                      child: CountryCodePicker(
                        padding: EdgeInsets.all(0),
                        enabled: false,
                        initialSelection: '${cn2}',
                        hideMainText: true,
                        flagWidth: 50,
                        showCountryOnly: true,
                      )),
                  Text(matchData.Team2.teamSName),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
