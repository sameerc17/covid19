import 'package:covid19/lister/prevention.dart';
import 'package:covid19/lister/symptoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 15.0,
          ),
          Text(
            'Symptoms',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            height: 160,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: Symptoms.symptoms.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        height: 130.0,
                        width: 150.0,
                        padding: EdgeInsets.all(10.0),
                        child: Image(
                          image: NetworkImage(
                            Symptoms.symptoms[index]["url"],
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(Symptoms.symptoms[index]["description"],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
                    ],
                  );
                }),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Prevention',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            height: 160,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: Prevention.prevention.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        height: 130.0,
                        width: 150.0,
                        padding: EdgeInsets.all(10.0),
                        child: Image(
                          image: NetworkImage(
                            Prevention.prevention[index]["url"],
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(Prevention.prevention[index]["description"],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
                    ],
                  );
                }),
          ),
          SizedBox(
            height: 10.0,
          ),

        ],
      ),
    );
  }
}
