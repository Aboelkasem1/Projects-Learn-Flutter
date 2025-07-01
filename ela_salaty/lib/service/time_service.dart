import 'package:dio/dio.dart';
import 'package:ela_salaty/models/time_model.dart';
import 'dart:convert';

class TimeService {
  TimeService({required this.dio});
  final Dio dio;

  Future<TimeModel> getTime() async {
    var response = await dio.get(
      'https://script.googleusercontent.com/macros/echo?user_content_key=AehSKLj8-4c0v3w5UTOBLnjY5i8QI-4Q9YPO8RiEKCxOhBSWpQeeuZIk9IF-CmFP0CpbxVT1wTanPamti8V6JuRnILujUCxEnl-796v3XMiM6mZUFx4Hhn9ac0S2pRam0cQRdCH7WwmxOVtOBkbMroRuq0HgUzvRsyaxVGwL_qFbidqwXaxNkHD7equuVAppRuig980dI747uVhNq94bfEVrPgG9rUfh_tySMP6uXU1IhYnVkoXWAWpiqW-28MpZllC4E2OKlZfSlTWkB73Kj0JtaeYULJTQew&lib=MwxUjRcLr2qLlnVOLh12wSNkqcO1Ikdrk',
    );

    final data = response.data is String
        ? jsonDecode(response.data)
        : response.data;

    TimeModel time = TimeModel(
      hours: data['hours'],
      minutes: data['minutes'],
      seconds: data['seconds'],
    );

    return time;
  }
}
