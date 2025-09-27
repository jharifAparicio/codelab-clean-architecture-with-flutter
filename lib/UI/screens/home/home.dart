import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_books/UI/blocs/books/popular_books_cubit.dart';
import 'package:free_books/UI/blocs/books/recommended_books_cubit.dart';
import 'package:free_books/UI/blocs/books/search_books_cubit.dart';
import 'package:free_books/UI/widgets/cards/card_horizontal.dart';
import 'package:free_books/UI/widgets/cards/card_vertical.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _searchCtrl = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RecommendedBooksCubit>().load();
      context.read<PopularBooksCubit>().load();
    });
    _searchCtrl.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final q = _searchCtrl.text.trim();
    _debounce?.cancel();
    if (q.isEmpty) return;
    _debounce = Timer(const Duration(milliseconds: 400), () {
      context.read<SearchBooksCubit>().search(q, reset: true);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: ValueListenableBuilder<TextEditingValue>(
          valueListenable: _searchCtrl,
          builder: (_, value, __) {
            final isSearching = value.text.trim().isNotEmpty;
            return Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: _searchCtrl,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: 'Search books...',
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFFACB8C9),
                  ),
                  suffixIcon: isSearching
                      ? IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            _searchCtrl.clear();
                            FocusScope.of(context).unfocus();
                          },
                        )
                      : null,
                  border: InputBorder.none,
                ),
                onSubmitted: (q) {
                  final query = q.trim();
                  if (query.isNotEmpty) {
                    _debounce?.cancel();
                    context.read<SearchBooksCubit>().search(query, reset: true);
                  }
                  FocusScope.of(context).unfocus();
                },
              ),
            );
          },
        ),
      ),
      body: ValueListenableBuilder<TextEditingValue>(
        valueListenable: _searchCtrl,
        builder: (_, value, __) {
          final isSearching = value.text.trim().isNotEmpty;
          return isSearching ? _SearchResults() : _HomeLists();
        },
      ),
    );
  }
}

class _HomeLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Recommended
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            "Recommended Books",
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 310,
          child: BlocBuilder<RecommendedBooksCubit, BooksState>(
            builder: (context, state) {
              if (state is BooksLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is BooksError) {
                return Center(child: Text(state.message));
              }
              if (state is BooksLoaded && state.items.isNotEmpty) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: state.items.length,
                  itemBuilder: (_, i) => CardVertical(book: state.items[i]),
                );
              }
              return const Center(child: Text('No books found'));
            },
          ),
        ),

        // Popular
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Popular this week",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(80, 35),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(color: Colors.black),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "See all",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<PopularBooksCubit, BooksState>(
            builder: (context, state) {
              if (state is BooksLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is BooksError) {
                return Center(child: Text(state.message));
              }
              if (state is BooksLoaded && state.items.isNotEmpty) {
                return ListView.builder(
                  itemCount: state.items.length,
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemBuilder: (_, i) => CardHorizontal(book: state.items[i]),
                );
              }
              return const Center(child: Text('No books found'));
            },
          ),
        ),
      ],
    );
  }
}

class _SearchResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, BooksState>(
      builder: (context, state) {
        if (state is BooksLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is BooksError) {
          return Center(child: Text(state.message));
        }
        if (state is BooksLoaded && state.items.isNotEmpty) {
          return ListView.builder(
            itemCount: state.items.length,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemBuilder: (_, i) => CardHorizontal(book: state.items[i]),
          );
        }
        return const Center(child: Text('No results'));
      },
    );
  }
}
