import 'package:flutter/material.dart';
import 'package:flutter_voice_chat/src/app.dart';
import 'package:flutter_voice_chat/src/home/home_model.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeModelProvider>(
            create: (_) => HomeModelProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
