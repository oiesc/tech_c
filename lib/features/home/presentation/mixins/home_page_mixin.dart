import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../stores/home_store.dart';

mixin HomePageMixin<T extends StatefulWidget> on State<T> {
  HomeStore get homeStore => GetIt.I<HomeStore>();

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    homeStore.loadData();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
