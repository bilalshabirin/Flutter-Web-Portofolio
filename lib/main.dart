import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyDigitalIdentityApp());
}

class MyDigitalIdentityApp extends StatelessWidget {
  const MyDigitalIdentityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digital Identity App',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121421),
        fontFamily: 'Roboto',
      ),
      home: const DigitalIdentityPage(),
    );
  }
}

class DigitalIdentityPage extends StatelessWidget {
  const DigitalIdentityPage({super.key});

  @override
  Widget build(BuildContext context) {
    // LayoutBuilder digunakan untuk mengecek apakah layar sedang mode Desktop atau Mobile
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white70),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white70),
            onPressed: () {},
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Jika lebar layar lebih dari 800px, anggap sebagai Web/Desktop
          bool isDesktop = constraints.maxWidth > 800;
          
          return Center(
            child: ConstrainedBox(
              // Lebar maksimal untuk Web diset 800, untuk HP otomatis penuh
              constraints: BoxConstraints(maxWidth: isDesktop ? 800 : 450),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 40.0 : 24.0, 
                  vertical: 20.0
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildProfileSection(isDesktop),
                    const SizedBox(height: 40),
                    _buildSectionTitle('Skills', isDesktop),
                    const SizedBox(height: 16),
                    _buildSkillsWrap(isDesktop),
                    const SizedBox(height: 32),
                    _buildSectionTitle('Contact', isDesktop),
                    const SizedBox(height: 16),
                    _buildContactRow(isDesktop),
                    const SizedBox(height: 32),
                    _buildSectionTitle('About Me', isDesktop),
                    const SizedBox(height: 16),
                    _buildVideoSlot(),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Perjalanan belajar & project pilihan saya.',
                        style: TextStyle(
                          color: Colors.white54, 
                          fontSize: isDesktop ? 14 : 12
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileSection(bool isDesktop) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFF5A72A0), Color(0xFF1E212D)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent.withValues(alpha: 0.2),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: CircleAvatar(
            radius: isDesktop ? 70 : 50, // Avatar lebih besar di Web
            backgroundImage: const AssetImage('assets/images/20250504_171743.jpg'),
            backgroundColor: Colors.transparent,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Raka Pratama',
          style: TextStyle(
            fontSize: isDesktop ? 32 : 24, // Font lebih besar di Web
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'NIM 2511095',
          style: TextStyle(
            fontSize: isDesktop ? 16 : 14,
            color: Colors.white54,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF2A2E43),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.school, size: isDesktop ? 20 : 16, color: const Color(0xFF8B9BB4)),
              const SizedBox(width: 8),
              Text(
                'Teknik Informatika',
                style: TextStyle(
                  color: const Color(0xFF8B9BB4),
                  fontWeight: FontWeight.w500,
                  fontSize: isDesktop ? 16 : 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSkillsWrap(bool isDesktop) {
    final skills = ['JavaScript', 'React', 'Tailwind CSS', 'UI/UX', 'Node.js', 'Git', 'Figma'];
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 12.0,
        runSpacing: 12.0,
        children: skills.map((skill) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 20 : 14, 
              vertical: isDesktop ? 12 : 8
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF1E2235),
              border: Border.all(color: Colors.white12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              skill,
              style: TextStyle(
                fontSize: isDesktop ? 14 : 12, 
                color: Colors.white70
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildContactRow(bool isDesktop) {
    // Pada web, berikan jarak yang proporsional agar tidak terlalu renggang
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: isDesktop ? 400 : double.infinity),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildContactIcon(Icons.email, 'Email', isDesktop),
          _buildContactIcon(Icons.phone, 'Phone', isDesktop),
          _buildContactIcon(Icons.link, 'LinkedIn', isDesktop),
          _buildContactIcon(Icons.code, 'GitHub', isDesktop),
        ],
      ),
    );
  }

  Widget _buildContactIcon(IconData icon, String tooltip, bool isDesktop) {
    double size = isDesktop ? 60 : 50; // Ikon lebih besar di Web
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: const Color(0xFF1E2235),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white12),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white70, size: isDesktop ? 24 : 20),
        onPressed: () {},
        tooltip: tooltip,
      ),
    );
  }

  Widget _buildVideoSlot() {
    _controller = VideoPlayerController.networkUrl(
      Uri.parse('https://drive.google.com/file/d/1B9FUdQsjVJ7PogBrDVg4p6R5BA7xiDla/view?t=90.418')
    );
  }

  Widget _buildSectionTitle(String title, bool isDesktop) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white70,
          fontSize: isDesktop ? 18 : 14, // Judul section lebih besar di Web
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// --- WIDGET PEMUTAR VIDEO ---
class LocalVideoPlayer extends StatefulWidget {
  final String videoPath;

  const LocalVideoPlayer({super.key, required this.videoPath});

  @override
  State<LocalVideoPlayer> createState() => _LocalVideoPlayerState();
}

class _LocalVideoPlayerState extends State<LocalVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {}); 
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white12),
            ),
            clipBehavior: Clip.antiAlias,
            // AspectRatio menjaga proporsi video agar tidak meregang (stretch)
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  VideoPlayer(_controller),
                  IconButton(
                    icon: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause_circle_filled
                          : Icons.play_circle_filled,
                      color: Colors.white.withValues(alpha: 0.8),
                      size: 60,
                    ),
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                  ),
                ],
              ),
            ),
          )
        : Container(
            height: 250, // Tinggi default loading video
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white12),
              color: Colors.black26,
            ),
            child: const Center(
              child: CircularProgressIndicator(color: Colors.white54),
            ),
          );
  }
}