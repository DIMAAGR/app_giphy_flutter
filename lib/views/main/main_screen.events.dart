import 'package:app_giphy_api/store/app_giphy_api.store.dart';
import 'package:app_giphy_api/utils/app_routes.dart';
import 'package:flutter/material.dart';

class MainScreenEvents {
  topicbuttonAction(BuildContext context, AppGiphyApi provider, String topic) {
    provider.changeSearch(topic);
    Navigator.of(context).pushNamed(AppRoutes.GIF_LIST);
  }
}
