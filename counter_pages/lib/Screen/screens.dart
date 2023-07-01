import 'package:counter_pages/Screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:counter_pages/navigation_store.dart';
import 'package:counter_pages/counter_store.dart';

class Screen extends StatelessWidget {
  final String title;
  final NavigationStore nStore = NavigationStore();
  final CounterStore counterStore1 = CounterStore();
  final CounterStore counterStore2 = CounterStore();
  final CounterStore counterStore3 = CounterStore();

  Screen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
      body: Observer(
        builder: (_) {
          switch (nStore.currentTab) {
            case TabItem.Screen1:
              return HomeScreen(counterStore: counterStore1);
            case TabItem.Screen2:
              return HomeScreen(counterStore: counterStore2);
            case TabItem.Screen3:
              return HomeScreen(counterStore: counterStore3);
            default:
              return SizedBox();
          }
        },
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return Observer(
      builder: (_) => BottomNavigationBar(
        currentIndex: TabItem.values.indexOf(nStore.currentTab),
        onTap: (index) {
          final newTab = TabItem.values[index];
          nStore.changeTab(newTab);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.pages_rounded),
            label: 'Screen 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pages_rounded),
            label: 'Screen 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pages_rounded),
            label: 'Screen 3',
          ),
        ],
      ),
    );
  }
}
