import 'package:attendsync/app.dart';
import 'package:attendsync/services/hive/hive_service.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.initHive();
  runApp(const AttendsyncApp());
}