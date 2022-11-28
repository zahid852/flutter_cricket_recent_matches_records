import 'dart:convert';

import 'package:cricket_app/cricketStatModel.dart';
import 'package:http/http.dart';

class CricketApi {
  //  final String ApiUrl =
  //     'https://cricbuzz-cricket.p.rapidapi.com/matches/v1/recent';
  static const api_key = 'acfebcf973mshe669a4cfc7ab64ap1cf31bjsn34b5444f0209';
  static const headers = {
    'X-RapidAPI-Key': api_key,
    'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com'
  };
  final uri =
      Uri.parse('https://cricbuzz-cricket.p.rapidapi.com/matches/v1/recent');
  Future<List<CricketMatchStatsModel>> getAllData() async {
    print('fetching');
    Response response = await get(uri, headers: headers);

    var body;
    int count = 1;
    List<CricketMatchStatsModel> Matches = [];
    if (response.statusCode == 200) {
      body = jsonDecode(response.body);
      // print('body $body');
      List<dynamic> matchesDynamic = body['typeMatches'][0]['seriesMatches'][0]
          ['seriesAdWrapper']['matches'];
      print('total matches ${matchesDynamic.length}');
      List<CricketMatchStatsModel> matches = matchesDynamic.map((item) {
        print('number $count');
        count++;
        return CricketMatchStatsModel.fromJson(item);
      }).toList();
      // print('matches $matches');
      Matches = matches;
      return Matches;
    }
    return Matches;
  }
}
