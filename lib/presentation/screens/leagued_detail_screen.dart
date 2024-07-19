import 'package:flutter/material.dart';

class LeagueDetailScreen extends StatelessWidget {
  final String leagueName;
  final String seasonYear;
  final List<Map<String, dynamic>> standings;
  final List<Map<String, dynamic>> recentResults;
  final List<Map<String, dynamic>> upcomingMatches;

  LeagueDetailScreen({
    required this.leagueName,
    required this.seasonYear,
    required this.standings,
    required this.recentResults,
    required this.upcomingMatches,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('League Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              PromotionalBanner(
                text: "Get the Latest League Updates and Standings!",
              ),
              SizedBox(height: 16.0),
              Text(
                'League Name: $leagueName',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Current Season: $seasonYear',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 16.0),
              Text(
                'Standings:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              for (var team in standings)
                ListTile(
                  title: Text(team['team']),
                  trailing: Text(team['points'].toString()),
                ),
              SizedBox(height: 16.0),
              Text(
                'Recent Results:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              for (var result in recentResults)
                ListTile(
                  title: Text(
                      '${result['teamA']} ${result['score']} ${result['teamB']}'),
                ),
              SizedBox(height: 16.0),
              Text(
                'Upcoming Matches:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              for (var match in upcomingMatches)
                ListTile(
                  title: Text('${match['teamA']} vs ${match['teamB']}'),
                  subtitle: Text(match['date']),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class PromotionalBanner extends StatelessWidget {
  final String text;

  PromotionalBanner({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.blue,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
