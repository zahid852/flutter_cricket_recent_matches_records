import 'dart:async';

class CricketMatchStatsModel {
  matchInfo MatchInfo;
  team Team1;
  team Team2;
  VenuInfo venuInfo;
  team1Score Tscore;
  team2Score Team2Score;
  CricketMatchStatsModel(this.MatchInfo, this.Team1, this.Team2, this.venuInfo,
      this.Tscore, this.Team2Score);

  factory CricketMatchStatsModel.fromJson(Map<String, dynamic> json) {
    String t1_runs;
    String t1_wickets;
    String t1_overs;

    String t2_runs;
    String t2_wickets;
    String t2_overs;
    if (json.containsKey('matchScore')) {
      t1_overs = json['matchScore']['team1Score']['inngs1']['overs'].toString();
      t1_runs = json['matchScore']['team1Score']['inngs1']['runs'].toString();
      t1_wickets =
          json['matchScore']['team1Score']['inngs1']['wickets'].toString();

      t2_overs = json['matchScore']['team2Score']['inngs1']['overs'].toString();
      t2_runs = json['matchScore']['team2Score']['inngs1']['runs'].toString();
      t2_wickets =
          json['matchScore']['team2Score']['inngs1']['wickets'].toString();
    } else {
      t1_runs = '';
      t1_wickets = '';
      t1_overs = '';

      t2_runs = '';
      t2_wickets = '';
      t2_overs = '';
    }
    return CricketMatchStatsModel(
        matchInfo.fromJson(json['matchInfo']),
        team.fromJson(json['matchInfo']['team1']),
        team.fromJson(json['matchInfo']['team2']),
        VenuInfo.fromJson(json['matchInfo']['venueInfo']),
        team1Score.fromJson(t1_runs, t1_wickets, t1_overs),
        team2Score.fromJson(t2_runs, t2_wickets, t2_overs));
  }
}

class matchInfo {
  String seriesName;
  String matchDesc;
  String status;
  String date;
  matchInfo(this.seriesName, this.matchDesc, this.status, this.date);
  factory matchInfo.fromJson(Map<String, dynamic> json) {
    return matchInfo(
        json['seriesName'], json['matchDesc'], json['status'], json['endDate']);
  }
}

class team {
  String teamName;
  String teamSName;
  int imageId;
  team(this.teamName, this.teamSName, this.imageId);
  factory team.fromJson(Map<String, dynamic> json) {
    return team(json['teamName'], json['teamSName'], json['imageId']);
  }
}

class VenuInfo {
  String ground;
  String city;
  String timeZone;
  VenuInfo(this.ground, this.city, this.timeZone);
  factory VenuInfo.fromJson(Map<String, dynamic> json) {
    return VenuInfo(json['ground'], json['city'], json['timezone']);
  }
}

class team1Score {
  String runs;
  String wickets;
  String overs;

  team1Score(this.runs, this.wickets, this.overs);
  factory team1Score.fromJson(String t_runs, String t_wickets, String t_overs) {
    return team1Score(t_runs, t_wickets, t_overs);
  }
}

class team2Score {
  String runs;
  String wickets;
  String overs;

  team2Score(this.runs, this.wickets, this.overs);
  factory team2Score.fromJson(String t_runs, String t_wickets, String t_overs) {
    return team2Score(t_runs, t_wickets, t_overs);
  }
}
