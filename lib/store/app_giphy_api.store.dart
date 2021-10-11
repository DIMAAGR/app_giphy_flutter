import 'package:mobx/mobx.dart';

part 'app_giphy_api.store.g.dart';

// CLASSE QUE CONECTA A _AppGiphyApi ao _$AppGigphyApi
class AppGiphyApi = _AppGiphyApi with _$AppGiphyApi;

// CLASSE MOBX COM OBSERVAVEIS
abstract class _AppGiphyApi with Store {
// Para iniciar o Build Runner Utiliza-se
// flutter pub run build_runner watch
// Para Limpar o Build Runner Utiliza-se
// flutter pub run build_runner clean

// OBSERVAVEIS
  @observable
  String search = "";
  @observable
  String topic = "";

// ACTIONS

  @action
  void changeSearch(String search) => this.search = search;
  @action
  void changeTopic(String topic) => this.topic = topic;
}
