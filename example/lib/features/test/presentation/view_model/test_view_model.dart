import 'dart:io';

import 'package:flutter/material.dart';

import '../../domain/entities/test_entity.dart';
import '../../domain/repositories/test_repository.dart';

class TestViewModel extends ChangeNotifier {
  final TestRepository _testRepository;

  TestViewModel(this._testRepository);

  bool completed = false;
  bool sendingRequest = false;
  bool isLoading = false;
  bool isError = false;
  int page = 1;
  var list = <TestEntity>[];
  var item = const TestEntity();

  void changeIsLoading(value) {
    isLoading = value;
    notifyListeners();
  }

  void changeIsError(value) {
    isError = value;
    notifyListeners();
  }

  void changeSendingRequest(value) {
    sendingRequest = value;
    notifyListeners();
  }

  Future<void> getDataPaginate() async {
    if (sendingRequest == true || completed == true) return;
    final result = await _testRepository.getDataPaginate(page);
    result.fold(
      (failure) {
        changeIsError(true);
        changeIsLoading(false);
        changeSendingRequest(false);
      },
      (response) {
        if (response.lastPage == page) {
          completed = true;
        } else {
          page++;
        }
        list.addAll(response.data!);
        changeSendingRequest(false);
        changeIsError(false);
        changeIsLoading(false);
      },
    );
  }

  Future<void> getData() async {
    if (sendingRequest == true || completed == true) return;
    final result = await _testRepository.getData();
    result.fold(
      (failure) {
        changeIsError(true);
        changeIsLoading(false);
      },
      (response) {
        item = response;
        changeSendingRequest(false);
        changeIsError(false);
      },
    );
  }

  Future<void> uploadFile({required final File file}) async {
    if (isLoading) return;
    //String fileName = file.path.split('/').last;
    final result = await _testRepository.uploadFile();
    result.fold(
      (failure) {
        changeIsLoading(false);
      },
      (data) {
        changeIsLoading(false);
      },
    );
  }
}
