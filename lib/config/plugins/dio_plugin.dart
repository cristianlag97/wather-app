import 'package:dio/dio.dart';

import 'dotenv_plugin.dart';

Dio get dioWeather => Dio(
      BaseOptions(baseUrl: DotenvPlugin.apiUrl, queryParameters: {
        'appid': DotenvPlugin.apiKey,
      }),
    );

//! https://api.openweathermap.org/data/2.5/weather?q=neiva&appid=c9dc0481ca1c83e709c83c4e89f1a049