import 'package:blog/data/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 (viewModel)
class PostListVM extends StateNotifier<PostListModel?> {
  PostListVM(super.state); // 생성자 만들기

  // view에 return 할 필요없다.
  // mvc 랑 다른게 상태를 관리한다는 것
  // mvvm은 프론트에 잘 맞다. 프론트가 상태를 관리해야 한다
  // 서버가 상태를 관리하면 너무너무너무 많아서 안된다.
  Future<void> notifyInit() async {
    // 1. 통신을 해서 응답 받기
    List<dynamic> list = await PostRepository().findAll();
    // 2. 파싱
    List<_Post> posts = list.map((e) => _Post.fromMap(e)).toList();
    // 3. 상태 갱신
    state = PostListModel(posts); // 깊은 복사 -> 기존 데이터를 건드리지 않는다. 새로 new 해서 넣는다.

  }
}




// 2. 창고 데이터 (state, 상태값)
class PostListModel {
  List<_Post> posts;

  PostListModel(this.posts);
}

class _Post {
  int id;
  String title;

  _Post.fromMap(map) : this.id = map["id"],
  this.title = map["title"];
}

// 3. 창고 관리자 (Provider)
// return 으로 창고를 한다.
// 상태는 null
final postListProvider = StateNotifierProvider<PostListVM,PostListModel?>((ref) {
  return PostListVM(null)..notifyInit(); //통신해서 받아서 넣어줄 수 없으니 일단은 null
  // cascade 연산자 : 객체를 만들면서 함수를 실행할 수 있다.
  // return은 창고가 되는데 함수는 실행만 됨
});

