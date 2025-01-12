import 'package:ders125/ListPage.dart';
import 'package:ders125/RadioListTile.dart';
import 'package:ders125/LoginPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text("Text Form"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Listpage()),
                    );
                  },
                  child: Text("Form Page"),
                );
              },
            ),
            SizedBox(width: 20), // Adds spacing between buttons
            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TextFormFieldPage()),
                    );
                  },
                  child: Text("Password Page"),
                );
              },
            ),
            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RadioList()),
                    );
                  },
                  child: Text("Radio List Tile"),
                );
              },
            ),
          ],
        ),
      ),
    ),
  ));
}
