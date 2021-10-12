import 'package:app_giphy_api/components/circular_button.dart';
import 'package:app_giphy_api/store/app_giphy_api.store.dart';
import 'package:app_giphy_api/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 245, 245, 245),
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
              child: CircularButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Color.fromARGB(255, 60, 60, 60),
                  size: 24,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, AppRoutes.HOME);
                },
                padding: 0,
                color: Color.fromARGB(255, 235, 235, 235),
              ),
            ),
          ],
        ),
        title: SvgPicture.network(
            "https://upload.wikimedia.org/wikipedia/commons/8/82/Giphy-logo.svg"),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Mude a Lingua de Pesquisa",
            style: TextStyle(
              color: Color.fromARGB(255, 60, 60, 60),
              fontFamily: "Montserrat",
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        _languageChangeButton("pt", context, "Português"),
        _languageChangeButton("en", context, "Inglês"),
        _languageChangeButton("es", context, "Espanhol"),
        _languageChangeButton("fr", context, "Françês"),
      ],
    );
  }

  _languageChangeButton(
      String langugage, BuildContext context, String langName) {
    AppGiphyApi provider = Provider.of<AppGiphyApi>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage(langugage);
              Navigator.pop(context);
              Navigator.of(context).pushNamed(AppRoutes.HOME);
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                  child: Text(
                    langName,
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 3.0, bottom: 3.0),
            child: Divider(
              color: Colors.black12,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
