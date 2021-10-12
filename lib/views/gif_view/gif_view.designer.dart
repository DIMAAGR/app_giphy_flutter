import 'package:app_giphy_api/components/circular_button.dart';
import 'package:app_giphy_api/components/giphy_app_bar.dart';
import 'package:app_giphy_api/data/api_request.dart';
import 'package:app_giphy_api/data/data_requests.dart';
import 'package:app_giphy_api/store/app_giphy_api.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class GifView extends StatelessWidget {
  const GifView({Key? key}) : super(key: key);

  Future<void> download(String url, String packageName) async {
    // final directory = await getDownloadsDirectory();
    // FlutterDownloader.enqueue(
    //     url: url, savedDir: "${directory.path}/$packageName.git");
  }

  @override
  Widget build(BuildContext context) {
    //PROVIDERS E DATA REQUESTS
    DataRequest _dataRequest = DataRequest();
    AppGiphyApi _provider = Provider.of<AppGiphyApi>(context);
    ApiRequest _apiRequest = ApiRequest(context: context);
    print(_provider.gifProperty.title);
    print(_provider.gifProperty.username);
    //BUILD RETURN
    return Scaffold(
      appBar: GiphyAppBar(),
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      body: _result(
          context: context,
          api: _apiRequest,
          data: _dataRequest,
          provider: _provider),
    );
  }

  _result({
    required DataRequest data,
    required AppGiphyApi provider,
    required ApiRequest api,
    required BuildContext context,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            provider.gifProperty.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 60, 60, 60),
              fontFamily: "Montserrat",
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(255, 230, 230, 230),
                image: DecorationImage(
                    image: NetworkImage(provider.gifProperty.gifUrl),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            provider.gifProperty.username != ""
                ? "By: " + provider.gifProperty.username
                : "",
            style: TextStyle(
                color: Color.fromARGB(255, 60, 60, 60),
                fontFamily: "Montserrat",
                fontSize: 16,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularButton(
                padding: 8,
                width: 87 + 16,
                border: BorderRadius.circular(16),
                color: Color.fromARGB(255, 240, 240, 240),
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.download,
                      size: 24,
                    ),
                    Text("Download"),
                  ],
                ),
                onPressed: () {
                  download(provider.gifProperty.hdMp4Url,
                      provider.gifProperty.title);
                  print("downloaded!");
                }),
            CircularButton(
              padding: 8,
              color: Color.fromARGB(255, 240, 240, 240),
              icon: Icon(
                Icons.share,
                size: 24,
              ),
              onPressed: () {},
            )
          ],
        ),
      ],
    );
  }
}
