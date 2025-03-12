import 'package:flutter/material.dart';

class CVScreen extends StatelessWidget {
  const CVScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Ảnh đại diện
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                  'assets/avt.jpg',
                ), // Thêm ảnh vào assets
              ),
              SizedBox(height: 12),

              // Họ tên
              Text(
                "Nguyễn Kiều My",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              // Tuổi
              Text(
                "Tuổi: 21",
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),

              // Sinh viên
              Text(
                "Sinh viên ngành Hệ thống thông tin",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 20),

              // Học vấn
              _sectionTitle("Học vấn"),
              _experienceItem(
                "Cử nhân Hệ thống thông tin",
                "Đại học CNTT",
                "2021 - 2025",
              ),
              SizedBox(height: 20),

              // Kỹ năng
              _sectionTitle("Kỹ năng"),
              _skillItem("Flutter & Dart"),
              _skillItem("ReactJS & NodeJS"),
              _skillItem("SQL Server"),
              _skillItem("REST API"),
              _skillItem("UI/UX Design"),
              SizedBox(height: 20),

              // Sở thích
              _sectionTitle("Sở thích"),
              _interestItem("Đọc sách 📚"),
              _interestItem("Chơi game 🎮"),
              _interestItem("Nghe nhạc 🎵"),
              _interestItem("Du lịch ✈️"),
              _interestItem("Chụp ảnh 📸"),
            ],
          ),
        ),
      ),
    );
  }

  // Widget tiêu đề từng phần
  Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  // Widget hiển thị học vấn hoặc kinh nghiệm
  Widget _experienceItem(String title, String institution, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            institution,
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),
          Text(time, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
        ],
      ),
    );
  }

  // Widget hiển thị kỹ năng
  Widget _skillItem(String skill) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        skill,
        style: TextStyle(fontSize: 14, color: Colors.blue[800]),
      ),
    );
  }

  // Widget hiển thị sở thích
  Widget _interestItem(String interest) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        interest,
        style: TextStyle(fontSize: 14, color: Colors.green[800]),
      ),
    );
  }
}
