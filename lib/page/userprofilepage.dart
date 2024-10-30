import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hackathon_x_project/backend/colour.dart';
import 'package:hackathon_x_project/backend/user_info.dart';
import 'package:hackathon_x_project/page/login.dart';
import 'package:hackathon_x_project/widget/consult.dart';
import 'package:image_picker/image_picker.dart';

class UserProfilePage extends StatelessWidget {
  
  UserProfilePage({super.key});

  final userInfo = UserInfo();

  @override
  Widget build(BuildContext context) {

    final String? name = userInfo.getName();
    final String? email = userInfo.getEmail();
    final String? phoneNo = userInfo.getPhoneNo();
    final String? password = userInfo.getPassword();
    final XFile? image = userInfo.getImage();
    
    return Scaffold(
      backgroundColor: background,
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
                    backgroundColor: Colors.white,
                    backgroundImage: image != null ? FileImage(File(image.path)) : null,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    name!,
                    style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),

            // Menu items
            Row(
              children: [
                const SizedBox(width: 105.0),

                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMenuItem(context, 'Statistics', Icons.bar_chart, const StatisticsPage()),

                      const SizedBox(height: 15,),

                      _buildMenuItem(context, 'Photos', Icons.photo, const PhotosPage()),

                      const SizedBox(height: 15,),

                      _buildMenuItem(context, 'Profile', Icons.person, ProfilePage(image: image, name: name, email: email, phoneNo: phoneNo, password: password)),

                      const SizedBox(height: 15,),
                      
                      _buildMenuItem(context, 'AI', Icons.smart_toy, const AIPage()),

                      const SizedBox(height: 15,),

                      _buildMenuItem(context, 'Talk To Someone', Icons.settings, const TalkPage()),
                    ],
                  ),
              ],
            ),
            
            

            const SizedBox(height: 30,),

            // Bottom items
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
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
            const SizedBox(width: 10.0),
            Text(
              title,
              style: const TextStyle(fontSize: 15.0),
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
        backgroundColor: background,
      ),
      body: SingleChildScrollView(
        child:
          Column(
            children: [
              const SizedBox(height: 20,),
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
                    const Text('Mood flow', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    
                    Container(
                      width: 340,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(image: AssetImage('assets/images/moodflow.jpg'), 
                        fit: BoxFit.cover),
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
                    const Text('Best & Worst', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),

                    Text('What makes you feel good',
                      style: TextStyle(
                        fontSize: 12, 
                        fontStyle: FontStyle.italic,
                        color: Colors.green[500]),),
                    const SizedBox(height: 10),
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
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage('assets/images/food.png'),

                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  SizedBox(width: 27),
                                  Text('Makan2',
                                  style: TextStyle(fontSize: 12)),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  SizedBox(width: 40),
                                  Text('x12',
                                  style: TextStyle(fontSize: 12)),
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
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage('assets/images/drinks.png'),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  SizedBox(width: 27),
                                  Text('Milk tea',
                                  style: TextStyle(fontSize: 12)),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  SizedBox(width: 43),
                                  Text('x9',
                                  style: TextStyle(fontSize: 12)),
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
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage('assets/images/movie.png'),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  SizedBox(width: 32),
                                  Text('Movie',
                                  style: TextStyle(fontSize: 12)),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  SizedBox(width: 45),
                                  Text('x3',
                                  style: TextStyle(fontSize: 12)),
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
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage('assets/images/study.png'),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  SizedBox(width: 34),
                                  Text('Study',
                                  style: TextStyle(fontSize: 12)),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  SizedBox(width: 40),
                                  Text('x10',
                                  style: TextStyle(fontSize: 12)),
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
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage('assets/images/exampaper.png'),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  SizedBox(width: 34),
                                  Text('Exam',
                                  style: TextStyle(fontSize: 12)),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  SizedBox(width: 43),
                                  Text('x7',
                                  style: TextStyle(fontSize: 12)),
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
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage('assets/images/research.png'),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  SizedBox(width: 15),
                                  Text('Assignment',
                                  style: TextStyle(fontSize: 12),),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  SizedBox(width: 45),
                                  Text('x4',
                                  style: TextStyle(fontSize: 12)),
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
                    
                    const Text('Favourite Tools', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10,),

                    Container(
                      width: 340,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,                        
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          const SizedBox(width: 5,),
                          const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage('assets/images/43.png'),
                          ),
                          const SizedBox(width: 10,),

                          const Text('Music     '),
                          
                          const SizedBox(width: 180,),

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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          const SizedBox(width: 5,),
                          const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage('assets/images/44.png'),
                          ),
                          const SizedBox(width: 10,),

                          const Text('Meditate'),
                          
                          const SizedBox(width: 180,),

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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          const SizedBox(width: 5,),
                          const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage('assets/images/42.png'),
                          ),
                          const SizedBox(width: 10,),

                          const Text('Exercise '),
                          
                          const SizedBox(width: 180,),

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
        backgroundColor: background
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
              Image.asset('assets/images/milktea.jpg', width: 100, height: 80,),
              Image.asset('assets/images/sad.jpg', width: 100, height: 80,), 
              Image.asset('assets/images/nostudy.jpeg', width: 100, height: 80,),] 
            ),
          ],
        ),
      ),
    );
  }
}

