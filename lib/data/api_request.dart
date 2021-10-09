import 'package:flutter/material.dart';

class ApiRequest {
  BuildContext context;
  ApiRequest({required this.context});

  Widget sendWaitOrErrorMessage({
    required AsyncSnapshot snapshot,
  }) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
        return _loadingcircle();
      default:
        return _errormessage(snapshot);
    }
  }

  Widget _errormessage(AsyncSnapshot snapshot) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2 - 48 - 40,
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.red,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "ERROR: " + snapshot.error.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _loadingcircle() {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2 - 48 - 40,
        ),
        Center(
          child: Container(
            height: 48,
            width: 48,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 60, 60, 60)),
              strokeWidth: 5,
            ),
          ),
        ),
      ],
    );
  }
}
