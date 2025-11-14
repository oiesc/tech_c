import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../stores/home_store.dart';
import '../widgets/filter_widget.dart';

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
              homeStore.filterByType(type);
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
