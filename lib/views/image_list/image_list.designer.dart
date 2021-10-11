import 'package:app_giphy_api/components/circular_button.dart';
import 'package:app_giphy_api/data/api_request.dart';
import 'package:app_giphy_api/data/data_requests.dart';
import 'package:app_giphy_api/store/app_giphy_api.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class GifList extends StatefulWidget {
  const GifList({Key? key}) : super(key: key);

  @override
  _GifListState createState() => _GifListState();
}

class _GifListState extends State<GifList> {
  // REQUISITA OS DADOS
  DataRequest _dataRequest = DataRequest();

  @override
  Widget build(BuildContext context) {
    AppGiphyApi _provider = Provider.of<AppGiphyApi>(context);
    // A API REQUEST FAZ AS VERIFICAÇÕES DE ERRO CASO ENCONTRE ALGUM PROBLEMA
    ApiRequest _apiRequest = ApiRequest(context: context);
    //  Navigator.of(context).pop();
    String search = _provider.topic;
    print(search);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      appBar: _appBar(),
      body: Padding(
          padding: EdgeInsets.all(8),
          child: _searchGrid(context, _apiRequest, search, "", () {})),
    );
  }

  _gifButtonBuilder(
    BuildContext context,
    AsyncSnapshot snapshot,
  ) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        shrinkWrap: true,
        itemCount: snapshot.data["data"].length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromARGB(255, 230, 230, 230),
              image: DecorationImage(
                  image: NetworkImage(snapshot.data["data"][index]["images"]
                      ["original"]["webp"]),
                  fit: BoxFit.cover),
            ),
          );
        });
  }

  _searchGrid(BuildContext context, ApiRequest apiRequest, String? search,
      String topicName, void Function() onTap) {
    return FutureBuilder(
        future: _dataRequest.requestData(search, "0", "40"),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.done:
              return _gifButtonBuilder(context, snapshot);
            default:
              return apiRequest.sendWaitOrErrorMessage(
                snapshot: snapshot,
              );
          }
        });
  }

  //APPBAR
  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      title: SvgPicture.network(
          "https://upload.wikimedia.org/wikipedia/commons/8/82/Giphy-logo.svg"),
      iconTheme: IconThemeData(color: Color.fromARGB(255, 60, 60, 60)),
      actions: [
        Row(
          children: [
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
      ],
    );
  }
}
