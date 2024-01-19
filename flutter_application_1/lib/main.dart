import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/luas_persegi': (context) => const LuasPersegiScreen(),
        '/luas_lingkaran': (context) => const LuasLingkaranScreen(),
        '/profile_developer': (context) => const ProfileDeveloperScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project UAS Pemrograman Mobile'),
      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/luas_persegi');
              },
              child: const Text('Hitung Luas Persegi'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/luas_lingkaran');
              },
              child: const Text('Hitung Luas Lingkaran'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile_developer');
              },
              child: const Text('Profile Developer'),
            ),
          ],
        ),
      ),
    );
  }
}

class LuasPersegiScreen extends StatefulWidget {
  const LuasPersegiScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LuasPersegiScreenState createState() => _LuasPersegiScreenState();
}

class _LuasPersegiScreenState extends State<LuasPersegiScreen> {
  final TextEditingController _panjangController = TextEditingController();
  final TextEditingController _lebarController = TextEditingController();
  double _luas = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hitung Luas Persegi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _panjangController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Panjang'),
            ),
            TextField(
              controller: _lebarController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Lebar'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                double panjang = double.tryParse(_panjangController.text) ?? 0.0;
                double lebar = double.tryParse(_lebarController.text) ?? 0.0;
                double luas = panjang * lebar;
                setState(() {
                  _luas = luas;
                });
              },
              child: const Text('Hitung Luas'),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Luas Persegi: $_luas',
              style: const TextStyle(fontSize: 20.0),
              
            ),
          ],
        ),
      ),
    );
  }
}

class LuasLingkaranScreen extends StatefulWidget {
  const LuasLingkaranScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LuasLingkaranScreenState createState() => _LuasLingkaranScreenState();
}

class _LuasLingkaranScreenState extends State<LuasLingkaranScreen> {
  final TextEditingController _radiusController = TextEditingController();
  double _luasLingkaran = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hitung Luas Lingkaran'),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _radiusController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Radius Lingkaran'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                double radius = double.tryParse(_radiusController.text) ?? 0.0;
                double luas = pow(radius, 2) * pi;
                setState(() {
                  _luasLingkaran = luas;
                });
              },
              child: const Text('Hitung Luas'),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Luas Lingkaran: $_luasLingkaran',
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDeveloperScreen extends StatelessWidget {
  const ProfileDeveloperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Developer'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama Developer: Muhammad Robbi Alfani'),
            Text('NPM: 2210020094'),
            Text('Kelas: 7A Sistem Informasi Non Reguler Banjarbaru'),
            Text('Kontak: 0821083018'),
            Text('Alamat: Banjarbaru'),
          ],
        ),
      ),
    );
  }
}
