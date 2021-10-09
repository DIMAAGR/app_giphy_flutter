import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 245, 245, 245),
        title: SvgPicture.network(
            "https://upload.wikimedia.org/wikipedia/commons/8/82/Giphy-logo.svg"),
        actions: [
          // Outra forma de se fazer um botão circular usando o
          // Elevated Button
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              height: 40,
              width: 40,
              child: ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.search,
                  size: 24,
                  color: Color.fromARGB(255, 60, 60, 60),
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  elevation: 3,
                  padding: EdgeInsets.all(16),
                  shadowColor: Color.fromARGB(255, 60, 60, 60),
                  primary: Color.fromARGB(255, 245, 245, 245),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              height: 40,
              width: 40,
              child: ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.settings,
                  size: 24,
                  color: Color.fromARGB(255, 60, 60, 60),
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  elevation: 3,
                  padding: EdgeInsets.all(16),
                  shadowColor: Color.fromARGB(255, 60, 60, 60),
                  primary: Color.fromARGB(255, 245, 245, 245),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
