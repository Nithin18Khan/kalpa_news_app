import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavViewModel extends StateNotifier<int> {
  BottomNavViewModel() : super(0);

  void changeIndex(int newIndex) {
    state = newIndex;
  }
}

final bottomNavProvider = StateNotifierProvider<BottomNavViewModel, int>((ref) {
  return BottomNavViewModel();
});
