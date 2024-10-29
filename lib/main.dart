import 'package:car_dekho_app/src/app/myapp.dart';
import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';

final eventBus = EventBus();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // GenerativeModel(
  //   model: 'gemini-1.5-flash-latest',
  //   apiKey: AppConstants.generativeAiKey,
  // );
  runApp(const MyApp());
}
