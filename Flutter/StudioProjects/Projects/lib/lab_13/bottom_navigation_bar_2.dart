// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class BottomNavigationBar2 extends StatefulWidget {
//   BottomNavigationBar2({super.key});
//
//
//   @override
//   State<BottomNavigationBar2> createState() => _BottomNavigationBar2State();
// }
//
// class _BottomNavigationBar2State extends State<BottomNavigationBar2> {
//
//   int currentIndex=0;
//   List<Widget> items=[
//     Container(
//       height: 300,
//       width: 300,
//       child: Center(child: Text('Home')),
//       color: Colors.indigo,
//     ),
//     Container(
//       height: 300,
//       width: 300,
//       child: Center(child: Text('About')),
//       color: Colors.blue,
//     ),
//     Container(
//       height: 300,
//       width: 300,
//       child: Center(child: Text('Person')),
//       color: Colors.indigo,
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: currentIndex,
//           onTap: (value){
//             setState(() {
//               currentIndex=value;
//             });
//           },
//           items: [
//             BottomNavigationBarItem(icon: Icon(CupertinoIcons.home),label: 'home'),
//             BottomNavigationBarItem(icon: Icon(Icons.account_box_outlined),label: 'about'),
//             BottomNavigationBarItem(icon: Icon(CupertinoIcons.person),label: 'person'),
//           ]),
//
//       body: items[currentIndex],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavScreen(),
    );
  }
}

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Selected Page: $_selectedIndex',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomPaint(
            painter: BottomNavPainter(),
            child: Container(
              height: 80,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 0),
              _buildNavItem(Icons.search, 1),
              SizedBox(width: 60), // Space for the central button
              _buildNavItem(Icons.favorite_border, 2),
              _buildNavItem(Icons.person, 3),
            ],
          ),
          Center(
            heightFactor: 0.6,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.4),
                    blurRadius: 20,
                    spreadRadius: 2,
                    offset: Offset(0, 10),
                  ),
                ],
                border: Border.all(
                  color: Colors.white.withOpacity(0.5),
                  width: 4,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Colors.purple,
                  size: 35,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.purple : Colors.grey,
              size: 30,
            ),
            if (isSelected)
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Opacity(
                    opacity: _animation.value,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purple.withOpacity(0.5),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

class BottomNavPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10);

    Path path = Path();
    path.moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 20);
    path.quadraticBezierTo(size.width * 0.40, 30, size.width * 0.45, 30);
    path.arcToPoint(Offset(size.width * 0.55, 30),
        radius: Radius.circular(30), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 30, size.width * 0.65, 20);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black.withOpacity(0.2), 10, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
