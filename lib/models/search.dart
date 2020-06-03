import 'package:flutter/material.dart';

class Search extends SearchDelegate {

  final List countryList;

  Search(this.countryList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear,color: Colors.red.shade500,),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back,color: Colors.black87,),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    return Container();

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final SuggestionList=query.isEmpty
        ?countryList
        :countryList.where((element)=> element['country'].toString().toLowerCase().startsWith(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: SuggestionList.length,
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
                        SuggestionList[index]['country'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                      Image.network(
                        SuggestionList[index]['countryInfo']['flag'],
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
                              SuggestionList[index]['cases'].toString(),
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Text(
                          'Active cases: ' +
                              SuggestionList[index]['active']
                                  .toString(),
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Text(
                          'Recovered cases: ' +
                              SuggestionList[index]['recovered']
                                  .toString(),
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Text(
                          'Death cases: ' +
                              SuggestionList[index]['deaths']
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
    );
  }
}
