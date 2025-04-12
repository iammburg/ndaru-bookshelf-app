import 'package:flutter/material.dart';

class BookDetailScreen extends StatelessWidget {
  final String title;
  final String author;

  const BookDetailScreen({
    super.key,
    required this.title,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    String synopsis;

    if (title == 'Laskar Pelangi') {
      synopsis =
          'Kisah suka duka kehidupan anak-anak murid SD dari keluarga miskin di Desa Belitung. Meski hari-hari mereka selalu dipenuhi tantangan dan keterbatasan, namun hal itu tak menyurutkan tekad mereka untuk tetap bersekolah demi meraih impian dan cita-cita.';
    } else if (title == 'Bumi Manusia') {
      synopsis =
          'Bumi Manusia adalah novel karya Pramoedya Ananta Toer yang bercerita tentang kehidupan Minke, seorang pemuda pribumi yang bersekolah di HBS (Hogere Burgerschool) pada masa penjajahan Belanda. Novel ini bertemakan perjuangan melawan ketidakadilan dan diskriminasi yang dilakukan oleh pemerintah kolonial. ';
    } else {
      synopsis =
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.book, size: 50),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontFamily: 'PlayfairDisplay',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              author,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'DMSans',
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoItem('4.4', 'Rating'),
                _buildInfoItem('262', 'Halaman'),
                _buildInfoItem('Id', 'Bahasa'),
              ],
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sinopsis',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              synopsis,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'DMSans',
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'DMSans',
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'DMSans',
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
