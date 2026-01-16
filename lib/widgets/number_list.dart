import 'package:flutter/material.dart';
import 'package:pie_study/widgets/app_colors.dart';

class NumberedList extends StatelessWidget {
  final List<String> items;
  const NumberedList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((e) {
        i++;
        return Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$i. ',
                style: const TextStyle(fontSize: 14, height: 1.4),
              ),
              Expanded(
                child: Text(
                  e,
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
