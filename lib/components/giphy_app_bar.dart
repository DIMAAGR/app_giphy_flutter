import 'package:app_giphy_api/components/circular_button.dart';
import 'package:app_giphy_api/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GiphyAppBar extends StatelessWidget with PreferredSizeWidget {
  const GiphyAppBar({Key? key}) : super(key: key);

  // PARA FUNCIONAR CORRETAMENTE É NECESSÁRIO QUE O APPBAR(CLASSE)
  // TENHA O MIXIN PreferredSizeWidget e que faça o override
  // do getter preferredSize recebendo de acordo com o tamnanho
  // do TOOLBAR.

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      elevation: 0,
      iconTheme: IconThemeData(
        color: Color.fromARGB(255, 60, 60, 60),
      ),
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      title: SvgPicture.network(
          "https://upload.wikimedia.org/wikipedia/commons/8/82/Giphy-logo.svg"),
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
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed(AppRoutes.SEARCH_VIEW);
              },
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
