import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/presentation/view_model/task_controller.dart';
import 'package:task/utilities/media_quary.dart';

class DriverTabBar extends StatelessWidget {
  const DriverTabBar({super.key});

 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQueryHelper.height * .01,
          ),
          const Text(
            'Choose Driver',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: MediaQueryHelper.height * .01,
          ),
          Consumer<DataController>(
            builder: (context, value, child) {
              if (value.dataModel.isEmpty) {
                log('message: ${value.dataModel}');
                //log('message: ${value.dataModel.drivers![0].name.toString()}');
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                // log('message: ${value.dataModel[0].name.toString()}');
                return DropdownButtonFormField(
                  icon: const Icon(Icons.keyboard_arrow_down),
                  decoration: const InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                  ),
                  hint: Text(value.driverValue),
                  items: /* items */ value.dataModel.map((value) {
                    return DropdownMenuItem<String>(
                      value: value.name,
                      child: Text(value.name!),
                    );
                  }).toList(),
                  onChanged: (driver) {
                    value.updateDriver(driver!);
                    value.workCity();
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
