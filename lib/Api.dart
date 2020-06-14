import 'package:clone_youtube/model/video.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const CHAVE_YOUTUBE_API = 'AIzaSyA05xMsLS0-iuY1awjUT0pJ5k5EMZTHRwA';
const ID_CANAL = 'UCSfwM5u0Kce6Cce8_S72olg';
const URL_BASE = 'https://www.googleapis.com/youtube/v3/';

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(URL_BASE +
        'search'
            '?part=snippet'
            '&type=video'
            '&maxResults=20'
            '&order=date'
            '&key=$CHAVE_YOUTUBE_API'
            '&channelId=$ID_CANAL'
            '&q=$pesquisa');

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = jsonDecode(response.body);

      List<Video> videos = dadosJson['items'].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      return videos;
    } else {
      print('Erro de execução');
    }
  }
}
