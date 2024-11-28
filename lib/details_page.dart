import 'package:flutter/material.dart';
import 'homepage.dart';

// Trang chi tiết (DetailsPage)
class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Details Page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey[200],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Phần hiển thị trạng thái tai nghe
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BatteryIndicator(
                          icon: Icons.headphones, label: "L", percentage: 100),
                      BatteryIndicator(
                          icon: Icons.headphones, label: "R", percentage: 100),
                      BatteryIndicator(
                          icon: Icons.battery_unknown,
                          label: "C",
                          percentage: null),
                    ],
                  ),
                  SizedBox(height: 16),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InfoCard(
                        icon: Icons.map,
                        title: "Find headphones",
                        description: "Locate your headphones on map.",
                      ),
                      InfoCard(
                        icon: Icons.videogame_asset,
                        title: "Game mode",
                        description: "Enable or disable low-latency mode.",
                        isToggle: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Các cài đặt bổ sung
            SettingOption(icon: Icons.equalizer, title: "EQ Setting"),
            SettingOption(icon: Icons.settings, title: "Key Setting"),
            SettingOption(icon: Icons.edit, title: "Change Name"),
            SettingOption(icon: Icons.system_update_alt, title: "OTA Upgrade"),
          ],
        ),
      ),
    );
  }
}

// Widget BatteryIndicator hiển thị trạng thái pin của tai nghe
class BatteryIndicator extends StatelessWidget {
  final IconData icon;
  final String label;
  final int? percentage;

  BatteryIndicator({
    required this.icon,
    required this.label,
    this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 48),
        SizedBox(height: 8),
        Text("$label",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Text(
          percentage != null ? "$percentage%" : "-",
          style: TextStyle(fontSize: 14, color: Colors.blue),
        ),
      ],
    );
  }
}

// Widget InfoCard hiển thị thông tin các tính năng phụ
class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool isToggle;

  InfoCard({
    required this.icon,
    required this.title,
    required this.description,
    this.isToggle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, size: 32, color: Colors.blue),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            if (!isToggle) const SizedBox(height: 4),
            if (!isToggle)
              Text(
                description,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            if (isToggle)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("ON", style: TextStyle(fontSize: 14)),
                  Switch(value: false, onChanged: (value) {}),
                  const Text("OFF", style: TextStyle(fontSize: 14)),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

// Widget SettingOption hiển thị các tùy chọn cài đặt
class SettingOption extends StatelessWidget {
  final IconData icon;
  final String title;

  SettingOption({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Thêm logic khi người dùng nhấn vào từng cài đặt
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Tapped on $title"),
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, size: 24, color: Colors.blue),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
