import 'package:app_giphy_api/components/giphy_app_bar.dart';
import 'package:app_giphy_api/data/api_request.dart';
import 'package:app_giphy_api/data/data_requests.dart';
import 'package:app_giphy_api/store/app_giphy_api.store.dart';
import 'package:flutter/material.dart';
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
    String search = _provider.search;
    print(search);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      appBar: GiphyAppBar(),
      body: _result(context, _apiRequest, search, _provider),
    );
  }

  // INTERFACE/BODY DO IMAGE LIST
  _result(BuildContext context, ApiRequest api, String search,
      AppGiphyApi provider) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: api.gifGridBuilder(
        search: search,
        request: api,
        data: _dataRequest,
        context: context,
        provider: provider,
      ),
    );
  }
}
