import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../global/app_core/store/app_state.dart';
import '../../domain/models/home_data_model.dart';
import '../stores/home_store.dart';
import '../widgets/filter_widget.dart';

mixin HomePageMixin<T extends StatefulWidget> on State<T> {
  HomeStore get homeStore => GetIt.I<HomeStore>();

  final TextEditingController searchController = TextEditingController();

  bool _homeDataHasFilter = false;

  void Function()? _storeListener;

  @override
  void initState() {
    super.initState();
    _storeListener = homeStore.addListener((state) {
      final state = homeStore.state;
      if (state is SuccessState<HomeDataModel>) {
        _homeDataHasFilter = state.data.hasFilter;
      }
    });
    homeStore.loadData();
  }

  @override
  void dispose() {
    searchController.dispose();
    _storeListener?.call();
    _removeOverlay();
    super.dispose();
  }

  OverlayEntry? _overlayEntry;

  void onFilterPressed() {
    _removeOverlay();

    _overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () => _removeOverlay(),
        child: Container(
          color: Colors.black.withValues(alpha: 0.5),
          child: FilterWidget(
            allTypes: homeStore.allTypes,
            onFilterChanged: (type) {
              if (type.isNotEmpty || _homeDataHasFilter) {
                homeStore.filterByType(type);
              }
              _removeOverlay();
            },
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
