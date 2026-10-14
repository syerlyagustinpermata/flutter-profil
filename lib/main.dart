import 'package:flutter/material.dart';

void main() {
  runApp(const ProfilMahasiswaApp());
}

class ProfilMahasiswaApp extends StatelessWidget {
  const ProfilMahasiswaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil Mahasiswa',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2563EB)),
        scaffoldBackgroundColor: const Color(0xFFF3F6FC),
      ),
      home: const HalamanProfil(),
    );
  }
}

class HalamanProfil extends StatelessWidget {
  const HalamanProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menu yang muncul dari sebelah kiri.
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF172554)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/syerly.jpeg',
                      width: 75,
                      height: 75,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.account_circle,
                          size: 75,
                          color: Colors.white,
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 10),
                  Text(
                    'Profil Mahasiswa',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Profil Mahasiswa'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.badge_outlined),
              title: const Text('Informasi Mahasiswa'),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Informasi Mahasiswa'),
                    content: const Text(
                      'Nama: Syerly Agustin Permata Sari\n'
                      'Program Studi: Teknik Informatika\n'
                      'Kelas: TI - A\n'
                      'Semester: 5',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Tutup'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),

      // AppBar dengan menu kiri dan titik tiga kanan.
      appBar: AppBar(
        backgroundColor: const Color(0xFF172554),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Profil Mahasiswa',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'Buka menu',
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            tooltip: 'Menu lainnya',
            onSelected: (value) {
              if (value == 'informasi') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Informasi'),
                    content: const Text(
                      'Halaman profil mahasiswa dibuat '
                      'menggunakan Flutter.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Tutup'),
                      ),
                    ],
                  ),
                );
              } else if (value == 'tentang') {
                showAboutDialog(
                  context: context,
                  applicationName: 'Profil Mahasiswa',
                  applicationVersion: '1.0.0',
                );
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'informasi', child: Text('Informasi')),
            ],
          ),
        ],
      ),

      // Isi halaman profil mahasiswa.
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Foto dan nama mahasiswa.
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: const Color(0xFF172554),
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.withValues(alpha: 0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/syerly.jpeg',
                        width: 110,
                        height: 110,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 110,
                            height: 110,
                            color: const Color(0xFFDBEAFE),
                            child: const Icon(
                              Icons.person,
                              size: 65,
                              color: Color(0xFF1D4ED8),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Syerly Agustin Permata Sari',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '2495114032',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFFDBEAFE), fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.school_outlined,
                        color: Colors.white,
                        size: 19,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Semester 5 • Kelas A',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Informasi Mahasiswa',
              style: TextStyle(
                color: Color(0xFF172554),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // Informasi identitas dalam Card.
            Card(
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: const BorderSide(color: Color(0xFFE2E8F0)),
              ),
              child: const Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  children: [
                    BarisInformasi(
                      ikon: Icons.badge_outlined,
                      judul: 'Nama Lengkap',
                      isi: 'Syerly Agustin Permata Sari',
                    ),
                    Divider(height: 28),
                    BarisInformasi(
                      ikon: Icons.computer_outlined,
                      judul: 'Program Studi',
                      isi: 'Teknik Informatika',
                    ),
                    Divider(height: 28),
                    BarisInformasi(
                      ikon: Icons.groups_outlined,
                      judul: 'Kelas',
                      isi: 'TI - A',
                    ),
                    Divider(height: 28),
                    BarisInformasi(
                      ikon: Icons.menu_book_outlined,
                      judul: 'Semester',
                      isi: '5',
                    ),
                    Divider(height: 28),
                    BarisInformasi(
                      ikon: Icons.favorite_border,
                      judul: 'Hobi',
                      isi: 'Hair Artistry',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 22),

            // Informasi tambahan.
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.image_outlined,
                    size: 45,
                    color: Color(0xFF2563EB),
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Informasi Tambahan',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF172554),
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          'Saya sedang mempelajari '
                          'pengembangan aplikasi menggunakan Flutter.',
                          style: TextStyle(
                            color: Color(0xFF64748B),
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // Tombol detail.
            SizedBox(
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Detail Mahasiswa'),
                      content: const Text(
                        'Nama: Syerly Agustin Permata Sari\n\n'
                        'Program Studi: Teknik Informatika\n\n'
                        'Kelas: TI - A\n\n'
                        'Semester: 5\n\n'
                        'Hobi:Hair Artistry',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Tutup'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.person_search_outlined),
                label: const Text(
                  'Detail',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 22),

            const Center(
              child: Text(
                'Profil Mahasiswa • Dibuat dengan Flutter',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF64748B), fontSize: 12),
              ),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

// Widget untuk menyusun ikon dan informasi secara horizontal.
class BarisInformasi extends StatelessWidget {
  final IconData ikon;
  final String judul;
  final String isi;

  const BarisInformasi({
    super.key,
    required this.ikon,
    required this.judul,
    required this.isi,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: const Color(0xFFDBEAFE),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(ikon, color: const Color(0xFF1D4ED8)),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                judul,
                style: const TextStyle(color: Color(0xFF64748B), fontSize: 12),
              ),
              const SizedBox(height: 5),
              Text(
                isi,
                style: const TextStyle(
                  color: Color(0xFF172554),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
