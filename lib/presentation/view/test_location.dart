import 'package:flutter/material.dart';
import 'package:task/handlres/location.dart';

class TestLocation extends StatefulWidget {
  const TestLocation({super.key});

  @override
  State<TestLocation> createState() => _TestLocationState();
}

class _TestLocationState extends State<TestLocation> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDistancewithGeo();
    getDistancewithoutGeo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
