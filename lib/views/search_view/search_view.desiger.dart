import 'package:app_giphy_api/components/circular_button.dart';
import 'package:app_giphy_api/store/app_giphy_api.store.dart';
import 'package:app_giphy_api/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    AppGiphyApi _provider = Provider.of<AppGiphyApi>(context);
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
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 235, 235, 235),
                borderRadius: BorderRadius.circular(24)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.black38,
                    size: 20.0,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: TextFormField(
                      onFieldSubmitted: (text) {
                        _provider.addHistory(text);
                        _provider.changeSearch(text);
                        Navigator.of(context).pushNamed(AppRoutes.GIF_LIST);
                      },
                      textAlignVertical: TextAlignVertical.center,
                      style: TextStyle(color: Colors.black38, fontSize: 16),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        hintText: "Pesquise por reações, stickers, sports...",
                        hintStyle:
                            TextStyle(color: Colors.black38, fontSize: 16),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(24.0)),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          SizedBox(
            width: 8,
          ),
        ],
      ),
      body: _body(context, _provider),
    );
  }

  _body(BuildContext context, AppGiphyApi provider) {
    return provider.searchHistory.isEmpty
        ? Padding(
            padding: const EdgeInsets.only(top: 16, left: 16),
            child: Text(
              "Histórico Vazio",
              style: TextStyle(
                color: Colors.black38,
                fontSize: 15,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
              ),
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 20,
                    width: 96,
                    child: CircularButton(
                      onPressed: () => setState(() => provider.clearHistory()),
                      icon: Center(
                        child: Text(
                          "Limpar Tudo",
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      color: Color.fromARGB(255, 240, 240, 240),
                      padding: 8,
                      border: BorderRadius.circular(6),
                      width: 72,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: provider.searchHistory.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              provider
                                  .changeSearch(provider.searchHistory[index]);
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.GIF_LIST);
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Icon(Icons.history,
                                      size: 20, color: Colors.black38),
                                ),
                                Text(
                                  provider.searchHistory[index],
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 24,
                                    width: 24,
                                    child: CircularButton(
                                        padding: 0,
                                        icon: Icon(
                                          Icons.close,
                                          color:
                                              Color.fromARGB(255, 60, 60, 60),
                                          size: 16,
                                        ),
                                        size: 16,
                                        onPressed: () => setState(() =>
                                            provider.removeHistory(provider
                                                .searchHistory[index]))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          provider.searchHistory.length > 1 &&
                                  provider.searchHistory.last !=
                                      provider.searchHistory[index]
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0,
                                      right: 8.0,
                                      top: 3.0,
                                      bottom: 3.0),
                                  child: Divider(
                                    color: Colors.black12,
                                    height: 1,
                                  ),
                                )
                              : SizedBox(),
                        ],
                      );
                    }),
              ),
            ],
          );
  }
}
