import 'package:flutter/material.dart';
import 'package:free_books/repository/book_repository.dart';
import 'package:free_books/widgets/card_vertical.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          decoration: InputDecoration(
            hintText: 'Search books...',
            prefixIcon: Icon(Icons.search, color: const Color(0xFFACB8C9)),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
            child: FutureBuilder(
              future: BookRepository.fetchBooks(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No books found'));
                }
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final book = snapshot.data![index];
                    return CardVertical(book: book);
                  },
                );
              },
            ),
          ),
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
                    minimumSize: Size(80, 35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Colors.black),
                    ),
                  ),
                  child: Text("See all", style: TextStyle(color: Colors.black)),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Color(0xffEDEEEE),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.network(
                          'https://picsum.photos/200/300?random=$index',
                          height: 70,
                          width: 50,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Title Book",
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                          ),
                          Text(
                            "Author last name",
                            style: TextStyle(color: Color(0xFF919CAC)),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
