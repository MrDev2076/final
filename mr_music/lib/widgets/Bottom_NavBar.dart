import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {

  final int currentIndex;
  final ValueChanged<int> onTap;
  
  const CustomBottomNavBar({
    required this.currentIndex,
    required this.onTap
});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.redAccent,
        currentIndex: currentIndex,
        onTap: onTap,
        selectedItemColor: Colors.indigo.shade900,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items:
    [
      BottomNavigationBarItem(icon: Icon(Icons.home,
      color: currentIndex ==0 ? Colors.green.shade900 : Colors.black,
      ),
      label: "Home"
      ),

      BottomNavigationBarItem(icon: Icon(
        Icons.my_library_music,
        color: currentIndex == 1 ? Colors.greenAccent.shade700 : Colors.black,
      ),
      label: "MyPlaylist"),

      BottomNavigationBarItem(icon: Icon(

        Icons.favorite_outline,
        color: currentIndex == 2 ? Colors.redAccent : Colors.black,
      ),
          label: "MyFav"),

      BottomNavigationBarItem(icon: Icon(
        Icons.cable,
        color: currentIndex == 3 ? Colors.blueAccent : Colors.black,
      ),
          label: "Connect"),

    ]
    );
  }
}

