import 'package:flutter/material.dart';

class VehicleFeatureListWidget extends StatelessWidget {
  const VehicleFeatureListWidget({
    super.key,
    required this.vehicleFeatures,
  });

  final List<Map<String, dynamic>> vehicleFeatures;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: vehicleFeatures.map((feature) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(feature['icon']),
                ),
              ),
              Expanded(
                flex: 9,
                child: Text(
                  feature['featureTitle'],
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                flex: 4,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${feature['featureName']}',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.w500),
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
