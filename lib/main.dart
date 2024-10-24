import 'package:car_dekho_app/src/app/myapp.dart';
import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';

final eventBus = EventBus();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
