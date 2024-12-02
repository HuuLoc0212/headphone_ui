import 'package:flutter/material.dart';
import '../widgets/part.dart';
import 'eq_setting.dart';
import '../widgets/info_card.dart';
import '../widgets/setting_option.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
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
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      PartWidget(
                        partImage: Image.asset(
                          'assets/images/img1.png',
                          height: 50,
                          width: 50,
                        ),
                        batterPercent: 100,
                      ),
                      PartWidget(
                        partImage: Image.asset(
                          'assets/images/img2.png',
                          height: 50,
                          width: 50,
                        ),
                        batterPercent: 100,
                      ),
                      PartWidget(
                        partImage: Image.asset(
                          'assets/images/Groups.png',
                          height: 50,
                          width: 50,
                        ),
                        batterPercent: 100,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // const Divider(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InfoCard(
                        icon: Icons.map,
                        title: "Find headphones",
                        description: "",
                      ),
                      InfoCard(
                        icon: Icons.videogame_asset,
                        title: "Game mode",
                        description: "",
                        isToggle: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            Container(
                child: // Các cài đặt bổ sung
                    Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EQSettingsPage(),
                      ),
                    );
                  },
                  child: const SettingOption(
                    icon: Icons.equalizer,
                    title: "EQ Setting",
                  ),
                ),
                const SettingOption(icon: Icons.settings, title: "Key Setting"),
                const SettingOption(icon: Icons.edit, title: "Change Name"),
                const SettingOption(
                    icon: Icons.system_update_alt, title: "OTA Upgrade"),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
