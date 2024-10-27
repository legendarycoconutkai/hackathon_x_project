import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hackathon_x_project/widget/inventory.dart';
import 'package:hackathon_x_project/backend/message.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<Home> {

  int acceptedData = 0;

  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [];

  bool _isLoading = false;
  bool _isOpen = false;

  callGeminiModel() async{
    try{
      if(_controller.text.isNotEmpty){
        _messages.add(Message(text: _controller.text, isUser: true));
        setState(() {
          _isLoading = false;
        });
      }

      final model = GenerativeModel(model: 'gemini-pro', apiKey: dotenv.env['GOOGLE_API_KEY']!);
      final prompt = _controller.text.trim();
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);

      setState(() {
        _messages.add(Message(text: response.text!, isUser: false));
        setState(() {
          _isLoading = false;
        });
      });

      _controller.clear();
    }
    catch(e){
      print("Error : $e");
    }
  }

  @override
  void initState() {
    super.initState();
    KeyboardVisibilityController().onChange.listen((bool visible) {
      setState(() {
        _isOpen = visible ? true : false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    super.build(context); 

    TabController tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Stack(
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
                    const Padding(
                      padding: EdgeInsets.only(top: 300),
                      child: Center(
                        child: Image(
                          image: AssetImage('assets/gif/dog1_bigger.gif'),
                        ),
                      ),
                    ),
                  ]
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
                  child: Column(
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
          ),
          _isOpen == true ? const Divider() :
          SlidingUpPanel(
            minHeight: MediaQuery.of(context).size.height*0.03,
            maxHeight: MediaQuery.of(context).size.height*0.43,
            panel: Container(
              decoration: const BoxDecoration(
                color: Colors.white, // background color of panel
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0),), // rounded corners of panel
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const BarIndicator(),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: TabBar(
                      controller: tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      indicatorColor: Colors.black,
                      dividerColor: Colors.transparent,
                      tabs: const [
                        Tab(text: 'Furnitures'),
                        Tab(text: 'Toys'),
                        Tab(text: 'Treats'),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.43 - 71,
                    child: TabBarView(
                      controller: tabController,
                      children: const [
                        Inventory(tabIndex: 0),
                        Inventory(tabIndex: 1),
                        Inventory(tabIndex: 2),
                      ],
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
          )
        ],
      ) 
    );
  }

  @override
  bool get wantKeepAlive => true;
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