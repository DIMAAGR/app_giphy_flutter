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
      body: _result(context, _apiRequest, search),
    );
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

  // INTERFACE/BODY DO IMAGE LIST
  _result(BuildContext context, ApiRequest api, String search) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: api.gifGridBuilder(
          search: search, request: api, data: _dataRequest, context: context),
    );
  }
}
