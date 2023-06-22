import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../common/models/pagination_model.dart';
import '../../../core/base/viewModel/base_view_model.dart';
import '../../../core/exports/constants_exports.dart';
import '../../../core/mixins/show_bar.dart';
import '../model/post_model.dart';

class HomeViewModel extends ChangeNotifier with BaseViewModel, ShowBar {
  List<PostModel> posts = <PostModel>[];
  int page = 1;
  bool completed = false;

  Future<void> get() async {
    var res = await networkService!.send<PostModel, List<PostModel>>(
      EndPointConstants.posts,
      type: HttpTypes.get,
      parseModel: PostModel(),
    );
    if (res is List<PostModel>) {
      posts = res;
      notifyListeners();
    }
  }

  // sunucuya fotoğraf göndereceğimiz zaman örnek isteğimiz bu şekilde
  Future<void> uploadFileRequestExample() async {
    await networkService!.send(
      EndPointConstants.posts,
      type: HttpTypes.patch,
      contentType: Headers.multipartFormDataContentType,
      data: FormData.fromMap({
        'photo': await MultipartFile.fromFile('path'),
      }),
      parseModel: null,
    );
  }

  // veriler bize pagination mantığı ile gelicekse örnek isteğimiz bu şekilde
  Future<void> paginationExample({more}) async {
    // more true değil ise ilk sayfadaki verileri çekiyoruz    
    if (more != true) {
      page = 1;
      completed = false;
    }
    var res = await networkService!.send<PostModel, PaginationModel<PostModel>>(
      EndPointConstants.posts, //EndPointConstants.posts(page),
      type: HttpTypes.get,
      parseModel: PostModel(),
      isPagination: true,
    );
    if (res is PaginationModel<PostModel>) {
      if (res.next == null) {
        completed = true;
      } else {
        page++;
      }
      if (more != true) {
        posts = res.results!;
      } else {
        posts.addAll(res.results!);
      }
      notifyListeners();
    }
  }
}
