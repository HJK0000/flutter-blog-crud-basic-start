import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 (viewModel)
class PostDetailVM extends StateNotifier<PostDetailModel?>{
  PostDetailVM(super.state); // 생성자 만들기

}


// 2. 창고 데이터 (state, 상태값)
class PostDetailModel {

}
// 3. 창고 관리자 (Provider)
// 화면이 빌드될 때 만들어진다.
final postDetailProvider = StateNotifierProvider<PostDetailVM,PostDetailModel?>((ref) {
  return PostDetailVM(null); //통신해서 받아서 넣어줄 수 없으니 일단은 null

});

