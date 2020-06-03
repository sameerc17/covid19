import 'package:covid19/lister/queries.dart';
import 'package:flutter/material.dart';

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 5.0),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: Queries.questionAnswers.length,
            itemBuilder: (context, index) {
              return Theme(
                data: ThemeData(unselectedWidgetColor: Colors.pinkAccent),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ExpansionTile(
                      leading: Icon(Icons.query_builder),
                      trailing: Icon(Icons.add),
                      backgroundColor: Colors.blue.shade50,
                      title: Text(
                        Queries.questionAnswers[index]['question'],
                        style: TextStyle(fontSize: 18.0),
                      ),
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 8.0),
                          child: Text(
                            Queries.questionAnswers[index]['answer'],
                            style: TextStyle(fontSize: 16.0),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
