import 'package:flutter/material.dart';
import '../../../core/base/viewModel/base_view_model.dart';
import '../../../core/exports/constants_exports.dart';
import '../../../core/mixins/show_bar.dart';
import '../model/post_model.dart';

class HomeViewModel extends ChangeNotifier with BaseViewModel,ShowBar {
  List<PostModel> posts = <PostModel>[];

  Future<void> get() async {
    try{
      var res = await networkService!.send<PostModel, List<PostModel>>(
        EndPointConstants.posts,
        type: HttpTypes.get,
        parseModel: PostModel(),
      );
      if (res.data is List<PostModel>) {
        posts = res.data!;
        notifyListeners();
      }
    }catch(error){
      showErrorBar(viewModelContext, error);
    }
  }
}
