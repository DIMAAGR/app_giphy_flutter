import 'package:app_giphy_api/components/circular_button.dart';
import 'package:app_giphy_api/components/gif_topic_button.dart';
import 'package:app_giphy_api/data/api_request.dart';
import 'package:app_giphy_api/data/data_requests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DataRequest _dataRequest = DataRequest();
  @override
  void initState() {
    super.initState();
    print("SARTED!");
    // _dataRequest.requestData(null, "0", "1").then((map) {
    //   print(map);
    // });
  }

  @override
  Widget build(BuildContext context) {
    ApiRequest _apiRequest = ApiRequest(context: context);
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
          children: [
            SizedBox(
              height: 16,
            ),
            // É NECESSÁRIO UM FUTURE BUILDER PARA CARREGAR AS INFORMAÇÕES
            // DA API DENTRO DA INTERFACE
            _topicButton(context, _apiRequest, null, "Trending"),
            _topicButton(context, _apiRequest, "reactions", "Reactions"),
            _topicButton(
                context, _apiRequest, "entertainment", "Entertainment"),
            _topicButton(context, _apiRequest, "sports", "Sports"),
            _topicButton(context, _apiRequest, "Stickers", "Stickers"),
            _topicButton(context, _apiRequest, "Artists", "Artists"),
          ],
        ),
      ),
    );
  }

  _topicButton(BuildContext context, ApiRequest apiRequest, String? search,
      String topicName) {
    return FutureBuilder(
      future: _dataRequest.requestData(search, "0", "1"),
      builder: (context, snapshot) => _topics(
          context: context,
          snapshot: snapshot,
          apiRequest: apiRequest,
          onTap: () {},
          topicName: topicName),
    );
  }

  _topics({
    required BuildContext context,
    required AsyncSnapshot snapshot,
    required ApiRequest apiRequest,
    required String topicName,
    required void Function() onTap,
  }) {
    switch (snapshot.connectionState) {
      case ConnectionState.active:
      case ConnectionState.done:
        return TopicsGifButton(
            context: context,
            snapshot: snapshot,
            topicName: topicName,
            onTap: onTap);
      default:
        return apiRequest.sendWaitOrErrorMessage(
          snapshot: snapshot,
        );
    }
  }
}
