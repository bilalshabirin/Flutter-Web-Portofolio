import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyDigitalIdentityApp());
}

class MyDigitalIdentityApp extends StatelessWidget {
  const MyDigitalIdentityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digital Identity & KRS App',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF4EBE1),
        fontFamily: 'sans-serif',
        primaryColor: const Color(0xFF2B1B17),
      ),
      home: const MainPage(),
    );
  }
}

// -----------------------------------------------------------------------------
// MODEL DATA MATA KULIAH
// -----------------------------------------------------------------------------
class CourseModel {
  final String id;
  final String name;
  final String lecturer;
  final String day;
  final String time;
  final String room;
  final int sks;

  CourseModel({
    required this.id,
    required this.name,
    required this.lecturer,
    required this.day,
    required this.time,
    required this.room,
    required this.sks,
  });
}

// -----------------------------------------------------------------------------
// DATA DUMMY 30+ MATA KULIAH
// -----------------------------------------------------------------------------
final List<CourseModel> dummyCourses = [
  CourseModel(id: 'MK01', name: 'Kriptografi & Keamanan Informasi', lecturer: 'Muhammad Safi\'i, S.Kom., M.Kom.', day: 'Senin', time: '19:00 - 20:30', room: 'LAB A', sks: 3),
  CourseModel(id: 'MK02', name: 'Sistem Manajemen Basis Data', lecturer: 'Nasruddin bin Idris, S.Kom., M.Kom.', day: 'Senin', time: '20:30 - 22:00', room: 'LAB B', sks: 3),
  CourseModel(id: 'MK03', name: 'Pemrograman Web Lanjut (React & Vite)', lecturer: 'Dr. Ahmad Fauzi, M.T.', day: 'Senin', time: '19:00 - 20:30', room: 'R.301', sks: 3),
  CourseModel(id: 'MK04', name: 'Desain Pengalaman Pengguna (UI/UX)', lecturer: 'Siti Rahmawati, M.Ds.', day: 'Senin', time: '20:30 - 22:00', room: 'LAB UI', sks: 2),
  CourseModel(id: 'MK05', name: 'Teknologi Aplikasi Bergerak (Flutter)', lecturer: 'Istia Budi, S.Kom., M.Kom.', day: 'Selasa', time: '19:00 - 20:30', room: 'LAB A', sks: 3),
  CourseModel(id: 'MK06', name: 'Penalaran Komputer & Logika', lecturer: 'Isa Rosita, S.Kom., M.Kom.', day: 'Selasa', time: '20:30 - 22:00', room: 'A201', sks: 2),
  CourseModel(id: 'MK07', name: 'Simulasi & Game Komputer', lecturer: 'Horuzulkifli Rowa, S.Kom., M.Kom.', day: 'Selasa', time: '19:00 - 20:30', room: 'LAB A', sks: 3),
  CourseModel(id: 'MK08', name: 'Kecerdasan Buatan (AI)', lecturer: 'Dr. Budi Santoso, M.T.', day: 'Selasa', time: '20:30 - 22:00', room: 'R.302', sks: 3),
  CourseModel(id: 'MK09', name: 'Riset Machine Learning', lecturer: 'Rina Wijaya, M.Sc.', day: 'Rabu', time: '19:00 - 20:30', room: 'LAB AI', sks: 3),
  CourseModel(id: 'MK10', name: 'Jaringan Nirkabel & Mobile', lecturer: 'Maradona, S.Kom., M.Kom.', day: 'Rabu', time: '20:30 - 22:00', room: 'LAB JARINGAN', sks: 3),
  CourseModel(id: 'MK11', name: 'Penulisan & Publikasi Ilmiah', lecturer: 'Yustiani Servanda, S.Kom., M.Kom.', day: 'Rabu', time: '19:00 - 20:30', room: 'R.204', sks: 2),
  CourseModel(id: 'MK12', name: 'Cloud Computing & DevOps', lecturer: 'Hendra Pratama, M.T.', day: 'Rabu', time: '20:30 - 22:00', room: 'LAB CLOUD', sks: 3),
  CourseModel(id: 'MK13', name: 'Keamanan Siber & Pentesting', lecturer: 'Eko Prasetyo, S.Kom., M.T.', day: 'Kamis', time: '19:00 - 20:30', room: 'LAB CYBER', sks: 3),
  CourseModel(id: 'MK14', name: 'Pengolahan Citra Digital', lecturer: 'Dewi Lestari, M.Kom.', day: 'Kamis', time: '20:30 - 22:00', room: 'LAB C', sks: 3),
  CourseModel(id: 'MK15', name: 'Interaksi Manusia & Komputer', lecturer: 'Andi Saputra, M.T.', day: 'Kamis', time: '19:00 - 20:30', room: 'R.305', sks: 2),
  CourseModel(id: 'MK16', name: 'Tata Kelola Teknologi Informasi', lecturer: 'Nurmala, S.E., M.Si.', day: 'Kamis', time: '20:30 - 22:00', room: 'R.102', sks: 2),
  CourseModel(id: 'MK17', name: 'Internet of Things (IoT)', lecturer: 'Ir. Supriyanto, M.T.', day: 'Jumat', time: '19:00 - 20:30', room: 'LAB IOT', sks: 3),
  CourseModel(id: 'MK18', name: 'Etika Profesi & Hukum Cyber', lecturer: 'Bambang Sukoco, S.H., M.H.', day: 'Jumat', time: '20:30 - 22:00', room: 'R.101', sks: 2),
  CourseModel(id: 'MK19', name: 'Big Data & Analytics', lecturer: 'Dr. Retno Wulandari, M.Sc.', day: 'Jumat', time: '19:00 - 20:30', room: 'LAB DATA', sks: 3),
  CourseModel(id: 'MK20', name: 'Proyek Rekayasa Perangkat Lunak', lecturer: 'Pramudya Prima Insan, S.Kom., M.Kom.', day: 'Jumat', time: '20:30 - 22:00', room: 'LAB A', sks: 3),
  CourseModel(id: 'MK21', name: 'Pemrograman Terdistribusi', lecturer: 'Fajar Nugroho, M.Kom.', day: 'Senin', time: '19:00 - 20:30', room: 'R.202', sks: 2),
  CourseModel(id: 'MK22', name: 'Kewirausahaan Teknologi (Technopreneurship)', lecturer: 'Linda Kurnia, M.M.', day: 'Senin', time: '20:30 - 22:00', room: 'A103', sks: 2),
  CourseModel(id: 'MK23', name: 'Sistem Informasi Geografis (SIG)', lecturer: 'Tri Wahyudi, M.T.', day: 'Selasa', time: '19:00 - 20:30', room: 'LAB SIG', sks: 2),
  CourseModel(id: 'MK24', name: 'Analisis & Perancangan Sistem', lecturer: 'Kartika Sari, S.Kom., M.Kom.', day: 'Selasa', time: '20:30 - 22:00', room: 'R.304', sks: 3),
  CourseModel(id: 'MK25', name: 'Pemrograman Backend (Node.js & Go)', lecturer: 'Reza Kurniawan, M.T.', day: 'Rabu', time: '19:00 - 20:30', room: 'LAB WEB', sks: 3),
  CourseModel(id: 'MK26', name: 'Arsitektur Komputer & Organisasi', lecturer: 'Agus Setiawan, S.T., M.T.', day: 'Rabu', time: '20:30 - 22:00', room: 'R.201', sks: 2),
  CourseModel(id: 'MK27', name: 'Metodologi Penelitian TI', lecturer: 'Prof. Dr. Ir. Gunawan, M.T.', day: 'Kamis', time: '19:00 - 20:30', room: 'AUDITORIUM', sks: 2),
  CourseModel(id: 'MK28', name: 'Data Mining & Pola Informasi', lecturer: 'Dr. Indah Permata, M.Sc.', day: 'Kamis', time: '20:30 - 22:00', room: 'LAB DATA', sks: 3),
  CourseModel(id: 'MK29', name: 'Bahasa Inggris Ilmiah & Presentasi', lecturer: 'Sarah Johnson, M.Pd.', day: 'Jumat', time: '19:00 - 20:30', room: 'R.105', sks: 2),
  CourseModel(id: 'MK30', name: 'Manajemen Proyek Teknologi Informasi', lecturer: 'Dedi Kurniawan, S.T., M.M.', day: 'Jumat', time: '20:30 - 22:00', room: 'R.302', sks: 3),
];

