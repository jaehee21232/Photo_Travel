class WeatherModel {
  String name; //지점이름
  String vs; //시정거리
  String ta; //기온
  String pta; //체감온도
  String rn; //일강수량
  String? weather;

  WeatherModel({
    required this.name,
    required this.vs,
    required this.ta,
    required this.pta,
    required this.rn,
    required this.weather,
  });
}
