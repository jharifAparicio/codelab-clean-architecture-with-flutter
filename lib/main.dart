import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_books/Core/di/service_locator.dart';
import 'package:free_books/Core/theme/app_theme.dart';
import 'package:free_books/Infrastructure/download/download_cubit.dart';
import 'package:free_books/UI/blocs/books/popular_books_cubit.dart';
import 'package:free_books/UI/blocs/books/recommended_books_cubit.dart';
import 'package:free_books/UI/blocs/books/search_books_cubit.dart';
// import 'package:free_books/UI/blocs/simple_bloc.dart';
import 'package:free_books/UI/screens/home/home.dart';

void main() {
  // Bloc.observer = SimpleBlocObserver();
  setupLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<PopularBooksCubit>()),
        BlocProvider(create: (context) => sl<RecommendedBooksCubit>()),
        BlocProvider(create: (context) => sl<SearchBooksCubit>()),
        BlocProvider(create: (context) => sl<DownloadCubit>()),
      ],
      child: MaterialApp(theme: AppTheme.getTheme(), home: Home()),
    );
  }
}
