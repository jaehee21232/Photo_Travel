import 'package:http/http.dart' as http;
import 'package:html/dom.dart';
import 'package:html/parser.dart' as parser;
import 'package:photo_travel/models/weather_model.dart';

Future<WeatherModel> getWeatherData(String name) async {
  var uri =
      Uri.parse('https://www.weather.go.kr/w/obs-climate/land/city-obs.do');
  final response = await http.get(uri);
  Document document = parser.parse(response.body);
  List<Element> keywordElements =
      document.querySelectorAll('#weather_table')[0].getElementsByTagName('tr');
  keywordElements.removeRange(0, 2);
  //print(keywordElements[0].getElementsByTagName('td')[0].text);
  final data = keywordElements
      .where(
        (Element element) {
          return element.getElementsByTagName('td')[0].text == name;
        },
      )
      .toList()[0]
      .getElementsByTagName('td');
  return WeatherModel(
      name: data[0].text,
      weather: data[1].text,
      vs: data[2].text,
      ta: double.parse(data[5].text),
      pta: double.parse(data[7].text),
      rn: double.parse(data[8].text));
}
