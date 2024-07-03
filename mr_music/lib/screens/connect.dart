import 'package:flutter/material.dart';

class Connect extends StatefulWidget {
  const Connect({Key? key}) : super(key: key);

  @override
  State<Connect> createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      body: Center(
        child: Container(
          width: 300, // Adjust outer container width as needed
          height: 300, // Adjust outer container height as needed
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.indigo, // Outer circle color
          ),
          child: Center(
            child: Stack(
              children: [
                Positioned(
                  top: 50, // Adjust position of middle circle
                  child: Container(
                    width: 200, // Adjust middle circle width
                    height: 200, // Adjust middle circle height
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue, // Middle circle color
                    ),
                    child: Center(
                      child: Container(
                        width: 100, // Adjust inner circle width
                        height: 150, // Adjust inner circle height
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.lightBlue, // Inner circle color
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 40,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Connect Radio',
                                style: TextStyle(
                                  color: Colors.white, // Text color
                                  fontSize: 20, // Text size
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
