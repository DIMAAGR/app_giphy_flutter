import 'package:app_giphy_api/components/gif_topic_button.dart';
import 'package:app_giphy_api/components/giphy_app_bar.dart';
import 'package:app_giphy_api/data/api_request.dart';
import 'package:app_giphy_api/data/data_requests.dart';
import 'package:app_giphy_api/store/app_giphy_api.store.dart';
import 'package:app_giphy_api/views/main/main_screen.events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //VARIAVEIS
  DataRequest _dataRequest = DataRequest();
  MainScreenEvents _events = MainScreenEvents();

  //INITSTATE
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppGiphyApi _provider = Provider.of<AppGiphyApi>(context);
    ApiRequest _apiRequest = ApiRequest(context: context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      appBar: GiphyAppBar(),
      body: SingleChildScrollView(
        child: Observer(
          builder: (_) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 16,
              ),
              // É NECESSÁRIO UM FUTURE BUILDER PARA CARREGAR AS INFORMAÇÕES
              // DA API DENTRO DA INTERFACE
              _topicButton(
                context,
                _apiRequest,
                null,
                "Trending",
                () => _events.topicbuttonAction(context, _provider, "Trending"),
              ),
              _topicButton(
                context,
                _apiRequest,
                "reactions",
                "Reactions",
                () =>
                    _events.topicbuttonAction(context, _provider, "Reactions"),
              ),
              _topicButton(
                context,
                _apiRequest,
                "entertainment",
                "Entertainment",
                () => _events.topicbuttonAction(
                    context, _provider, "entertainment"),
              ),
              _topicButton(
                context,
                _apiRequest,
                "sports",
                "Sports",
                () => _events.topicbuttonAction(context, _provider, "sports"),
              ),
              _topicButton(
                context,
                _apiRequest,
                "Stickers",
                "Stickers",
                () => _events.topicbuttonAction(context, _provider, "Stickers"),
              ),
              _topicButton(
                context,
                _apiRequest,
                "Artists",
                "Artists",
                () => _events.topicbuttonAction(context, _provider, "Artists"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _topicButton(BuildContext context, ApiRequest apiRequest, String? search,
      String topicName, void Function() onTap) {
    return FutureBuilder(
      future: _dataRequest.requestData(search, "0", "10"),
      builder: (context, snapshot) => _topics(
          context: context,
          snapshot: snapshot,
          apiRequest: apiRequest,
          onTap: onTap,
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
