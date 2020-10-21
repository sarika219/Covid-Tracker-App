import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData;

  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
      // return countryData.fromJson(jsonresponse[0]);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Country Statistics'),
        ),
        body: countryData == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      height: 130,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[100],
                                blurRadius: 10,
                                offset: Offset(0, 10))
                          ]),
                      child: Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(countryData[index]['country'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Image.network(
                                      countryData[index]['countryInfo']['flag'],
                                      height: 50,
                                      width: 65)
                                ],
                              )),
                          Expanded(
                              child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                    'Confirmed :' +
                                        countryData[index]['cases'].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red)),
                                Text(
                                    'Active :' +
                                        countryData[index]['active'].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue)),
                                Text(
                                    'Recovered :' +
                                        countryData[index]['recovered']
                                            .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green)),
                                Text(
                                    'Deaths :' +
                                        countryData[index]['deaths'].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[800])),
                              ],
                            ),
                          ))
                        ],
                      ));
                },
                itemCount: countryData == null ? 0 : countryData.length));
  }
}
