import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gif/gif.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hackathon_x_project/backend/message.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [
  ];
  bool _isLoading = false;

  callGeminiModel() async{
    try{
      if(_controller.text.isNotEmpty){
        _messages.add(Message(text: _controller.text, isUser: true));
        _isLoading = true;
      }

      final model = GenerativeModel(model: 'gemini-pro', apiKey: dotenv.env['GOOGLE_API_KEY']!);
      final prompt = _controller.text.trim();
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);

      setState(() {
        _messages.add(Message(text: response.text!, isUser: false));
        _isLoading = false;
      });

      _controller.clear();
    }
    catch(e){
      print("Error : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      SlidingUpPanel(
        color: Colors.transparent,
        minHeight: MediaQuery.of(context).size.height*0.03,
        maxHeight: MediaQuery.of(context).size.height*0.43,
        panel: Container(
          decoration: const BoxDecoration(
            color: Colors.white, // background color of panel
            borderRadius: BorderRadius.only(topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0),), // rounded corners of panel
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BarIndicator(),
              Center(
                child: Text("This is the sliding Widget",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        collapsed: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0),),
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BarIndicator(),
            ],
          ),
        ),
        body: Stack(
          children: [Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/empty_room3.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.height/2 - 60 - MediaQuery.of(context).size.height*0.03,
                child: 
                  Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: ListView.builder(
                              itemCount: _messages.length,
                              itemBuilder: (context, index) {
                                final message = _messages[index];
                                return ListTile(
                                  title: Align(
                                    alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: message.isUser ?
                                          Colors.blue :
                                          Colors.green,
                                          borderRadius: message.isUser ?
                                          const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20)
                                          ) :
                                          const BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              topLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20)
                                          )
                                        ),
                                        child: Text(
                                            message.text,
                                        )
                                    ),
                                  ),
                                );
                              },
                            ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15,top: 10, left: 16.0, right: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset: const Offset(0, 3)
                              )
                            ]
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _controller,
                                  style: Theme.of(context).textTheme.titleSmall,
                                  decoration: InputDecoration(
                                    hintText: 'Write your message',
                                    hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                                      color: Colors.grey
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 20)
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8,),
                              _isLoading ?
                              const Padding(
                                padding: EdgeInsets.only(right: 15.0),
                                child: SizedBox(
                                  height: 18.0,
                                  width: 18.0,
                                  child: Center(
                                    child: CircularProgressIndicator()
                                  ),
                                ),
                              ) :
                              IconButton(
                                  icon: const Icon(Icons.send),
                                  onPressed: callGeminiModel,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(bottom:150.0),
            child: Center(
              child: Image(
                image: AssetImage('assets/gif/dog1_smaller.gif'),
              ),
            ),
          )
          ]
        )
      ),
    );
  }
}

class BarIndicator extends StatelessWidget {
  const BarIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 40, height: 3,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}