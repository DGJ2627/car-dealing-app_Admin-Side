import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../packages/resources/colors.dart';

class OtherServicesWidget extends StatelessWidget {
  const OtherServicesWidget({
    super.key,
    required this.titleName,
    this.onTap,
    required this.icon,
  });

  final String titleName;
  final void Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: AlignmentDirectional.center,
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          border: Border.all(color: AppColors.secondaryColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              titleName,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColors.blackColor, fontSize: 14),
            ),
            const Gap(20),
            Icon(
              icon,
              size: 60,
            )
          ],
        ),
      ),
    );
  }
}
