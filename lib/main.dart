import 'package:flutter/material.dart';
import 'package:free_books/screens/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  static OutlineInputBorder borderInput({
    Color color = const Color(0xFFE2E8F0),
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF6F7F8),
        textTheme: Typography.blackRedmond.apply(
          bodyColor: Color(0xFF060921),
          fontFamily: 'Newsreader',
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(color: Color(0xFFACB8C9)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(9),
          fillColor: Color(0xFFE2E8F0),
          filled: true,
          enabledBorder: borderInput(),
          focusedErrorBorder: borderInput(),
          focusedBorder: borderInput(),
          errorBorder: borderInput(color: Colors.red),
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: InputDecorationTheme(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(9),
            fillColor: Color(0xFFE2E8F0),
            filled: true,
            enabledBorder: borderInput(),
            focusedErrorBorder: borderInput(),
            focusedBorder: borderInput(),
            errorBorder: borderInput(color: Colors.red),
          ),
        ),
        fontFamily: 'Newsreader',
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          elevation: 0,
          backgroundColor: Color(0xFFF6F7F8),
          foregroundColor: Color(0xFF060921),
          titleTextStyle: TextStyle(
            color: Color(0xFF060921),
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),

        primarySwatch: Colors.blue,
        primaryColor: Color(0xFFF6F7F8),
      ),
      home: Home(),
    );
  }
}
