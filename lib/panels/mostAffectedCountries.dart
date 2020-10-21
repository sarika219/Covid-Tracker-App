import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  final List countryData;
  const MostAffectedPanel({Key key, this.countryData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                children: <Widget>[
                  Image.network(
                    countryData[index]['countryInfo']['flag'],
                    height: 30,
                  ),
                  SizedBox(width: 15),
                  Text(
                    countryData[index]['country'],
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Text('Total Cases: ' + countryData[index]['cases'].toString(),
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold)),
                ],
              ));
        },
        itemCount: 6,
      ),
    );
  }
}