// Profile Page
class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key, 
    required this.image,
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.password,
  });

  final XFile? image;
  final String? name;
  final String? email;
  final String? phoneNo;
  final String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: background
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Profile Picture'),
                  CircleAvatar(
                    radius: 40.0,
                    backgroundColor: Colors.transparent,
                    backgroundImage: image != null ? FileImage(File(image!.path)) : null,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Username'),
                  Text(name!),
                ],
              ),
              const SizedBox(height: 20),

              Container(
                width: 340,
                height: 1,
                color: Colors.grey[400],
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Email'),
                  Text(email!),
            ],
        ),
             const SizedBox(height: 20),

             Container(
                width: 340,
                height: 1,
                color: Colors.grey[400],
              ),

              const SizedBox(height: 20),

             Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Phone Number'),
                  Text(phoneNo!),
            ],
        ),
              const SizedBox(height: 20),

              Container(
                width: 340,
                height: 1,
                color: Colors.grey[400],
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Password'),
                    Text('*' * password!.length),
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
        backgroundColor: background
      ),
      body: SingleChildScrollView(
        child: Column(
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
                        const Text('MALTESE  '),
                        Icon(Icons.edit, size: 12,color: Colors.grey[400],),
                      ],
                    ),
                    const SizedBox(height: 10),
        
                    const CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/images/maltese.png'),
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
                    Text('With his fluffy white fur and lively spirit, he bring joy and warmth to your day. Always ready to listen and share in your experiences.', 
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
                        const Text('WOODY  '),
                        Icon(Icons.edit, size: 12,color: Colors.grey[400],),
                      ],
                    ),
                    const SizedBox(height: 10),
        
                    const CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/images/woody.png'),
                    ),
        
                    const SizedBox(height: 10),
        
                    const Text('Language'),
        
                    const SizedBox(height: 8),
                    Text('English', style: TextStyle(color: Colors.blueAccent[700],fontStyle: FontStyle.italic),),
                    
        
                    const SizedBox(height: 10),
        
                    const Text('Tone'),
        
                    const SizedBox(height: 8),
                    Text('Friendly & Optimistic', style: TextStyle(color: Colors.blueAccent[700],fontStyle: FontStyle.italic),),
        
                    const SizedBox(height: 10),
        
                    const Text('Description'),
                    const SizedBox(height: 8),
                    Text('With his playful cowboy charm, he keeps things light-hearted and knows just the right words to boost your confidence or help you reflect.', 
                    style: TextStyle(color: Colors.blueAccent[700],fontStyle: FontStyle.italic)),
        
            ],
          ),
        )
            ]
            ),
      ));
  }
}

class TalkPage extends StatelessWidget {
  const TalkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        title: const Text('Talk to Someone', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          const SizedBox(height: 30),
            GestureDetector(
              child: const Image(image: AssetImage("assets/images/tiredAI.png")),
            ),
            const SizedBox(height: 9),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 20),
                const Text(
                  "Virtual Consultation",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 130),
                Text('See more', style: TextStyle(fontSize: 12, color: Colors.grey[400]),),
                Icon(Icons.arrow_forward_rounded, color: Colors.grey[400], size: 16),

              ],
            ),

            const SizedBox(height: 10,),

          Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: SizedBox(
                    height: 165,
                    child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Consult(index: index);
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}