import 'package:dio/dio.dart';

enum HttpMethod { GET, POST, PUT, DELETE }

class CustomAPI {
  final String url;
  final String method;
  final String body;
  final dynamic parameters;

  CustomAPI({
    required this.url,
    required this.method,
    required this.body,
    required this.parameters,
  });
}

class ApiRequest {
  late Response response;
  DateTime startTime = DateTime.now();
  String bearerToken =
      "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicm9sZSI6IkFkbWluIiwibmJmIjoxNzA2MTg5NDY0LCJleHAiOjE3MDYyMzI2NjQsImlhdCI6MTcwNjE4OTQ2NCwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NzAxMi8iLCJhdWQiOiJodHRwczovL2xvY2FsaG9zdDo3MDEyLyJ9.VRFq09XowCV3AOHdIA7LMBNVb77eaeaZWpE1Ha-h2RnuC4CzOVo76vt-0ZZT5kc4Kv8-9saU0hRGEw4tgtxvZw";
  String AdminbearerToken =
      "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicm9sZSI6IkFkbWluIiwibmJmIjoxNzA2MTg5NDY0LCJleHAiOjE3MDYyMzI2NjQsImlhdCI6MTcwNjE4OTQ2NCwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NzAxMi8iLCJhdWQiOiJodHRwczovL2xvY2FsaG9zdDo3MDEyLyJ9.VRFq09XowCV3AOHdIA7LMBNVb77eaeaZWpE1Ha-h2RnuC4CzOVo76vt-0ZZT5kc4Kv8-9saU0hRGEw4tgtxvZw";
  makeRequest(String url, HttpMethod method, var data, var headers) async {
    final dio = Dio();
    try {
      startTime = DateTime.now();
      switch (method) {
        case HttpMethod.GET:
          response = await dio.get(url,
              options: Options(
                  headers: headers
                      ? <String, String>{
                          'Authorization': 'Bearer $AdminbearerToken',
                          'Content-Type': 'application/json; charset=UTF-8',
                        }
                      : {}));
          break;
        case HttpMethod.POST:
          response = await dio.post(url,
              data: data,
              options: Options(
                  headers: headers
                      ? <String, String>{
                          'Authorization': 'Bearer $AdminbearerToken',
                          'Content-Type': 'application/json; charset=UTF-8',
                        }
                      : {}));
          break;
        case HttpMethod.PUT:
          response = await dio.put(url,
              data: data,
              options: Options(
                  headers: headers
                      ? <String, String>{
                          'Authorization': 'Bearer $AdminbearerToken',
                          'Content-Type': 'application/json; charset=UTF-8',
                        }
                      : {}));

          break;
        case HttpMethod.DELETE:
          response = await dio.delete(url,
              data: data,
              options: Options(
                  headers: headers
                      ? <String, String>{
                          'Authorization': 'Bearer $AdminbearerToken',
                          'Content-Type': 'application/json; charset=UTF-8',
                        }
                      : {}));

          break;
      }
      // DateTime endTime = DateTime.now();
      // Calculate time difference
      // Duration timeTaken = endTime.difference(startTime);

      // Print the time taken in milliseconds
      // print(' API URL:$url \n Time taken: ${timeTaken.inMilliseconds} ms');

      return response;
    } catch (error) {
      // DateTime endTime = DateTime.now();
      // Calculate time difference
      // Duration timeTaken = endTime.difference(startTime);

      // Print the time taken in milliseconds
      // print(' API URL:$url \n Time taken: ${timeTaken.inMilliseconds} ms');

      // Handle Dio errors
      print('Dio Error: $error');
    }
  }
}
