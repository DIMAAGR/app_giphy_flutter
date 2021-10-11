import 'package:flutter/material.dart';

class GridButton extends StatelessWidget {
  const GridButton({
    Key? key,
    required this.snapshot,
    required this.index,
  }) : super(key: key);

  //VARIAVEIS
  final AsyncSnapshot snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(snapshot.data["data"][index]["images"]["original"]["url"]);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color.fromARGB(255, 230, 230, 230),
          image: DecorationImage(
              image: NetworkImage(
                  snapshot.data["data"][index]["images"]["original"]["url"]),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
