import 'package:dio/dio.dart';
import 'package:free_books/Core/config/env.dart';
import 'package:free_books/Domain/use_cases/download_book_usecase.dart';
import 'package:free_books/Domain/use_cases/get_popular_books_usecase.dart';
import 'package:free_books/Domain/use_cases/get_recommended_books_usecase.dart';
import 'package:free_books/Domain/use_cases/search_books_usecase.dart';
import 'package:free_books/Infrastructure/datasources/file_download_remote_datasources_imp.dart';
import 'package:free_books/Infrastructure/download/download_cubit.dart';
import 'package:free_books/Infrastructure/repositories/book_remote_repository_impl.dart';
import 'package:free_books/Infrastructure/datasources/book_remote_datasource_impl.dart';
import 'package:free_books/Infrastructure/repositories/download_repository_impl.dart';
import 'package:free_books/UI/blocs/books/popular_books_cubit.dart';
import 'package:free_books/UI/blocs/books/recommended_books_cubit.dart';
import 'package:free_books/UI/blocs/books/search_books_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupLocator() {
  // final datasource = BookLocalDataSourceImpl();
  // final repository = BookLocalRepositoryImpl(local: datasource);
  final dio = Dio();
  final datasource = BookRemoteDatasourceImpl(baseUrl: baseUrl, dio: dio);
  final repository = BookRemoteRepositoryImpl(remote: datasource);
  sl.registerLazySingleton(() => GetPopularBooksUseCase(repository));
  sl.registerLazySingleton(() => GetRecommendedBooksUseCase(repository));
  sl.registerLazySingleton(() => SearchBooksUseCase(repository));

  sl.registerFactory(() => PopularBooksCubit(getPopularBooks: sl()));
  sl.registerFactory(() => RecommendedBooksCubit(getRecommendedBooks: sl()));
  sl.registerFactory(() => SearchBooksCubit(searchBooks: sl()));

  final downloadDataSources = FileDownloadRemoteDatasourcesImp(dio);
  final downloadRepository = DownloadRepositoryImpl(
    remote: downloadDataSources,
  );
  sl.registerLazySingleton(() => DownloadBookUseCase(downloadRepository));
  sl.registerFactory(() => DownloadCubit(downloadBook: sl()));
}
