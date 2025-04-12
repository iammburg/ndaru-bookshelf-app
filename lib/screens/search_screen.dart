import 'package:flutter/material.dart';
import '../../widgets/book_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buku apa yang pengen kamu cari?',
                  hintStyle: TextStyle(
                    fontFamily: 'DMSans',
                  ),
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 2, top: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Rekomendasi buat kamu',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'PlayfairDisplay',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: const [
                  BookCard(
                    title: 'Sang Pemimpi',
                    author: 'Andrea Hirata',
                    tags: ['Fiction', 'Philosophy', 'Adventure'],
                  ),
                  BookCard(
                    title: 'Crime and Punishment',
                    author: 'Fyodor Dostoevsky',
                    tags: [
                      'Fiction',
                      'Literary',
                      'Psychological',
                      'Philosophy',
                      'Thriller',
                      'Mystery',
                    ],
                  ),
                  BookCard(
                    title: 'The Stranger',
                    author: 'Albert Camus',
                    tags: [
                      'Fiction',
                      'Literary',
                      'Psychological',
                      'Philosophy',
                      'Thriller',
                    ],
                  ),
                  BookCard(
                    title: 'Metamorphosis',
                    author: 'Franz Kafka',
                    tags: [
                      'Fiction',
                      'Literary',
                      'Psychological',
                      'Philosophy',
                      'Thriller',
                    ],
                  ),
                  BookCard(
                    title: 'The Old Man & the Sea',
                    author: 'Ernest Hemingway',
                    tags: [
                      'Fiction',
                      'Literary',
                      'Philosophy',
                    ],
                  ),
                  BookCard(
                    title: 'The Pearl',
                    author: 'John Steinbeck',
                    tags: [
                      'Fiction',
                      'Literary',
                      'Psychological',
                      'Philosophy',
                      'Thriller',
                    ],
                  ),
                  BookCard(
                    title: 'Animal Farm',
                    author: 'George Orwell',
                    tags: [
                      'Fiction',
                      'Political',
                      'Satire',
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
