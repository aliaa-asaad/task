import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/presentation/view_model/task_controller.dart';
import 'package:task/utilities/media_quary.dart';

class InCityTabBar extends StatefulWidget {
  const InCityTabBar({super.key});

  @override
  State<InCityTabBar> createState() => _InCityTabBarState();
}

class _InCityTabBarState extends State<InCityTabBar> {
  String dropdownvalue = 'Select';

  // List of items in our dropdown menu

  DateTime? startDate;
  DateTime? endDate;

  int difference = 0;

  startDateMethod() async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2001, 1, 1),
      lastDate: DateTime(2025, 12, 30),
    ).then((value) {
      setState(() {
        startDate = value;
        log('start :${startDate.toString()}');
      });
      if (value == null) {
        return;
      }
    });
  }

  endDateMethod() async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2001, 1, 1),
      lastDate: DateTime(2025, 12, 30),
    ).then((value) {
      setState(() {
        endDate = value;
        log('end :${endDate.toString()}');
      });
      if (value == null) {
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Date',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: MediaQueryHelper.height * .01,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
              height: MediaQueryHelper.height * .07,
              width: MediaQueryHelper.width * .4,
              child: OutlinedButton(
                onPressed: () async {
                  await startDateMethod();
                  log(startDate.toString());
                },
                child: startDate == null
                    ? const Text('Start date',
                        style: TextStyle(fontSize: 20, color: Colors.grey))
                    : Text(
                        '${startDate!.day}/${startDate!.month}/${startDate!.year}',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.grey)),
              ),
            ),
            SizedBox(
              height: MediaQueryHelper.height * .07,
              width: MediaQueryHelper.width * .4,
              child: OutlinedButton(
                onPressed: () async {
                  await endDateMethod();
                  log(endDate.toString());
                  setState(() {
                    difference = endDate!.difference(startDate!).inDays;
                  });
                  log(difference.toString());
                },
                child: endDate == null
                    ? const Text('End date',
                        style: TextStyle(fontSize: 20, color: Colors.grey))
                    : Text('${endDate!.day}/${endDate!.month}/${endDate!.year}',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.grey)),
              ),
            ),
          ]),
         SizedBox(
            height: MediaQueryHelper.height * .01,
          ),
          Column(
            children: List.generate(
              difference,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical:8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('day'),
                    Consumer<DataController>(
                      builder: (context, value, child) {
                        
                        if (value.workCitys.isEmpty) {
                          log('message: ${value.workCitys}');
              
                          //log('message: ${value.dataModel.drivers![0].name.toString()}');
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          log('city value: ${value.dataModel[0].workCitys.toString()}');
                          return SizedBox(
                            width: MediaQueryHelper.width * .6,
                            child: DropdownButtonFormField(
                              icon: const Icon(Icons.keyboard_arrow_down),
                              decoration: const InputDecoration(
                                isDense: true,
                                border: OutlineInputBorder(),
                              ),
                              hint: Text(value.cityValue),
                              items: /* items */
                                  value.workCitys.map((value) {
                                return DropdownMenuItem<String>(
                                  value: value.city,
                                  child: Text(value.city!),
                                );
                              }).toList(),
                              onChanged: (city) {
                                value.updateCity(city!);
                              },
                            ),
                          );
                          
                        }
                      },
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
