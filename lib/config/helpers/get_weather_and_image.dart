String getImage(String weather) {
  switch (weather) {
    case 'scattered clouds':
      return 'assets/images/cloud-with-sunny.png';
    case 'Clouds':
      return 'assets/images/cloud.png';
    case 'Rain':
      return 'assets/images/rain.png';
    case 'Sunny':
    default:
      return 'assets/images/sunny.png';
  }
}

String mapWeatherCondition(String condition) {
  switch (condition) {
    case 'few clouds':
    case 'broken clouds':
      return 'Despejado';
    case 'Clear':
    case 'clear sky':
      return 'Cielo Despejado';
    case 'Clouds':
      return 'Nublado';
    case 'Rain':
      return 'Lluvia';
    case 'Snow':
      return 'Nieve';
    case 'light rain':
      return 'Lluvia ligera';
    case 'overcast clouds':
      return 'nubes cubiertas';
    case 'Mist':
      return 'Niebla';
    case 'Thunderstorm':
      return 'Tormenta Eléctrica';
    case 'Drizzle':
      return 'Llovizna';
    case 'Fog':
      return 'Niebla';
    case 'scattered clouds':
      return 'Nubes dispersas';
    default:
      return 'Desconocido';
  }
}
