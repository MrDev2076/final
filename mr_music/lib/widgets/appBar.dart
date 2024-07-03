import 'package:flutter/material.dart';

class CoustomAppBar extends StatelessWidget implements PreferredSizeWidget{

  final String title;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final VoidCallback onNotificationTap;
  final VoidCallback onLoginTap;

  const CoustomAppBar({
    required this.title,
    required this.scaffoldKey,
    required this.onNotificationTap,
    required this.onLoginTap,
});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(60),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: AppBar(
          title: Text(
            title, textAlign: TextAlign.center,
          ),
      
          backgroundColor: Colors.black,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          leading: IconButton(
            icon: Icon(Icons.menu_rounded,
            color: Colors.green.shade900,
            ),
            onPressed: (){
              scaffoldKey.currentState?.openDrawer();
            },
          ),
          actions: <Widget> [
            IconButton(onPressed: onNotificationTap, icon: Icon(Icons.message_rounded, color: Colors.red,)),
            TextButton(onPressed: onLoginTap,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent
                ),
                child: Text('Login',
                  style: TextStyle(
                    color: Colors.white
                  ),
            ))
          ]
      
        ),
      ),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}

