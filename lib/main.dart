import 'package:app_giphy_api/store/app_giphy_api.store.dart';
import 'package:app_giphy_api/utils/app_routes.dart';
import 'package:app_giphy_api/views/gif_view/gif_view.designer.dart';
import 'package:app_giphy_api/views/image_list/image_list.designer.dart';
import 'package:app_giphy_api/views/main/main_screen.designer.dart';
import 'package:app_giphy_api/views/search_view/search_view.desiger.dart';
import 'package:app_giphy_api/views/settings_view/settings_view.designer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppGiphyApi>(
          create: (_) => AppGiphyApi(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          AppRoutes.HOME: (ctx) => MainScreen(),
          AppRoutes.GIF_LIST: (ctx) => GifList(),
          AppRoutes.GIF_VIEW: (ctx) => GifView(),
          AppRoutes.SEARCH_VIEW: (ctx) => SearchView(),
          AppRoutes.SETTINGS_VIEW: (ctx) => SettingsView(),
        },
      ),
    );
  }
}
