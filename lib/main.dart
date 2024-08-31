import 'package:flutter/material.dart';

void main() {
  runApp(ScrcpyGuideApp());
}

class ScrcpyGuideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrcpy Guide',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GuideScreen(),
    );
  }
}

class GuideScreen extends StatefulWidget {
  @override
  _GuideScreenState createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  int _currentStep = 0;
  List<String> steps = [
    "Install scrcpy on your Windows PC. You can download it from GitHub.",
    "Enable USB debugging on your Android device:\n- Go to Settings > About phone\n- Tap 'Build number' 7 times to enable Developer options\n- Go back to Settings > System > Developer options\n- Enable 'USB debugging'",
    "Connect your Android device to your PC using a USB cable.",
    "Open Command Prompt or PowerShell on your Windows PC.",
    "Navigate to the folder where scrcpy is installed using the 'cd' command.",
    "Type 'scrcpy' and press Enter to start mirroring.",
    "If prompted on your Android device, allow USB debugging access for your PC.",
    "Your Android screen should now be mirrored on your Windows PC!",
    "Optional: To use scrcpy wirelessly, first connect via USB and run:\nscrcpy --tcpip\nThen disconnect USB and run:\nscrcpy --wireless",
  ];

  void _goToNextStep() {
    setState(() {
      if (_currentStep < steps.length - 1) {
        _currentStep++;
      }
    });
  }

  void _goToPreviousStep() {
    setState(() {
      if (_currentStep > 0) {
        _currentStep--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrcpy Guide'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Step ${_currentStep + 1} of ${steps.length}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded(
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Text(
                      steps[_currentStep],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _currentStep > 0 ? _goToPreviousStep : null,
                  child: Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: _currentStep < steps.length - 1 ? _goToNextStep : null,
                  child: Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}