import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer(); // Menampilkan menu drawer jika ada
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushNamed(context, '/profile'); // Navigasi ke halaman profil
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Salam Selamat Datang
              Text(
                "Halo, Abiyan!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              Text(
                "Semoga harimu menyenangkan! YEAY!",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 16),

              // Pilihan Tab
              Row(
                children: [
                  ChoiceChip(
                    label: Text("Tugasku"),
                    selected: true,
                  ),
                  SizedBox(width: 8),
                  ChoiceChip(
                    label: Text("Projek"),
                    selected: false,
                  ),
                  SizedBox(width: 8),
                  ChoiceChip(
                    label: Text("Catatan"),
                    selected: false,
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Jadwal Berikutnya
              Text(
                "Jadwal Berikutnya",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              SizedBox(height: 16),

              // Scroll Horizontal
              SizedBox(
                height: 200, // Tinggi area scroll
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildScheduleCard(
                      title: "Mobile Programming",
                      time: "10:00",
                      date: "17 Oktober 2024",
                      color: Colors.purple[300] ?? Colors.purple, // Tambahkan fallback default
                    ),
                    _buildScheduleCard(
                      title: "Pulau Dewata",
                      time: "06:00",
                      date: "24 Oktober 2024",
                      color: Colors.purple[200] ?? Colors.purple, // Tambahkan fallback default
                    ),
                    _buildScheduleCard(
                      title: "Meeting Kantor",
                      time: "14:00",
                      date: "20 Oktober 2024",
                      color: Colors.blue[200] ?? Colors.blue, // Tambahkan fallback default
                    ),
                    _buildScheduleCard(
                      title: "Belajar Flutter",
                      time: "19:00",
                      date: "25 Oktober 2024",
                      color: Colors.teal[300] ?? Colors.teal, // Tambahkan fallback default
                    ),

                  ],
                ),
              ),
              SizedBox(height: 24),

              // Progress (Jadwal yang Telah Berlalu)
              Text(
                "Progress",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              SizedBox(height: 16),

              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  _buildProgressCard(
                    title: "UTS Studi Islam",
                    subtitle: "2 hari yang lalu",
                  ),
                  _buildProgressCard(
                    title: "Checkout 11.11",
                    subtitle: "6 hari yang lalu",
                  ),
                  _buildProgressCard(
                    title: "Kerja Kelompok",
                    subtitle: "1 minggu yang lalu",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Indeks halaman aktif
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/dashboard'); // Navigasi ke Home
          } else if (index == 1) {
            Navigator.pushNamed(context, '/schedule_list'); // Navigasi ke Jadwal
          } else if (index == 2) {
            Navigator.pushNamed(context, '/notifications'); // Navigasi ke Notifikasi
          } else if (index == 3) {
            Navigator.pushNamed(context, '/settings'); // Navigasi ke Settings
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: "Jadwal",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notifikasi",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        selectedItemColor: Colors.black, // Warna ikon aktif
        unselectedItemColor: Colors.grey, // Warna ikon tidak aktif
        type: BottomNavigationBarType.fixed, // Pastikan semua item terlihat
      ),


    );
  }

  // Widget untuk Kartu Jadwal Berikutnya
  Widget _buildScheduleCard({
    required String title,
    required String time,
    required String date,
    required Color color,
  }) {
    return Container(
      width: 180, // Lebar kotak
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            time,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
          Text(
            date,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk Kartu Progress
  Widget _buildProgressCard({
    required String title,
    required String subtitle,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(Icons.check_circle, color: Colors.green),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }
}
