class WeatherModel {
  String name; //지점이름
  double vs; //시정거리
  double ta; //기온
  double pta; //체감온도
  double rn; //일강수량

  WeatherModel({
    required this.name,
    required this.vs,
    required this.ta,
    required this.pta,
    required this.rn,
  });
}
