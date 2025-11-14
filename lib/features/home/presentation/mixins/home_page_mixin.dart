import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../stores/home_store.dart';

mixin HomePageMixin<T extends StatefulWidget> on State<T> {
  HomeStore get homeStore => GetIt.I<HomeStore>();

  @override
  void initState() {
    super.initState();
    homeStore.loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
