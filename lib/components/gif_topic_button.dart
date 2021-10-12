import 'package:flutter/material.dart';

class TopicsGifButton extends StatelessWidget {
  final BuildContext context;
  final AsyncSnapshot snapshot;
  final String topicName;
  final void Function() onTap;
  const TopicsGifButton({
    required this.context,
    required this.onTap,
    required this.snapshot,
    required this.topicName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 176,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color.fromARGB(255, 230, 230, 230),
            image: DecorationImage(
                image: NetworkImage(
                    snapshot.data["data"][0]["images"]["original"]["webp"]),
                fit: BoxFit.cover),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                topicName,
                style: TextStyle(
                  color: Color.fromARGB(255, 245, 245, 245),
                  fontFamily: "Montserrat",
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
