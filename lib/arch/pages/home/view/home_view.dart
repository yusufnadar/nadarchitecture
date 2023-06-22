const homeView = """
import 'package:flutter/material.dart';
import '../../../core/base/view/base_view.dart';
import '../viewModel/home_view_model.dart';
import '../widget/one_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onPageBuilder: (context, model, child) {
        return Scaffold(
          appBar: buildAppBar(model, context),
          body: buildBody(model),
        );
      },
    );
  }

  ListView buildBody(HomeViewModel model) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: model.posts.length,
      itemBuilder: (context, index) {
        return OneItem(
          index: index,
          title: model.posts[index].title!,
        );
      },
    );
  }

  AppBar buildAppBar(HomeViewModel model, BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () async => await model.get(),
          icon: const Icon(Icons.refresh),
        )
      ],
    );
  }
}
""";
