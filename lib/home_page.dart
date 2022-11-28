import 'package:country_code_picker/country_code_picker.dart';
import 'package:cricket_app/cricketStatModel.dart';
import 'package:cricket_app/matches.dart';
import 'package:flutter/material.dart';
import './api_manager.dart';

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  Future? data;
  @override
  void initState() {
    data = CricketApi().getAllData();
    super.initState();
  }

  TextEditingController searchEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
        title: Text('T20 World Cup'),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.only(bottom: 8),
              height: 55,
              child: TextField(
                controller: searchEditingController,
                onChanged: (_) {
                  setState(() {});
                },
                // cursorColor: Colors.white,
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                  hintText: 'search match here',
                  prefixIcon: Icon(Icons.search),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: FutureBuilder(
                  future: data,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Center(
                          child: MatchesDone(
                              context,
                              snapshot.data ?? [],
                              searchEditingController.text.isEmpty
                                  ? ''
                                  : searchEditingController.text));
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
