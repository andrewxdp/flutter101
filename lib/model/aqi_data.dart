class AqiData {
  final dynamic aqi;
  final dynamic city;
  final dynamic temperature;
  AqiData(this.aqi, this.city, this.temperature);

  AqiData.fromJson(Map<String, dynamic> json)
      : aqi = json['aqi'],
        city = json['city']['name'],
        temperature = json['iaqi']['t']['v'];
  String getAqiScale() {
    if (aqi <= 50) {
      return "Good";
    } else if (aqi <= 100) {
      return "Moderate";
    } else if (aqi <= 150) {
      return "Unhealthy for Sensitive Groups";
    } else if (aqi <= 200) {
      return "Unhealthy";
    } else if (aqi <= 300) {
      return "Very Unhealthy";
    } else {
      return "Hazardous";
    }
  }
}
