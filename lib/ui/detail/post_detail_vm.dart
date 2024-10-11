import 'package:blog/core/utils.dart';
import 'package:blog/data/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

// 1. 창고 (viewModel)
class PostDetailVM extends StateNotifier<PostDetailModel?>{
  PostDetailVM(super.state); // 생성자 만들기

// 초기화 함수에서 파라미터를 전달 받을 수 있다.
Future<void> notifyInit(int id) async {
  Map<String, dynamic> one = await PostRepository().findById(id); // 하나면 one, 여러개면 list
  state = PostDetailModel.fromMap(one); // 기존값을 바꾸면 안되니까 new를 함 // state 가 초기화 됨

}
}


// 2. 창고 데이터 (state, 상태값)
class PostDetailModel {
  int id;
  String title;
  String content;
  String createdAt;
  String updatedAt;

  PostDetailModel.fromMap(map) :
        this.id = map["id"],
    this.title = map["title"],
  this.content = map["content"],
  this.createdAt = formatDate(map["createdAt"]),
  this.updatedAt = formatDate(map["updatedAt"]);

}
// 3. 창고 관리자 (Provider)
// 화면이 빌드될 때 만들어진다.
final postDetailProvider = StateNotifierProvider.autoDispose.family<PostDetailVM,PostDetailModel?, int>((ref, id) {
  return PostDetailVM(null)..notifyInit(id); //통신해서 id를 가져와서 초기화 함수에 넣어준다.

});

