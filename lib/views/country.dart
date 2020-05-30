import 'dart:convert';

import 'package:covid19/models/countrymodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;

class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}

List<Countrymodel> list = [];
var jsonData;
bool isLoading = true;

class _CountryState extends State<Country> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var url = 'https://corona.lmao.ninja/v2/countries';
    var response = await http.get(url);
    setState(() {
      jsonData = jsonDecode(response.body);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      theme: ThemeData.dark(),

      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff202c3b),
          title: Text(
            'Covid-19 Tracker',
          ),
        ),
        body: Container(
          child: isLoading
              ? Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(
                          backgroundColor: Colors.pink,
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Loading info ...',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xffC9D6FF), Color(0xFFE2E2E2)],
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 120,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      jsonData[index]['country'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                    Image.network(
                                      jsonData[index]['countryInfo']['flag'],
                                      height: 80,
                                      width: 100,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Confirmed cases: ' +
                                            jsonData[index]['cases'].toString(),
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                      Text(
                                        'Active cases: ' +
                                            jsonData[index]['active']
                                                .toString(),
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                      Text(
                                        'Recovered cases: ' +
                                            jsonData[index]['recovered']
                                                .toString(),
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                      Text(
                                        'Death cases: ' +
                                            jsonData[index]['deaths']
                                                .toString(),
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
