import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/presentation/view/widgets/between_cities_tab_bar.dart';
import 'package:task/presentation/view/widgets/custom_tab_bar.dart';
import 'package:task/presentation/view/widgets/driver_tab_bar.dart';
import 'package:task/presentation/view/widgets/guide_tab_bar.dart';
import 'package:task/presentation/view/widgets/in_city_tab_bar.dart';
import 'package:task/utilities/media_quary.dart';


class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> with TickerProviderStateMixin {
  late TabController _tabController1;
  late TabController _tabController2;

  @override
  void initState() {
    _tabController1 = TabController(length: 2, vsync: this);
    _tabController2 = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController1.dispose();
    _tabController2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            padding: EdgeInsets.only(bottom: 24.h),
            //height: MediaQueryHelper.height * .9,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  height: MediaQueryHelper.height * .2,
                  width: MediaQueryHelper.width,
                  margin: const EdgeInsets.only(bottom: 32.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(14.0.r),
                        topRight: Radius.circular(14.0.r)),
                    image: const DecorationImage(
                        image: NetworkImage('https://picsum.photos/200/300'),
                        fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'What do you want hire?',
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: MediaQueryHelper.height * .01,
                        ),
                        CustomTabBar(
                          tabController: _tabController1,
                          viewsBody: const [DriverTabBar(), GuideTabBar()],
                          viewsTitle: const [
                            Tab(
                              text: 'Driver',
                            ),
                            Tab(
                              text: 'Guide',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQueryHelper.height * .01,
                        ),
                        const Text(
                          'Choose Trip Type',
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: MediaQueryHelper.height * .01,
                        ),
                        CustomTabBar(isScrollable: true,
                          tabController: _tabController2,
                          viewsBody: const [
                            InCityTabBar(),
                            BetweenCitiesTabBar()
                          ],
                          viewsTitle: const [
                            Tab(
                              text: 'In City',
                            ),
                            Tab(
                              text: 'Between Cities',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQueryHelper.height * .06,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r))),
                            child: const Text(
                              'Hire',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ]),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
