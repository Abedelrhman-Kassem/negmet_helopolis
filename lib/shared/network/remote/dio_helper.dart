import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static intit() {
    dio = Dio(
      BaseOptions(
        baseUrl: '',
        receiveDataWhenStatusError: true,
      ),
    );
  }
}
