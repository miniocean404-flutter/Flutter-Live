import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AllController extends ChangeNotifier {
  late RefreshController refreshController;
  late int loadState;

  RefreshController get getRefreshController => refreshController;
  int get getLoadState => loadState;

  set setRefreshController(RefreshController v) {
    refreshController = v;
    notifyListeners();
  }

  set setLoadState(int v) {
    loadState = v;
    notifyListeners();
  }
}
