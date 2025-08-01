import 'package:flutter/material.dart';
// hello
void main() {
  runApp(ZoneApp());
}

class ZoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zone Entry',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF101010),
        fontFamily: 'RobotoMono',
      ),
      home: ZoneSplashScreen(),
    );
  }
}

class ZoneSplashScreen extends StatefulWidget {
  @override
  State<ZoneSplashScreen> createState() => _ZoneSplashScreenState();
}

class _ZoneSplashScreenState extends State<ZoneSplashScreen> {
  bool loading = false;

  void _enterZone() async {
    setState(() {
      loading = true;
    });
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => ZoneEnteringScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HoodedLogo(),
                SizedBox(height: 48),
                Text(
                  'WE RISE IN SILENCE,\nCODE IN SHADOWS,\nLIFT WITH PURPOSE',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontFamily: 'RobotoMono',
                    letterSpacing: 1.8,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 64),
                SizedBox(
                  width: 180,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[700],
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'RobotoMono',
                      ),
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: loading ? null : _enterZone,
                    child: loading
                        ? SizedBox(
                            height: 26,
                            width: 26,
                            child: CircularProgressIndicator(
                              color: Colors.black,
                              strokeWidth: 3,
                            ),
                          )
                        : Text('Enter Zone'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ZoneEnteringScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HoodedLogo(),
                SizedBox(height: 48),
                CircularProgressIndicator(
                  color: Colors.orange[700],
                  strokeWidth: 5,
                ),
                SizedBox(height: 36),
                Text(
                  'Entering\nthe Zone...',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.orange[700],
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoMono',
                    height: 1.2,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HoodedLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This widget draws the orange hooded logo as in the image.
    return SizedBox(
      height: 140,
      width: 140,
      child: CustomPaint(
        painter: _HoodPainter(),
      ),
    );
  }
}

class _HoodPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final hoodPaint = Paint()
      ..color = Colors.orange[700]!
      ..style = PaintingStyle.fill;

    final facePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    // Draw hood (triangle with curved base)
    Path hoodPath = Path();
    hoodPath.moveTo(size.width * 0.5, size.height * 0.10);
    hoodPath.quadraticBezierTo(
        size.width * 0.88, size.height * 0.38, size.width * 0.82, size.height * 0.85);
    hoodPath.quadraticBezierTo(
        size.width * 0.5, size.height * 1.10, size.width * 0.18, size.height * 0.85);
    hoodPath.quadraticBezierTo(
        size.width * 0.12, size.height * 0.38, size.width * 0.5, size.height * 0.10);
    hoodPath.close();
    canvas.drawPath(hoodPath, hoodPaint);

    // Draw face (ellipse)
    Rect faceRect = Rect.fromCenter(
      center: Offset(size.width * 0.5, size.height * 0.56),
      width: size.width * 0.52,
      height: size.height * 0.42,
    );
    canvas.drawOval(faceRect, facePaint);

    // Eyes
    final eyePaint = Paint()..color = Colors.orange[700]!;
    Path leftEye = Path();
    leftEye.moveTo(size.width * 0.35, size.height * 0.59);
    leftEye.quadraticBezierTo(
        size.width * 0.34, size.height * 0.56, size.width * 0.43, size.height * 0.57);
    leftEye.quadraticBezierTo(
        size.width * 0.38, size.height * 0.62, size.width * 0.35, size.height * 0.59);
    leftEye.close();

    Path rightEye = Path();
    rightEye.moveTo(size.width * 0.65, size.height * 0.59);
    rightEye.quadraticBezierTo(
        size.width * 0.66, size.height * 0.56, size.width * 0.57, size.height * 0.57);
    rightEye.quadraticBezierTo(
        size.width * 0.62, size.height * 0.62, size.width * 0.65, size.height * 0.59);
    rightEye.close();

    canvas.drawPath(leftEye, eyePaint);
    canvas.drawPath(rightEye, eyePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}