import 'package:app_giphy_api/components/circular_button.dart';
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
          CircularButton(
            padding: 8,
            icon: Icon(
              Icons.search,
              size: 24,
              color: Color.fromARGB(255, 60, 60, 60),
            ),
            onPressed: () {},
          ),
          CircularButton(
            padding: 16,
            icon: Icon(
              Icons.settings,
              size: 24,
              color: Color.fromARGB(255, 60, 60, 60),
            ),
            onPressed: () {},
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
