import 'package:flutter/material.dart';

class CreateTaskPage extends StatefulWidget {
  @override
  _CreateTaskPageState createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  String _startTime = "08:00 AM"; // Nilai default waktu mulai
  String _endTime = "11:59 PM";  // Nilai default waktu selesai
  String selectedCategory = "Tugas Kuliah"; // Default kategori yang dipilih

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buat Tugas Baru"),
        backgroundColor: Colors.purple[700],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Field Input untuk Judul
            TextField(
              decoration: InputDecoration(
                labelText: "Judul",
                labelStyle: TextStyle(color: Colors.grey[700]),
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Field Input untuk Tanggal
            TextField(
              decoration: InputDecoration(
                labelText: "Tanggal",
                labelStyle: TextStyle(color: Colors.grey[700]),
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),

            // Waktu Mulai dan Hingga
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mulai jam",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      DropdownButton<String>(
                        value: _startTime,
                        items: [
                          "08:00 AM",
                          "09:00 AM",
                          "10:00 AM",
                          "11:00 AM",
                        ]
                            .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _startTime = value!; // Perbarui nilai waktu mulai
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hingga jam",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      DropdownButton<String>(
                        value: _endTime,
                        items: [
                          "10:00 PM",
                          "11:59 PM",
                          "12:00 AM",
                        ]
                            .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _endTime = value!; // Perbarui nilai waktu selesai
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),

            // Field Input untuk Deskripsi
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: "Deskripsi",
                labelStyle: TextStyle(color: Colors.grey[700]),
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),

            // Kategori
            Text(
              "Kategori",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8.0, // Jarak horizontal antar kategori
              runSpacing: 8.0, // Jarak vertikal antar kategori
              children: [
                _buildCategoryChip("Tugas Kuliah"),
                _buildCategoryChip("Projek"),
                _buildCategoryChip("Jalan-jalan"),
                _buildCategoryChip("Pekerjaan kantor"),
                _buildCategoryChip("Freelance project"),
                _buildCategoryChip("Catatan"),
              ],
            ),
            SizedBox(height: 24),

            // Tombol Buat Tugas
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Optional: Tambahkan fungsi untuk menyimpan data tugas jika diperlukan
                  Navigator.pushReplacementNamed(context, '/schedule_list');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[700],
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Text(
                  "Buat Tugas",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk kategori
  Widget _buildCategoryChip(String category) {
    return ChoiceChip(
      label: Text(category),
      selected: selectedCategory == category,
      onSelected: (bool selected) {
        setState(() {
          selectedCategory = category;
        });
      },
      selectedColor: Colors.purple[700],
      backgroundColor: Colors.grey[200],
      labelStyle: TextStyle(
        color: selectedCategory == category ? Colors.white : Colors.black,
      ),
    );
  }
}
