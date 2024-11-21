import 'package:flutter/material.dart';

class ScheduleListPage extends StatefulWidget {
  @override
  _ScheduleListPageState createState() => _ScheduleListPageState();
}

class _ScheduleListPageState extends State<ScheduleListPage> {
  DateTime selectedDate = DateTime.now(); // Tanggal yang dipilih

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Jadwal"),
        backgroundColor: Colors.blue[700],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Header Bulan & Tahun
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${_getMonthName(selectedDate.month)}, ${selectedDate.year}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/create_task');
                  },
                  icon: Icon(Icons.add, size: 18, color: Colors.white,),
                  label: Text("Tugas.",
                  style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[500],
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Horizontal Scroll untuk Tanggal
            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 30, // Contoh: 30 hari dalam sebulan
                itemBuilder: (context, index) {
                  DateTime date = DateTime(
                    selectedDate.year,
                    selectedDate.month,
                    index + 1,
                  );
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDate = date;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8),
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        color: date.day == selectedDate.day
                            ? Colors.blue[700]
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${date.day}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: date.day == selectedDate.day
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            _getDayName(date.weekday),
                            style: TextStyle(
                              fontSize: 12,
                              color: date.day == selectedDate.day
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 24),

            // Daftar Tugas
            Text(
              "Daftar Tugas",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            SizedBox(height: 16),

            Expanded(
              child: ListView(
                children: <Widget>[
                  TaskCard(
                    title: "UTS Mobile Programming",
                    subtitle: "10:00 - 14:00",
                    icon: Icons.code,
                  ),
                  TaskCard(
                    title: "Ngerjakan Tugas",
                    subtitle: "12:00",
                    icon: Icons.edit,
                  ),
                  // Tambahkan lebih banyak tugas di sini
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Indeks untuk halaman saat ini (Jadwal)
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/dashboard'); // Navigasi ke Home
          } else if (index == 1) {
            // Tetap di halaman Jadwal
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
        type: BottomNavigationBarType.fixed, // Menjamin semua ikon terlihat
      ),
    );
  }

  // Fungsi untuk mendapatkan nama bulan
  String _getMonthName(int month) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "Mei",
      "Jun",
      "Jul",
      "Agu",
      "Sep",
      "Okt",
      "Nov",
      "Des"
    ];
    return months[month - 1];
  }

  // Fungsi untuk mendapatkan nama hari
  String _getDayName(int weekday) {
    const days = ["Min", "Sen", "Sel", "Rab", "Kam", "Jum", "Sab"];
    return days[weekday - 1];
  }
}

// Widget untuk kartu tugas
class TaskCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const TaskCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Icon(icon, color: Colors.blue[700]),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }
}
