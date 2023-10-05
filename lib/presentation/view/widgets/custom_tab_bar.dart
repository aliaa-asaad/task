import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/utilities/media_quary.dart';

class CustomTabBar extends StatelessWidget {
  final bool isScrollable;
  final TabController tabController;
  final List<Widget> viewsBody;
  final List<Tab> viewsTitle;

  const CustomTabBar({
    super.key,
    required this.tabController,
    required this.viewsBody,
    required this.viewsTitle,  this.isScrollable=false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(
            8.0.r,
          ),
        ),
        height: MediaQueryHelper.height * .05,
        child: TabBar(
          unselectedLabelColor: Colors.black,
          indicatorWeight: 3,
          labelColor: Colors.black,
          labelStyle: TextStyle(fontSize: 17.sp),
          controller: tabController,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8.0.r,
            ),
            color: Theme.of(context).colorScheme.primary,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Theme.of(context).colorScheme.primary,
          tabs: viewsTitle,
        ),
      ),
      SizedBox(
        height: isScrollable? MediaQueryHelper.height * .4:MediaQueryHelper.height * .15,
        child: TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: tabController,
          children: viewsBody,
        ),
      ),
    ]);
  }
}
