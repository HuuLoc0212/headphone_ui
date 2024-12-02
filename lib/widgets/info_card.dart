// Widget InfoCard hiển thị thông tin các tính năng phụ
import 'package:flutter/material.dart';

class InfoCard extends StatefulWidget {
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
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(widget.icon, size: 32, color: Colors.blue),
            const SizedBox(height: 8),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            if (!widget.isToggle) const SizedBox(height: 4),
            if (!widget.isToggle)
              Text(
                widget.description,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            if (widget.isToggle)
              InkWell(
                onTap: () {
                  setState(() {
                    isOn = !isOn;
                  });
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: isOn ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    isOn ? "ON" : "OFF",
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}