import 'dart:convert';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

// ESTA CLASSE FAZ A REQUISIÇÃO DE DADOS DA API DO GIPHY
class DataRequest {
  // Função de requisição de Dados
  Future<Map> requestData(
      String? search, String offSet, String quantity) async {
    // A Função recebe alguns parâmetros para personalizar a pesquisa
    // como a pesquisa em sí, a quantidade de gifs por pagina,
    // e a quantidade maxima de paginas a serem geradas de uma vez!
    http.Response response; // CRIA UM HTTP RESPONSE

    // VERIFICA SE É UMA PESQUISA!

    Uri uri1 = Uri.parse(
        "https://api.giphy.com/v1/gifs/trending?api_key=DVZH7cEK2v8srRKFhOspvNNHqMVYbR1U&limit=$quantity&rating=g");
    Uri uri2 = Uri.parse(
        "https:api.giphy.com/v1/gifs/search?api_key=DVZH7cEK2v8srRKFhOspvNNHqMVYbR1U&q=$search&limit=$quantity&offset=$offSet&rating=g&lang=pt");
    if (search == null ||
        search == "Trending") // SE NÃO FOR, REQUISITARÁ OS TRENDINGS
      response = await http.get(uri1);
    else // SE FOR, FARÁ A PESQUISA
      response = await http.get(uri2);

    return json.decode(
        response.body); // NO FINAL RETORNARÁ O CORPO DO JSON (RESPONSE)!
  }
}
