import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EQSettingsPage()),
            );
          },
          child: const Text('Go to EQ Settings'),
        ),
      ),
    );
  }
}

Widget _buildPresetsHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset('assets/images/2ear.png', width: 150, height: 150),
    ],
  );
}

class EQSettingsPage extends StatefulWidget {
  const EQSettingsPage({super.key});

  @override
  _EQSettingsPageState createState() => _EQSettingsPageState();
}

class _EQSettingsPageState extends State<EQSettingsPage> {
  int selectedTabIndex = 0;
  Map<String, List<double>> presets = {
    "Default": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    "Popular": [3, 3, 2, 0, 0, -2, -3, 2, 4, 5],
    "Dance": [5, 4, 3, 2, 1, 0, -1, -2, -3, -4],
    "Classical": [0, -2, -3, -2, 0, 2, 3, 4, 5, 5],
    "Jazz": [2, 3, 4, 2, 1, 0, -1, -2, -2, 0],
    "Slow Song": [-2, -2, -1, 0, 1, 2, 2, 3, 3, 3],
  };
  List<double> customValues = List.filled(10, 0);
  String selectedCustom = "Custom 1";
  TextEditingController customNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EQ Settings')),
      body: Column(
        children: [
          _buildPresetsHeader(),
          SizedBox(
            height: 30,
          ),
          // Tab Navigation
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTabButton("Preset", 0),
              _buildTabButton("Customize", 1),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: selectedTabIndex == 0
                ? _buildPresetView()
                : _buildCustomizeView(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTabIndex = index;
        });
      },
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: selectedTabIndex == index ? Colors.blue : Colors.black,
            ),
          ),
          if (selectedTabIndex == index)
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }

  String? _selectedPreset;

  Widget _buildPresetView() {
    return Column(
      children: [
        Wrap(
          direction: Axis.horizontal,
          spacing: 8,
          runSpacing: 8,
          children: [
            Row(
              children: presets.keys.take(3).map((preset) {
                return Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedPreset = preset;
                        customValues = presets[preset]!;
                      });
                    },
                    child: Text(
                      preset,
                      style: TextStyle(
                        color: _selectedPreset == preset
                            ? const Color.fromARGB(255, 116, 115, 227)
                            : const Color.fromARGB(95, 16, 16, 16),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            Row(
              children: presets.keys.skip(3).map((preset) {
                return Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedPreset = preset;
                        customValues = presets[preset]!;
                      });
                    },
                    child: Text(
                      preset,
                      style: TextStyle(
                        color: _selectedPreset == preset
                            ? const Color.fromARGB(255, 116, 115, 227)
                            : const Color.fromARGB(95, 16, 16, 16),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        _buildSliders(customValues),
      ],
    );
  }

  Widget _buildCustomizeView() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: selectedCustom,
              items: ["Custom 1", "Custom 2"]
                  .map((name) =>
                      DropdownMenuItem(value: name, child: Text(name)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCustom = value!;
                  if (value == "Custom 2") {
                    customValues = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
                  } else {
                    customValues = presets[value]!;
                  }
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                customNameController.text = selectedCustom;
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Rename Custom"),
                      content: TextField(
                        controller: customNameController,
                        decoration:
                            const InputDecoration(hintText: "Enter new name"),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              selectedCustom = customNameController.text;
                            });
                            Navigator.pop(context);
                          },
                          child: const Text("Save"),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
        _buildSliders(customValues),
      ],
    );
  }

  Widget _buildSliders(List<double> values) {
    return Expanded(
      child: Row(
        children: [
          // Trục tung bên trái
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: SizedBox(
              height: 279,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('10dB'),
                  Text('5dB'),
                  Text('0dB'),
                  Text('-5dB'),
                  Text('-10dB'),
                ],
              ),
            ),
          ),
          // Phần Sliders
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                values.length,
                (index) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        RotatedBox(
                          quarterTurns: 3,
                          child: SizedBox(
                            width: 279,
                            child: SliderTheme(
                              data: SliderThemeData(
                                trackHeight: 22,
                                activeTrackColor:
                                    const Color.fromARGB(255, 110, 127, 226),
                                inactiveTrackColor: Colors.white,
                                thumbColor:
                                    const Color.fromARGB(255, 162, 160, 160),
                                overlayColor:
                                    const Color.fromARGB(0, 5, 202, 94),
                                thumbShape: SliderComponentShape.noThumb,
                                overlayShape: SliderComponentShape.noOverlay,
                                showValueIndicator: ShowValueIndicator.never,
                                tickMarkShape: SliderTickMarkShape.noTickMark,
                              ),
                              child: Slider(
                                value: values[index],
                                min: -10,
                                max: 10,
                                // divisions: 4,
                                label: values[index].toString(),
                                onChanged: (value) {
                                  setState(() {
                                    values[index] = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        // Nút vuông màu trắng thể hiện giá trị
                        // Positioned(
                        //   left: ((values[index] + 10) / 20 * 279) -
                        //       11, // Tính toán vị trí dựa trên giá trị
                        //   child: Container(
                        //     width: 22,
                        //     height: 22,
                        //     decoration: BoxDecoration(
                        //       color: const Color.fromARGB(255, 212, 39, 39),
                        //       border: Border.all(
                        //         color: const Color.fromARGB(255, 71, 92, 199),
                        //         width: 2,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    Text("${32 * (index + 1)}k"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
