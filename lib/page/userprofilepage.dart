import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                      
            SizedBox(height: 120.0),

            // Profile picture and username
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.grey[300],
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'User Name',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.0),

            // Menu items
            Row(
              children: [
                SizedBox(width: 110.0),

                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMenuItem('Statistics', Icons.bar_chart),

                      SizedBox(height: 20,),

                      _buildMenuItem('Photos', Icons.photo),

                      SizedBox(height: 20,),

                      _buildMenuItem('Profile', Icons.person),

                      SizedBox(height: 20,),
                      
                      _buildMenuItem('AI', Icons.smart_toy),
                    ],
                  ),
              ],
            ),
            
            

            SizedBox(height: 100,),

            // Bottom items
            TextButton(
              onPressed: () {
                // Log out action
              },
              child: Text(
                'Log Out',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                // Settings action
              },
              child: Text(
                'Settings',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for each menu item
  Widget _buildMenuItem(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        
        children: [          
          Icon(icon, color: Colors.black),
          SizedBox(width: 20.0),
          Text(
            title,
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