// -----------------------------------------------------------------------------
// HALAMAN UTAMA & NAVIGASI
// -----------------------------------------------------------------------------
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final Set<String> _selectedCourseIds = {'MK01', 'MK05', 'MK09', 'MK13', 'MK17'};

  void _toggleCourse(String courseId) {
    setState(() {
      if (_selectedCourseIds.contains(courseId)) {
        _selectedCourseIds.remove(courseId);
      } else {
        _selectedCourseIds.add(courseId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedCourses = dummyCourses.where((c) => _selectedCourseIds.contains(c.id)).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEAE1D3),
        elevation: 0,
        shape: const Border(bottom: BorderSide(color: Color(0xFF2B1B17), width: 2)),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xFFC84B31),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xFF2B1B17)),
              ),
              child: const Icon(Icons.school, color: Colors.white, size: 18),
            ),
            const SizedBox(width: 10),
            const Text(
              'PORTAL KRS & DASHBOARD',
              style: TextStyle(
                color: Color(0xFF2B1B17),
                fontWeight: FontWeight.bold,
                fontSize: 16,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          DashboardTab(selectedCourses: selectedCourses),
          KrsSelectionTab(
            selectedIds: _selectedCourseIds,
            onToggle: _toggleCourse,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFEAE1D3),
          border: Border(top: BorderSide(color: Color(0xFF2B1B17), width: 2)),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          backgroundColor: const Color(0xFFEAE1D3),
          selectedItemColor: const Color(0xFFC84B31),
          unselectedItemColor: const Color(0xFF2B1B17).withOpacity(0.6),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_rounded),
              label: 'Dashboard & Jadwal',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_turned_in_rounded),
              label: 'Pilih KRS Matkul',
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// TAB 1: DASHBOARD (PROFIL, SKILLS, VIDEO GOOGLE DRIVE, & JADWAL KULIAH)
// -----------------------------------------------------------------------------
class DashboardTab extends StatelessWidget {
  final List<CourseModel> selectedCourses;

