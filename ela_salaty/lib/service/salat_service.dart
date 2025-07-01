import 'package:dio/dio.dart';
import 'package:ela_salaty/models/salat_model.dart';

class SalatService {
  SalatService({required this.dio});
  final Dio dio;

  Future<List<SalatModel>> getNews() async {
    var response = await dio.get(
      'https://api.aladhan.com/v1/timingsByCity/01-07-2025?city=cairo&country=egypt&method=8',
    );
    Map<String, dynamic> articles = response.data;
    Map<String, dynamic> data = articles['data'];
    Map<String, dynamic> timings = data['timings'];
    Map<String, dynamic> date = data['date'];

    List<SalatModel> listSalat = [];

    listSalat.add(
      SalatModel(
        name: 'الفجر',
        time: timings['Fajr'],
      ), 
    );
    listSalat.add(
      SalatModel(
        name: 'الظهر',
        time: timings['Dhuhr'],
      ),     
    );
    listSalat.add(
      SalatModel(
        name: 'العصر',
        time: timings['Asr'],
      ),     
    );
    listSalat.add(
      SalatModel(
        name: 'المغرب',
        time: timings['Maghrib'],
      ),     
    );
    listSalat.add(
      SalatModel(
        name: 'العشاء',
        time: timings['Isha'],
      ),     
    );


    return listSalat;
    // print(articles);
  }
}
