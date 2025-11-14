import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../global/app_core/store/app_state.dart';
import '../../../../global/services/analytics_service.dart';
import '../../../../global/services/app_storage/app_storage.dart';
import '../../../../global/services/app_storage/app_storage_keys.dart';
import '../../../../global/utils/app_utils.dart';
import '../../domain/models/home_data_model.dart';
import '../../domain/models/pokemon_model.dart';
import '../stores/home_store.dart';
import '../widgets/filter_widget.dart';
import '../widgets/list_view_card_detail.dart';

mixin HomePageMixin<T extends StatefulWidget> on State<T> {
  HomeStore get homeStore => GetIt.I<HomeStore>();

  final TextEditingController searchController = TextEditingController();

  final ScrollController scrollController = ScrollController();

  bool _showScrollToTopButton = false;
  bool get showScrollToTopButton => _showScrollToTopButton;

  bool _homeDataHasFilter = false;

  void Function()? _storeListener;

  @override
  void initState() {
    super.initState();
    _setUserAnalytics();
    _storeListener = homeStore.addListener((state) {
      final state = homeStore.state;
      if (state is SuccessState<HomeDataModel>) {
        _homeDataHasFilter = state.data.hasFilter;
      }
    });
    scrollController.addListener(_canShowScrollToTopButtonListener);
    homeStore.loadData();
  }

  @override
  void dispose() {
    searchController.dispose();
    scrollController.removeListener(_canShowScrollToTopButtonListener);
    scrollController.dispose();
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
                AnalyticsService.logEvent(name: 'filter_by_type', parameters: {'type': type});
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

  void _setUserAnalytics() {
    final prefs = GetIt.I<AppStorage>();
    String? userId = prefs.getString(AppStorageKeys.userId);

    if (userId.isNullOrEmpty()) {
      userId = AppUtils.generateRandomId();
      prefs.setString(AppStorageKeys.userId, userId);
    }

    AnalyticsService.setUserId(userId!);
    AnalyticsService.setUserProperty(name: 'is_logged', value: 'false');
  }

  void openItemDetails(PokemonModel pokemon) {
    AnalyticsService.logSelectContent(contentType: 'pokemon', itemId: '${pokemon.id}-${pokemon.name}');
    showModalBottomSheet(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      context: context,
      builder: (context) => ListViewCardDetail(pokemon: pokemon),
    );
  }

  void _canShowScrollToTopButtonListener() {
    final shouldShow = scrollController.offset > 500;
    if (shouldShow != showScrollToTopButton) {
      setState(() {
        if (!mounted) return;
        _showScrollToTopButton = shouldShow;
      });
    }
  }
}
