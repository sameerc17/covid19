import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'country.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

bool isLoading1 = true;
bool isLoading2 = true;
String c, a, r, d, tc, td;
var jData;

class _HomeState extends State<Home> {
  getMost() async {
    var url = 'https://corona.lmao.ninja/v2/countries?sort=deaths';
    var response = await http.get(url);
    jData = jsonDecode(response.body);
    setState(() {
      isLoading1 = false;
    });
  }

  getData() async {
    var url = 'https://corona.lmao.ninja/v2/all';
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    setState(() {
      c = jsonData['cases'].toString();
      a = jsonData['active'].toString();
      r = jsonData['recovered'].toString();
      d = jsonData['deaths'].toString();
      tc = jsonData['todayCases'].toString();
      td = jsonData['todayDeaths'].toString();
      isLoading2 = false;
    });
  }

  Future fetch() async {
    getData();
    getMost();
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
    getMost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (isLoading1 || isLoading2)
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
          : LiquidPullToRefresh(
              backgroundColor: Colors.white,
              onRefresh: fetch,
              animSpeedFactor: 2.0,
              child: Container(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Worldwide till date',
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),

                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          color: Colors.red.shade100,
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    child: Text(
                                      'Confirmed',
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.red.shade700,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    child: Text(
                                      '$c',
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.red.shade700,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          color: Colors.blue.shade100,
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    child: Text(
                                      'Active',
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.blue.shade700,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    child: Text(
                                      '$a',
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.blue.shade700,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          color: Colors.green.shade100,
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    child: Text(
                                      'Recovered',
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.green.shade700,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    child: Text(
                                      '$r',
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.green.shade700,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          color: Colors.grey.shade300,
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    child: Text(
                                      'Deaths',
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.grey.shade700,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    child: Text(
                                      '$d',
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.grey.shade700,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Worldwide today',
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              color: Colors.red.shade100,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Cases today\n$tc',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.red.shade700,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Container(
                              width: 20.0,
                            ),
                            Container(
                              color: Colors.grey.shade300,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Deaths today\n$td',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          '10 Most affected nations ',
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          height: 300.0,
                          child: Scrollbar(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Card(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Color(0xffC9D6FF),
                                            Color(0xFFE2E2E2)
                                          ],
                                        ),
                                      ),
                                      child: ListTile(
                                        leading: Image(
                                          image: NetworkImage(jData[index]
                                              ['countryInfo']['flag']),
                                          height: 40.0,
                                          width: 50.0,
                                        ),
                                        title: Text(
                                          (jData[index]['country'] +
                                              ' has suffered ' +
                                              jData[index]['deaths']
                                                  .toString() +
                                              ' deaths.'),
                                          style: TextStyle(fontSize: 18.0),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.teal.shade300,
                              borderRadius: BorderRadius.circular(20)),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Country()),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 12.0),
                              child: Text(
                                'View country-wise statistics',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
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
            ),
    );
  }
}
