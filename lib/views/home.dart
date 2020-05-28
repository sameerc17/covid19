import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;

import 'country.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

bool isLoading = true;
String c, a, r, d, tt, ac, tc, td;

class _HomeState extends State<Home> {
  getData() async {
    var url = 'https://corona.lmao.ninja/v2/all';
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    setState(() {
      c = jsonData['cases'].toString();
      a = jsonData['active'].toString();
      r = jsonData['recovered'].toString();
      d = jsonData['deaths'].toString();
      tt = jsonData['tests'].toString();
      ac = jsonData['affectedCountries'].toString();
      tc = jsonData['todayCases'].toString();
      td = jsonData['todayDeaths'].toString();
      isLoading = false;
    });
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
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
          : Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 35.0,
                      ),
                      Text(
                        'Worldwide',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                              color: Colors.orangeAccent,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Confirmed\n$c',
                                  style: TextStyle(fontSize: 22.5),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                          Container(
                            width: 20.0,
                          ),
                          Container(
                              color: Colors.orangeAccent,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Active\n$a',
                                  style: TextStyle(fontSize: 22.5),
                                  textAlign: TextAlign.center,
                                ),
                              ))
                        ],
                      ),
                      Container(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            color: Colors.orangeAccent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Recovered\n$r',
                                style: TextStyle(fontSize: 22.5),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            width: 20.0,
                          ),
                          Container(
                            color: Colors.orangeAccent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Deaths\n$d',
                                style: TextStyle(fontSize: 22.5),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            color: Colors.orangeAccent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Total testing\n$tt',
                                style: TextStyle(fontSize: 22.5),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            width: 20.0,
                          ),
                          Container(
                            color: Colors.orangeAccent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Countries affected\n$ac',
                                style: TextStyle(fontSize: 22.5),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 20.0,
                      ),
                      Text(
                        'Worldwide today',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            color: Colors.orangeAccent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Cases today\n$tc',
                                style: TextStyle(fontSize: 22.5),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            width: 20.0,
                          ),
                          Container(
                            color: Colors.orangeAccent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Deaths today\n$td',
                                style: TextStyle(fontSize: 22.5),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 20.0,
                      ),
                      Container(
                        color: Colors.orangeAccent,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Country()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'View country-wise statistics',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 15.0,
                      ),
                      Container(
                        color: Colors.blue.shade700,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Spacer(),
                              Text(
                                'FAQs ',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: 20.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        color: Colors.blue.shade700,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.arrow_back,
                                size: 20.0,
                                color: Colors.white,
                              ),
                              Text(
                                ' About Corona ',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'We shall win the war against corona',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
