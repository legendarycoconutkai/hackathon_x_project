
import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

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
                      
            const SizedBox(height: 120.0),

            // Profile picture and username
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.grey[300],
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'User Name',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),

            // Menu items
            Row(
              children: [
                const SizedBox(width: 110.0),

                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMenuItem(context, 'Statistics', Icons.bar_chart, const StatisticsPage()),

                      const SizedBox(height: 20,),

                      _buildMenuItem(context, 'Photos', Icons.photo, const PhotosPage()),

                      const SizedBox(height: 20,),

                      _buildMenuItem(context, 'Profile', Icons.person, const ProfilePage()),

                      const SizedBox(height: 20,),
                      
                      _buildMenuItem(context, 'AI', Icons.smart_toy, const AIPage()),
                    ],
                  ),
              ],
            ),
            
            

            const SizedBox(height: 100,),

            // Bottom items
            TextButton(
              onPressed: () {
                // Log out action
              },
              child: const Text(
                'Log Out',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                // Settings action
              },
              child: const Text(
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
  Widget _buildMenuItem(BuildContext context, String title, IconData icon, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.black,),
            const SizedBox(width: 20.0),
            Text(
              title,
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}

// Statistics Page
class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Statistics"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child:
          Column(
            children: [
              const SizedBox(height: 20,),
          
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  width: 400,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10), 
                  ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Mood flow'),
                    const SizedBox(height: 10),
                    Container(
                      width: 340,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10), 
                      ),
                    )
                  ],
                ),
              ),
          
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  width: 400,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10), 
                  ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Best & Worst'),
                    const SizedBox(height: 10),
                    Text('What makes you feel good',
                      style: TextStyle(
                        fontSize: 12, 
                        fontStyle: FontStyle.italic,
                        color: Colors.green[500]),),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10), 
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 7),
                              Row(
                                children: [
                                  SizedBox(width: 10),
                                  Text(
                                    '1', 
                                    style: TextStyle(
                                      fontSize: 16, 
                                      fontWeight: FontWeight.bold),),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 32),
                                  CircleAvatar(
                                    radius: 20.0,
                                    backgroundColor: Colors.grey,
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  SizedBox(width: 27),
                                  Text('Makan2'),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  SizedBox(width: 40),
                                  Text('x12'),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          width: 100,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10), 
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 7),
                              Row(
                                children: [
                                  SizedBox(width: 10),
                                  Text(
                                    '2', 
                                    style: TextStyle(
                                      fontSize: 16, 
                                      fontWeight: FontWeight.bold),),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 32),
                                  CircleAvatar(
                                    radius: 20.0,
                                    backgroundColor: Colors.grey,
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  SizedBox(width: 27),
                                  Text('Milk tea'),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  SizedBox(width: 43),
                                  Text('x9'),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          width: 100,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10), 
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 7),
                              Row(
                                children: [
                                  SizedBox(width: 10),
                                  Text(
                                    '3', 
                                    style: TextStyle(
                                      fontSize: 16, 
                                      fontWeight: FontWeight.bold),),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 32),
                                  CircleAvatar(
                                    radius: 20.0,
                                    backgroundColor: Colors.grey,
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  SizedBox(width: 32),
                                  Text('Movie'),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  SizedBox(width: 45),
                                  Text('x3'),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text('What makes you feel down',
                      style: TextStyle(
                        fontSize: 12, 
                        fontStyle: FontStyle.italic,
                        color: Colors.red[500]),),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10), 
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 7),
                              Row(
                                children: [
                                  SizedBox(width: 10),
                                  Text(
                                    '1', 
                                    style: TextStyle(
                                      fontSize: 16, 
                                      fontWeight: FontWeight.bold),),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 32),
                                  CircleAvatar(
                                    radius: 20.0,
                                    backgroundColor: Colors.grey,
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  SizedBox(width: 34),
                                  Text('Study'),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  SizedBox(width: 40),
                                  Text('x10'),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          width: 100,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10), 
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 7),
                              Row(
                                children: [
                                  SizedBox(width: 10),
                                  Text(
                                    '2', 
                                    style: TextStyle(
                                      fontSize: 16, 
                                      fontWeight: FontWeight.bold),),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 32),
                                  CircleAvatar(
                                    radius: 20.0,
                                    backgroundColor: Colors.grey,
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  SizedBox(width: 34),
                                  Text('Exam'),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  SizedBox(width: 43),
                                  Text('x7'),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          width: 100,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10), 
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 7),
                              Row(
                                children: [
                                  SizedBox(width: 10),
                                  Text(
                                    '3', 
                                    style: TextStyle(
                                      fontSize: 16, 
                                      fontWeight: FontWeight.bold),),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 32),
                                  CircleAvatar(
                                    radius: 20.0,
                                    backgroundColor: Colors.grey,
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  SizedBox(width: 15),
                                  Text('Assignment'),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  SizedBox(width: 45),
                                  Text('x4'),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
          
                  ],
                ),
              ),
          
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  width: 400,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10), 
                  ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    const Text('Favourite Tools'),
                    const SizedBox(height: 10,),
                    Container(
                      width: 340,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,                        
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5,),
                          const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey,
                          ),
                          const SizedBox(width: 10,),

                          const Text('xxxx'),
                          
                          const SizedBox(width: 220,),

                          Icon(Icons.arrow_upward_rounded, color: Colors.amber[700],),
                        ],
                      ),
                    ),
                    Container(
                      width: 340,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,                        
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5,),
                          const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey,
                          ),
                          const SizedBox(width: 10,),

                          const Text('xxxx'),
                          
                          const SizedBox(width: 220,),

                          Icon(Icons.arrow_upward_rounded, color: Colors.amber[700],),
                        ],
                      ),
                    ),
                    Container(
                      width: 340,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,                        
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5,),
                          const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey,
                          ),
                          const SizedBox(width: 10,),

                          const Text('xxxx'),
                          
                          const SizedBox(width: 220,),

                          Icon(Icons.arrow_upward_rounded, color: Colors.amber[700],),
                        ],
                      ),
                    )

                  ],
                ),
              )
              ],
            ),
      ),
      
      );
    
  }
}

