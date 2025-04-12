import 'package:flutter/material.dart';
import '../../widgets/category_card.dart';
import '../../widgets/popular_book_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Hi, Ndaru!",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'PlayfairDisplay',
                          fontWeight: FontWeight.bold)),
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person_2, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Cari buku\nterbaik buat kamu',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'PlayfairDisplay',
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Temukan buku terbaik yang sesuai dengan minat kamu!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'DMSans',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Kategori',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CategoryCard(
                      icon: Icons.bug_report_outlined,
                      title: 'Fiksi',
                      color: Colors.red,
                    ),
                    CategoryCard(
                      icon: Icons.attach_money_outlined,
                      title: 'Bisnis',
                      color: Colors.orange,
                    ),
                    CategoryCard(
                      icon: Icons.girl_outlined,
                      title: 'Kecantikan',
                      color: Colors.pinkAccent,
                    ),
                    CategoryCard(
                      icon: Icons.school_outlined,
                      title: 'Pendidikan',
                      color: Colors.green,
                    ),
                    CategoryCard(
                      icon: Icons.fastfood_outlined,
                      title: 'Kuliner',
                      color: Colors.brown,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Buku Populer',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: const [
                  PopularBookCard(
                    title: 'Laskar Pelangi',
                    author: 'Oleh: Andrea Hirata',
                    isBestSeller: true,
                  ),
                  PopularBookCard(
                    title: 'Bumi Manusia',
                    author: 'Oleh: Pramoedya Ananta Toer',
                    isBestSeller: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
