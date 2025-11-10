import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Instagram Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Instagram',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 34, // Ukuran font dari kode Anda
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.flag_outlined),
            onPressed: () {},
          ),
        ],
      ),

      // === PERUBAHAN 1: SingleChildScrollView Utama ===
      // Seluruh body sekarang bisa di-scroll, termasuk story section
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildStorySection(),
            const Divider(height: 1, color: Colors.grey), // Garis pemisah
            // Expanded tidak lagi diperlukan karena kita pakai SingleChildScrollView
            _buildPostSection(),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined), // Ikon untuk Reels
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
    );
  }

  Widget _buildStorySection() {
    return Container(
      // Tinggi 19% dari layar, sesuai kode Anda
      height: MediaQuery.of(context).size.height * 0.19,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(10, (index) {
            // Buat 10 story dummy
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // === PERUBAHAN 2: Gambar Story dari Internet ===
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.grey[300],
                    // Ambil gambar acak dari Picsum.
                    // 'random=$index' memastikan setiap story punya gambar unik
                    backgroundImage: NetworkImage(
                        'https://picsum.photos/100/100?random=$index'),
                  ),
                  const SizedBox(height: 5),
                  Text('user$index'),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  // --- WIDGET HELPER UNTUK POSTS ---
  Widget _buildPostSection() {
    return ListView.builder(
      // === PERUBAHAN 1 (Lanjutan): shrinkWrap & physics ===
      // Ini penting agar ListView di dalam SingleChildScrollView
      // tahu ukurannya dan tidak bentrok soal scrolling.
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      itemCount: 20, // Buat 20 post dummy
      itemBuilder: (context, index) {
        return _buildPostItem(index); // Panggil widget untuk tiap post
      },
    );
  }

  Widget _buildPostItem(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Post (Avatar + Username)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.grey[300],
                // Kita gunakan index + 100 agar gambarnya beda dari story
                backgroundImage: NetworkImage(
                    'https://picsum.photos/50/50?random=${index + 100}'),
              ),
              const SizedBox(width: 8),
              Text('username$index',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              const Icon(Icons.more_horiz),
            ],
          ),
        ),
        Container(
          height: 210,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey[300],
          child: Image.network(
            'https://picsum.photos/500/500?random=${index + 200}',
            fit: BoxFit.cover, 
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.favorite_border), onPressed: () {}),
              IconButton(
                  icon: const Icon(Icons.chat_bubble_outline),
                  onPressed: () {}),
              IconButton(
                  icon: const Icon(Icons.send_outlined), onPressed: () {}),
              const Spacer(),
              IconButton(
                  icon: const Icon(Icons.bookmark_border), onPressed: () {}),
            ],
          ),
        ),

        // Deskripsi dan Komentar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('disukai oleh otong dan ${index * 10 + 5} lainnya',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              const Text('deskripsi postingan anda ta selengkapnya...'),
              const SizedBox(height: 4),
              Text('lihat ${index + 2} komen',
                  style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ),
        const SizedBox(height: 20), // Jarak antar post
      ],
    );
  }
}