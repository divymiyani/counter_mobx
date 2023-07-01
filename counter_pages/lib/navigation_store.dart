import 'package:mobx/mobx.dart';
part 'navigation_store.g.dart';

class NavigationStore = _NavigationStore with _$NavigationStore;

enum TabItem {
  Screen1,
  Screen2,
  Screen3,
}

abstract class _NavigationStore with Store {
  @observable
  TabItem currentTab = TabItem.Screen1;

  @action
  void changeTab(TabItem newTab) {
    currentTab = newTab;
  }
}
