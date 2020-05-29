import 'package:covid19/queries.dart';
import 'package:flutter/material.dart';

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: Queries.questionAnswers.length,
            itemBuilder: (context, index) {
              return Theme(
                data: ThemeData(unselectedWidgetColor: Colors.blueAccent),
                child: ExpansionTile(
                  trailing: Icon(Icons.add),
                  title: Text(
                    Queries.questionAnswers[index]['question'],
                    style: TextStyle(fontSize: 18.0),
                  ),
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                      child: Text(
                        Queries.questionAnswers[index]['answer'],
                        style: TextStyle(fontSize: 16.0),
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
