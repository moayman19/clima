
import '../services/location.dart';
import 'package:clima/services/networking.dart';
const apiKey = '191512e0409dddf1341aadef5c3a0565';
const weatherAPI = 'https://api.openweathermap.org/data/2.5/weather';


class WeatherModel {

 Future<dynamic> getLocationData()async{

   Location location = Location();
   await location.getCurrentLocation();
   Networking networkingHelper = Networking(
       url:
       '$weatherAPI?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
   var weatherData = await networkingHelper.getData();
   return weatherData;
  }
 Future<dynamic> getCityNameLocation(String name)async{
   Location location = Location();
   await location.getCurrentLocation();
   Networking networkingHelper = Networking(
       url:
       '$weatherAPI?q=$name&appid=$apiKey&units=metric');
   var weatherData = await networkingHelper.getData();
   return weatherData;
 }



  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
