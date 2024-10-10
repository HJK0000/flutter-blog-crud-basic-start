import 'package:blog/core/utils.dart';

class PostRepository {

  Future<List<dynamic>> findAll() async {
    // 1. 통신 -> response (header, body)
    // body 데이터를 전달해줄 것임 -> post 에게
    var response = await dio.get("/api/post");
    // Response 로 받기 싫으면 var 로 받기
    // 2. body 부분 리턴
    // body 부분이 json array이면 List<dynamic>으로 받기
    // body 부분이 그냥 json이면 Map<String, dynamic>으로 받기
    // runtimetype으로 확인가능
    List<dynamic> responseBody = response.data["body"]; // -> map 타입 ( 자동 파싱되니까 애를 return 하면 됨 )

    return responseBody;

  }

  Future<Map<String, dynamic>> findById(int id) async {
    // 1. 통신 -> response (header, body)
    // body 데이터를 전달해줄 것임 -> post 에게
    var response = await dio.get("/api/post/$id"); // 원래 dio는 json으로 줬는데 업데이트 돼서 map으로 줌
    // Response 로 받기 싫으면 var 로 받기
    // 2. body 부분 리턴
    // body 부분이 json array이면 List<dynamic>으로 받기
    // body 부분이 그냥 json이면 Map<String, dynamic>으로 받기
    // runtimetype으로 확인가능
    Map<String, dynamic> responseBody = response.data["body"]; // -> map 타입 ( 자동 파싱되니까 애를 return 하면 됨 )

    return responseBody;

  }
}