  const DashboardTab({super.key, required this.selectedCourses});

  Future<void> _openGoogleDriveVideo() async {
    final Uri url = Uri.parse('https://drive.google.com/file/d/1B9FUdQsjVJ7PogBrDVg4p6R5BA7xiDla/view?t=90.418');
    if (!await launchUrl(
      url, 
      mode: LaunchMode.externalApplication,
      webOnlyWindowName: '_blank',
    )) {
      debugPrint('Tidak dapat membuka URL: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalSks = selectedCourses.fold(0, (sum, item) => sum + item.sks);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Profil & Card Sambutan
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFEAE1D3),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF2B1B17), width: 2),
              boxShadow: const [
                BoxShadow(color: Color(0xFF2B1B17), offset: Offset(4, 4)),
              ],
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundColor: Color(0xFFC84B31),
                  child: Text(
                    'BS',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Selamat Datang, Bilal Shabirin!',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF2B1B17)),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Teknik Informatika • Semester 5',
                        style: TextStyle(fontSize: 12, color: const Color(0xFF2B1B17).withOpacity(0.7)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // 2. Video Identity Section (Tautan Google Drive)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFDF7),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF2B1B17), width: 2),
              boxShadow: const [
                BoxShadow(color: Color(0xFF2B1B17), offset: Offset(4, 4)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.video_library_rounded, color: Color(0xFFC84B31), size: 20),
                    SizedBox(width: 8),
                    Text(
                      'VIDEO IDENTITY PROJECT',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF2B1B17)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Tonton video dokumentasi dan identitas proyek secara langsung di Google Drive.',
                  style: TextStyle(fontSize: 12, color: const Color(0xFF2B1B17).withOpacity(0.8)),
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: _openGoogleDriveVideo,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A5D23),
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Color(0xFF2B1B17), width: 1.5),
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  icon: const Icon(Icons.open_in_new_rounded, size: 16),
                  label: const Text(
                    'Buka Video Identity (Google Drive)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // 3. Skills Section
          const Text(
            'Keahlian Utama (Skills)',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF2B1B17)),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildSkillBadge('Flutter & Dart', const Color(0xFFC84B31)),
              _buildSkillBadge('React.js & Vite', const Color(0xFF4A5D23)),
              _buildSkillBadge('Tailwind CSS', const Color(0xFF2B1B17)),
              _buildSkillBadge('Kriptografi', const Color(0xFF8C6D53)),
              _buildSkillBadge('Machine Learning', const Color(0xFF4A5D23)),
              _buildSkillBadge('Git & GitHub', const Color(0xFFC84B31)),
            ],
          ),

          const SizedBox(height: 24),

          // 4. Jadwal Kuliah Terpilih (Hasil KRS)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Jadwal Kuliah Anda',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF2B1B17)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFC84B31),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFF2B1B17)),
                ),
                child: Text(
                  'Total $totalSks SKS',
                  style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          selectedCourses.isEmpty
              ? Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAE1D3),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF2B1B17)),
                  ),
                  child: const Center(
                    child: Text(
                      'Belum ada mata kuliah yang dipilih.\nBuka tab "Pilih KRS Matkul" untuk memilih.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, color: Color(0xFF2B1B17)),
                    ),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: selectedCourses.length,
                  itemBuilder: (context, index) {
                    final course = selectedCourses[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAE1D3),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFF2B1B17), width: 1.5),
                        boxShadow: const [
                          BoxShadow(color: Color(0xFF2B1B17), offset: Offset(2, 3)),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFDF7),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: const Color(0xFF2B1B17)),
                            ),
                            child: Text(
                              course.day,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Color(0xFFC84B31)),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  course.name,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF2B1B17)),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '${course.time} • ${course.room} • ${course.lecturer}',
                                  style: TextStyle(fontSize: 11, color: const Color(0xFF2B1B17).withOpacity(0.7)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFF4A5D23),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '${course.sks} SKS',
                              style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }

  Widget _buildSkillBadge(String title, Color bg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFF2B1B17), width: 1),
      ),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// TAB 2: PILIH KRS (30+ DATA MATA KULIAH)