// Photos Page
class PhotosPage extends StatelessWidget {
  const PhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photos"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text('    Oct 2024', 
            style:TextStyle(fontSize: 16,fontStyle: FontStyle.italic, color: Colors.grey) ,),
            Row(
              children: [
              Image.asset('assets/milktea.jpg', width: 100, height: 80,),
              Image.asset('assets/sad.jpg', width: 100, height: 80,), 
              Image.asset('assets/nostudy.jpeg', width: 100, height: 80,),] 
            ),
          ],
        ),
      ),
    );
  }
}

// Profile Page
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
          margin: const EdgeInsets.all(20),
          width: 400,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10), 
            ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Profile Picture'),
                  CircleAvatar(
                    radius: 40.0,
                    backgroundColor: Colors.white,
                  )
                ],
              ),
              
              const SizedBox(height: 20),
              Container(
                width: 340,
                height: 1,
                color: Colors.grey[400],
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Username'),
                  Text('User Name')
                ],
              ),
              const SizedBox(height: 20),

              Container(
                width: 340,
                height: 1,
                color: Colors.grey[400],
              ),

              const SizedBox(height: 20),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Email'),
                  Text('Email'),
            ],
        ),
             const SizedBox(height: 20),

             Container(
                width: 340,
                height: 1,
                color: Colors.grey[400],
              ),

              const SizedBox(height: 20),

             const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Phone Number'),
                  Text('Phone Number'),
            ],
        ),
              const SizedBox(height: 20),

              Container(
                width: 340,
                height: 1,
                color: Colors.grey[400],
              ),

              const SizedBox(height: 20),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Password'),
                  Text('********'),
              ],
              
            ),
            ],
          )
          ),
        ),
      ),
    );
  }
}


// AI Page
class AIPage extends StatelessWidget {
  const AIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              width: 400,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10), 
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Name your AI  '),
                      Icon(Icons.edit, size: 12,color: Colors.grey[400],),
                    ],
                  ),
                  const SizedBox(height: 10),

                  const CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.white,
                  ),

                  const SizedBox(height: 10),
                  const Text('Language'),
                  const SizedBox(height: 8),
                  Text('English', style: TextStyle(color: Colors.blueAccent[700],fontStyle: FontStyle.italic),),
                  

                  const SizedBox(height: 10),
                  const Text('Tone'),
                  const SizedBox(height: 8),
                  Text('Caring & Lovely', style: TextStyle(color: Colors.blueAccent[700],fontStyle: FontStyle.italic),),

                  const SizedBox(height: 10),
                  const Text('Description'),
                  const SizedBox(height: 8),
                  Text(' a friend that feels casual, authentic, and relatable. Instead of rushing to give advice, it mirrors the frustration or feelings shared, showing understanding without being preachy. ', 
                  style: TextStyle(color: Colors.blueAccent[700],fontStyle: FontStyle.italic)),

                  const SizedBox(height: 10),

                  Container(
                    width: 60,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.black54,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10), 
                    ),
                    child: const Center(
                      child: Text('default',
                      
                      style: TextStyle(color: Colors.black54),),
                    ),
                  )          


                ],
              ),
            ),
            
             Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              width: 400,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10), 
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Name your AI  '),
                      Icon(Icons.edit, size: 12,color: Colors.grey[400],),
                    ],
                  ),
                  const SizedBox(height: 10),

                  const CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.white,
                  ),

                  const SizedBox(height: 10),

                  const Text('Language'),

                  const SizedBox(height: 8),
                  Text('English', style: TextStyle(color: Colors.blueAccent[700],fontStyle: FontStyle.italic),),
                  

                  const SizedBox(height: 10),

                  const Text('Tone'),

                  const SizedBox(height: 8),
                  Text('Caring & Lovely', style: TextStyle(color: Colors.blueAccent[700],fontStyle: FontStyle.italic),),

                  const SizedBox(height: 10),

                  const Text('Description'),
                  const SizedBox(height: 8),
                  Text('A wise friend who listens deeply and offers thoughtful insights, helping you find clarity and peace.', 
                  style: TextStyle(color: Colors.blueAccent[700],fontStyle: FontStyle.italic)),

          ],
        ),
      )
          ]
    ));
  }
}
