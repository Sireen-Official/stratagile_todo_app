import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_panel_provider.g.dart';
part 'navigation_panel_provider.freezed.dart';

@freezed
class NavigationPanelState with _$NavigationPanelState {
  const factory NavigationPanelState({
    required int index,
    required PageController pageController,
  }) = _NavigationPanelState;
}

@riverpod
class NavigationPanelNotifier extends _$NavigationPanelNotifier {
  @override
  NavigationPanelState build() {
    return NavigationPanelState(index: 0, pageController: PageController());
  }

  void onPanelTap(int index) {
    state.pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void onPageChanged(int index) {
    state = state.copyWith(index: index);
  }
}
