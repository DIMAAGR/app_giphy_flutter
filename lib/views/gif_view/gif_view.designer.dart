import 'package:app_giphy_api/components/giphy_app_bar.dart';
import 'package:app_giphy_api/data/api_request.dart';
import 'package:app_giphy_api/data/data_requests.dart';
import 'package:app_giphy_api/store/app_giphy_api.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class GifView extends StatelessWidget {
  const GifView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //PROVIDERS E DATA REQUESTS
    DataRequest _dataRequest = DataRequest();
    AppGiphyApi _provider = Provider.of<AppGiphyApi>(context);
    ApiRequest _apiRequest = ApiRequest(context: context);
    //BUILD RETURN
    return Scaffold(
      appBar: GiphyAppBar(),
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
    );
  }
}
