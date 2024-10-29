import 'package:flutter/material.dart';

import '../packages/resources/colors.dart';

abstract interface class BuildCommonState {
  static Widget buildLoadingState(BuildContext context, String text) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
