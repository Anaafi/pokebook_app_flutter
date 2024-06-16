import 'package:flutter/material.dart';

import 'package:pokebook_app/src/styles/text_styles.dart';

class CustomizedTabBar extends StatelessWidget {
  const CustomizedTabBar({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFE9E9E9),
        borderRadius: BorderRadius.circular(60),
      ),
      child: TabBar(
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(55),
          color: Colors.white,
          shape: BoxShape.rectangle,
        ),
        labelStyle: TextStyles.body,
        indicatorSize: TabBarIndicatorSize.tab,
        controller: tabController,
        tabs: const [
          Tab(
            text: 'About',
          ),
          Tab(
            text: 'Stats',
          ),
          Tab(
            text: 'Similar',
          ),
        ],
      ),
    );
  }
}
