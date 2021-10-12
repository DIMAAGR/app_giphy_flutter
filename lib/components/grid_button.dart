import 'package:app_giphy_api/data/gif_property.dart';
import 'package:app_giphy_api/store/app_giphy_api.store.dart';
import 'package:app_giphy_api/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridButton extends StatelessWidget {
  const GridButton({
    Key? key,
    required this.snapshot,
    required this.index,
  }) : super(key: key);

  //VARIAVEIS
  final AsyncSnapshot snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    AppGiphyApi _provider = Provider.of<AppGiphyApi>(context);
    return InkWell(
      onTap: () {
        // ACTIONS
        _provider.changeGif(GifProperty(
            gifUrl: snapshot.data["data"][index]["images"]["original"]["url"],
            hdMp4Url: snapshot.data["data"][index]["images"]["original"]["mp4"],
            p480Mp4Url: snapshot.data["data"][index]["images"]["480w_still"]
                ["url"],
            username: snapshot.data["data"][index]["username"],
            title: snapshot.data["data"][index]["title"]));
        Navigator.of(context).pushNamed(AppRoutes.GIF_VIEW);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color.fromARGB(255, 230, 230, 230),
          image: DecorationImage(
              image: NetworkImage(
                  snapshot.data["data"][index]["images"]["original"]["url"]),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
