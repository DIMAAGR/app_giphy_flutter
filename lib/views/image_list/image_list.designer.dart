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
  int page = 0, pagecount = 0;

  void forward() => setState(() {
        page += 27;
        pagecount++;
      });
  void backward() => page == 0
      ? page = 0
      : setState(() {
          page -= 27;
          pagecount--;
        });

  // INFINITE SCROLLING
  // int itemQuantity = 39;
  // ScrollController _scrollController = ScrollController();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _scrollController.addListener(() {
  //     // VERIFICA SE O SCROLL CHEGOU ATÉ O FINAL DA PÁGINA
  //     if (_scrollController.position.pixels >=
  //         _scrollController.position.maxScrollExtent) {
  //       setState(() {
  //         print("MORE DATA ADDED");
  //         itemQuantity += 39;
  //       });
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   _scrollController.dispose();
  // }

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
        page: page,
        pagecount: pagecount,
        backFunction: backward,
        forwardFunction: forward,
        search: search,
        request: api,
        data: _dataRequest,
        context: context,
        provider: provider,
      ),
    );
  }
}