// -----------------------------------------------------------------------------
class KrsSelectionTab extends StatelessWidget {
  final Set<String> selectedIds;
  final Function(String) onToggle;

  const KrsSelectionTab({
    super.key,
    required this.selectedIds,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    int currentSks = dummyCourses
        .where((c) => selectedIds.contains(c.id))
        .fold(0, (sum, c) => sum + c.sks);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          color: const Color(0xFFEAE1D3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Terpilih: ${selectedIds.length} Mata Kuliah',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFF2B1B17)),
              ),
              Text(
                'Total SKS: $currentSks / 24 SKS',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFFC84B31)),
              ),
            ],
          ),
        ),
        const Divider(height: 1, color: Color(0xFF2B1B17), thickness: 1.5),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: dummyCourses.length,
            itemBuilder: (context, index) {
              final course = dummyCourses[index];
              final isSelected = selectedIds.contains(course.id);

              return Card(
                elevation: 0,
                margin: const EdgeInsets.only(bottom: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: isSelected ? const Color(0xFFC84B31) : const Color(0xFF2B1B17).withOpacity(0.3),
                    width: isSelected ? 2 : 1,
                  ),
                ),
                color: isSelected ? const Color(0xFFFFFDF7) : const Color(0xFFEAE1D3),
                child: CheckboxListTile(
                  value: isSelected,
                  activeColor: const Color(0xFFC84B31),
                  onChanged: (_) => onToggle(course.id),
                  title: Text(
                    course.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: isSelected ? const Color(0xFFC84B31) : const Color(0xFF2B1B17),
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      '${course.day}, ${course.time} • ${course.room}\nDosen: ${course.lecturer}',
                      style: TextStyle(fontSize: 11, color: const Color(0xFF2B1B17).withOpacity(0.7)),
                    ),
                  ),
                  secondary: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4A5D23),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '${course.sks} SKS',
                      style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}