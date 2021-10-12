import 'package:app_giphy_api/data/gif_property.dart';
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
  @observable
  String language = "pt";
  @observable
  List<String> searchHistory = [];

  // GIF PROPERTY SÃO AS PROPRIEDADES DO GIF
  // DESSA FORMA FICA MAIS FACI DE ENVIAR AS INFORMAÇÕES DO GIF
  // PARA OUTRAS PAGINAS!
  @observable
  GifProperty gifProperty = GifProperty(
    gifUrl: "",
    hdMp4Url: "",
    p480Mp4Url: "",
    title: "",
    username: "",
  );

// ACTIONS

  @action
  void changeSearch(String search) => this.search = search;
  @action
  void changeTopic(String topic) => this.topic = topic;
  @action
  void changeGif(GifProperty gif) => this.gifProperty = gif;
  @action
  void addHistory(String search) => searchHistory.add(search);
  @action
  void removeHistory(String search) => searchHistory.remove(search);
  @action
  void clearHistory() => searchHistory.clear();
  @action
  void changeLanguage(String language) => this.language = language;
}
