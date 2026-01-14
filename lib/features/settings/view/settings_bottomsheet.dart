import 'package:flutter/material.dart';

import '../widget/base_filter_item.dart';

class RulesBottomSheet extends StatelessWidget {
  const RulesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(4, (index) {
          return BaseFitreItem(
            isChecked: true,
            onChanged: () {
              // viewModel.toggleCategory(category.id);
            },
            title: 'title',
          );
        }),
      ),
    );
  }
}
