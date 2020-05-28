import 'dart:convert';

import 'package:covid19/models/countrymodel.dart';
import 'package:flutter/material.dart';
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
                    child: Text('Loading info ...',style: TextStyle(fontSize: 20.0),),
                  ),
                ],
              ),
            ),
          )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        height: 130,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 200,
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child:  Column(
                                crossAxisAlignment: index%2==0?CrossAxisAlignment.start:CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    jsonData[index]['country'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Image.network(
                                    jsonData[index]['countryInfo']['flag'],
                                    height: 50,
                                    width: 60,
                                  ),
                                ],
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
    );
  }
}
