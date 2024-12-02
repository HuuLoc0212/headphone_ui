import 'package:flutter/material.dart';
import 'package:headphone_ui/screens/details_page.dart';
import 'package:headphone_ui/widgets/part.dart';

class DeviceWidget extends StatelessWidget {
  const DeviceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsPage()),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(26.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
          // PartWidget(),
          // PartWidget(),
        ]),
      ),
    );
  }
}
