import 'package:app_giphy_api/components/grid_button.dart';
import 'package:app_giphy_api/data/data_requests.dart';
import 'package:app_giphy_api/store/app_giphy_api.store.dart';
import 'package:flutter/material.dart';

class ApiRequest {
  BuildContext context;
  ApiRequest({required this.context});

  // VERIFICA SE HOUVE UM ERRO
  Widget sendWaitOrErrorMessage({
    required AsyncSnapshot snapshot,
  }) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
        return _loadingcircle();
      default:
        return _errormessage(snapshot);
    }
  }

  // RETORNA O ERRO COMO WIDGET
  Widget getErrorMessage(AsyncSnapshot snapshot) => _errormessage(snapshot);

  // WIDGET DE ERRO
  Widget _errormessage(AsyncSnapshot snapshot) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2 - 48 - 40,
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.red,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "ERROR: " + snapshot.error.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _loadingcircle() {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2 - 48 - 40,
        ),
        Center(
          child: Container(
            height: 48,
            width: 48,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 60, 60, 60)),
              strokeWidth: 5,
            ),
          ),
        ),
      ],
    );
  }

  // FAZ O BUILD DA GRID!
  gifGridBuilder({
    required String search,
    required ApiRequest request,
    required DataRequest data,
    required BuildContext context,
    required AppGiphyApi provider,
  }) {
    // COMEÇA RETORNANDO UM FUTURE BUILD
    return FutureBuilder(
        // RECEBE O REQUEST DATA PARA CONSTRUIR A GRADE
        future: data.requestData(search, "0", "39", provider.language),
        // BUILDER
        builder: (context, snapshot) {
          // VERIFICA SE A CONEXÇÃO FOI ATIVA OU SE HOUVE UM ERRO
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.done:
              // CASO ESTEJA TUDO CORRETO CRIA A GRID DE GIFS
              return _gifGridButtonBuilder(context, snapshot);
            default:
              return request.sendWaitOrErrorMessage(
                snapshot: snapshot,
              );
          }
        });
  }

  // CRIA A GRID DE GIFS
  _gifGridButtonBuilder(BuildContext context, AsyncSnapshot snapshot) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        shrinkWrap: true,
        // TAMANHO DA GRID
        itemCount: snapshot.data["data"].length,
        // CONSTRUTOR DE ITEM
        itemBuilder: (context, index) {
          return GridButton(snapshot: snapshot, index: index);
        });
  }

  _loadingListCircle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 16,
            width: 16,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black38),
              strokeWidth: 2,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              "Carregando...",
              style: TextStyle(
                color: Colors.black38,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
