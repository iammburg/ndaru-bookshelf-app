// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ndaru_flutter/screens/book_detail_screen.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Progres Membaca',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      title: 'Waktu Baca',
                      value: '12.5 jam',
                      subtitle: 'Minggu ini',
                      icon: Icons.timer,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildStatCard(
                      title: 'Total Buku',
                      value: '23',
                      subtitle: 'Dalam progres',
                      icon: Icons.book,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Sedang Membaca',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildCurrentlyReadingBook(
                context: context,
                title: 'Crime and Punishment',
                author: 'Fyodor Dostoevsky',
                currentPage: 618,
                totalPages: 720,
              ),
              const SizedBox(height: 16),
              _buildCurrentlyReadingBook(
                context: context,
                title: 'The Old Man & The Sea',
                author: 'Ernest Hemingway',
                currentPage: 23,
                totalPages: 127,
              ),
              const SizedBox(height: 32),
              const Text(
                'Target Membaca',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildGoalCard(
                title: 'Membaca Harian/Menit',
                targetValue: 30,
                currentValue: 25,
              ),
              const SizedBox(height: 16),
              _buildGoalCard(
                title: 'Jumlah Buku/Bulan',
                targetValue: 4,
                currentValue: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontFamily: 'DMSans',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'DMSans',
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: color.withOpacity(0.7),
              fontSize: 12,
              fontFamily: 'DMSans',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentlyReadingBook({
    required BuildContext context,
    required String title,
    required String author,
    required int currentPage,
    required int totalPages,
  }) {
    double progress = currentPage / totalPages;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailScreen(
              title: title,
              author: author,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.book, color: Colors.grey),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'PlayfairDisplay',
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    author,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      fontFamily: 'DMSans',
                    ),
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey[200],
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$currentPage dari $totalPages halaman',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                      fontFamily: 'DMSans',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGoalCard({
    required String title,
    required int targetValue,
    required int currentValue,
  }) {
    double progress = currentValue / targetValue;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'DMSans'),
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$currentValue',
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'DMSans',
                ),
              ),
              Text(
                'Target: $targetValue',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                  fontFamily: 'DMSans',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
