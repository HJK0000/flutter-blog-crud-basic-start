import 'package:blog/ui/detail/post_detail_page.dart';
import 'package:blog/ui/list/post_list_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostListBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. 페이지 들어오자마자 viewModel이 만들어져야 한다. ( 창고 관리자가 만듦 )
    PostListModel? model = ref.watch(postListProvider);
    //var model = ref.watch(postListProvider);
    // 2. watch 로 보고 있어야 한다. -> 그래야 null을 뿌리고, 통신이되면 null 이 아닌 데이터를 뿌린다.
    // 3. PostListViewModel을 만들어서 해당 페이지를 관리한다.
    if (model == null) {
      return CircularProgressIndicator();
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
            // for문이 돈다
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text("${model.posts[index].id}"),
                title: Text("${model.posts[index].title}"),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PostDetailPage(model.posts[index].id)),
                    );
                  },
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: 20),
      );
    }
  }
}
