import 'package:assistentemovel/lembretes.dart';
import 'package:flutter/material.dart';
import 'adclembretes.dart';
import 'editlembretes.dart';
import 'lembretes.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:AdcLembretes(),
    );
  }
}
