// The `Home` widget is a stateful widget that represents the home page of the application.
// It includes various functionalities such as sending messages, displaying images, and 
// interacting with a generative model.
//
// The widget uses several packages including:
// - `flutter/material.dart` for UI components.
//- `flutter_dotenv/flutter_dotenv.dart` for environment variables.
// - `google_generative_ai/google_generative_ai.dart` for generative AI functionalities.
// - `provider/provider.dart` for state management.
// - `image_picker/image_picker.dart` for image picking functionalities.
// - `sliding_up_panel/sliding_up_panel.dart` for a sliding up panel UI component.
// - `flutter_keyboard_visibility/flutter_keyboard_visibility.dart` for keyboard visibility detection.
//
// The `Home` widget maintains several states including:
// - `_controller`: A `TextEditingController` for managing the text input.
// - `_scrollController`: A `ScrollController` for managing the scroll position of the message list.
// - `tabController`: A `TabController` for managing the tab navigation.
// - `image`: An `XFile` object representing the selected image.
// - `_isLoading`: A boolean indicating whether a request is in progress.
// - `_isOpen`: A boolean indicating whether the sliding panel is open.
// - `isFurniture`: A list of booleans representing the status of furniture items.
//- `isRoom`: A list of booleans representing the status of room designs.
// - `gifPaths`: A list of strings representing the paths to GIF assets.
// - `_isEating`: A boolean indicating whether the eating animation is active.
// - `_model`: A `GenerativeModel` object for interacting with the generative AI model.
// - `_chat`: A `ChatSession` object for managing the chat session with the generative AI model.
//
// The `Home` widget includes several methods:
// - `callGeminiModel`: Sends a message to the generative AI model and handles the response.
// - `_addMessage`: Adds a message to the message provider.
// - `_scrollToBottom`: Scrolls the message list to the bottom.
// - `changeFurnitureStatus`: Toggles the status of a furniture item.
// - `changeRoomStatus`: Toggles the status of a room design.
// - `changeTreatStatus`: Toggles the eating animation status.
// - `imagePickerMethod`: Opens the image picker to select an image.
//
// The `Home` widget builds a UI that includes:
// - A background image representing the room.
// - Various furniture and room design elements that can be toggled.
// - A list of messages displayed in a chat-like interface.
// - An input field for sending messages and selecting images.
// - A sliding up panel with tabs for selecting furniture, room designs, and treats.

import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hackathon_x_project/backend/colour.dart';
import 'package:hackathon_x_project/widget/inventory.dart';
import 'package:hackathon_x_project/backend/message.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:provider/provider.dart';
import 'package:hackathon_x_project/backend/message_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<Home> {

  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late TabController tabController;
  XFile? image;

  bool _isLoading = false;
  bool _isOpen = false;
  List<bool> isFurniture = [false, false, false, false, false, false];
  List<bool> isRoom = [false, false, false, false, false, false];
  final List<String> gifPaths = [
    'assets/gif/smartdog.gif',
    'assets/gif/lovedog.gif',
    'assets/gif/lazydog.gif',
    'assets/gif/jumpdog.gif'
  ];
  bool _isEating = false;

  late final GenerativeModel _model;
  late final ChatSession _chat;

  callGeminiModel() async {
    try {
      //developer.log("callGeminiModel was run");
      if (image == null) {
        if (_controller.text.isNotEmpty) {
          _addMessage(Message(text: _controller.text, isUser: true));
          setState(() {
            _isLoading = false;
          });
        }

        final prompt = _controller.text.trim();
        final content = Content.text(prompt);
        final response = await _chat.sendMessage(content);

        setState(() {
          _addMessage(Message(text: response.text!, isUser: false));
          setState(() {
            _isLoading = false;
          });
        });
      } else {
        if (_controller.text.isNotEmpty) {
          _addMessage(Message(text: _controller.text, isUser: true, image: image));
          setState(() {
            _isLoading = false;
          });
        }

        final prompt = _controller.text.trim();
        final imagePart = await image!.readAsBytes();
        final mimetype = image?.mimeType ?? 'image/jpeg';
        final response = await _model.generateContent([
          Content.multi([TextPart(prompt), DataPart(mimetype, imagePart)])
        ]);

        setState(() {
          _addMessage(Message(text: response.text!, isUser: false));
          setState(() {
            _isLoading = false;
          });
        });
      }

      _controller.clear();
      setState(() {
        image = null;
      });
      _scrollToBottom();
    } catch (e) {
      //developer.log("Error : $e");
      _addMessage(Message(text: "Error : $e", isUser: false));
    }
  }

  void _addMessage(Message message) {
    Provider.of<MessageProvider>(context, listen: false).addMessage(message);
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  // Method to change the value of an element in the list
  void changeFurnitureStatus(int index) {
    if (index >= 0 && index < isFurniture.length) {
      setState(() {
        isFurniture[index] = !isFurniture[index];
      });
      
      //developer.log("Function to change is called");
    } else {
      //developer.log("Index out of range");
    }
  }

  // Method to change the value of an element in the list
  void changeRoomStatus(int index) {
    if (index >= 0 && index < isRoom.length) {
      if (index >= 0 && index < 3) {
        final bool receivedIndex = isRoom[index];
        isRoom[0] = false;
        isRoom[1] = false;
        isRoom[2] = false;
        setState(() {
          isRoom[index] = !receivedIndex;
        });
      } else {
        final bool receivedIndex = isRoom[index];
        isRoom[3] = false;
        isRoom[4] = false;
        isRoom[5] = false;
        setState(() {
          isRoom[index] = !receivedIndex;
        });
      }
      
      //developer.log("Function to change is called");
    } else {
      //developer.log("Index out of range");
    }
  }

  // Method to change the value of an element in the list
  void changeTreatStatus(int index) {
      setState(() {
        _isEating = !_isEating;
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            _isEating = !_isEating;
          });
        });
      });
  }

  @override
  void initState() {
    _model = GenerativeModel(model: 'gemini-1.5-pro', apiKey: dotenv.env['GOOGLE_API_KEY']!);
    _chat = _model.startChat();

    tabController = TabController(length: 3, vsync: this);

    KeyboardVisibilityController().onChange.listen((bool visible) {
      setState(() {
        _isOpen = visible ? true : false;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    super.build(context); 

    final messages = Provider.of<MessageProvider>(context).messages;
    final double roomHeight = MediaQuery.of(context).size.height/2;
    final double roomWidth = MediaQuery.of(context).size.width;

    final randomGif = gifPaths[Random().nextInt(gifPaths.length)];

    return Scaffold(
      backgroundColor: background,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  children: [ 
                    Container(
                      width: roomWidth,
                      height: roomHeight,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/empty_room3.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    isRoom[0]
                    ? Container(
                      width: roomWidth,
                      height: roomHeight,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/xwall1.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                    : Container(),
                    isRoom[1]
                    ? Container(
                      width: roomWidth,
                      height: roomHeight,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/xwall2.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                    : Container(),
                    isRoom[2]
                    ? Container(
                      width: roomWidth,
                      height: roomHeight,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/xwall3.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                    : Container(),
                    isRoom[3]
                    ? Container(
                      width: roomWidth,
                      height: roomHeight,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/xfloor1.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                    : Container(),
                    isRoom[4]
                    ? Container(
                      width: roomWidth,
                      height: roomHeight,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/xfloor2.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                    : Container(),
                    isRoom[5]
                    ? Container(
                      width: roomWidth,
                      height: roomHeight,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/xfloor3.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                    : Container(),
                    isFurniture[5] 
                    ? Padding(
                      padding: EdgeInsets.only(top: roomHeight*0.55, left: roomWidth*0.1),
                      child: const Image(
                      image: AssetImage('assets/images/plant.png'),
                      width: 100, 
                      height: 100, 
                      ),
                    )
                    : Container(),
                    isFurniture[0]
                    ? Padding(
                      padding: EdgeInsets.only(top: roomHeight*0.7, left: roomWidth*0.05),
                      child: const Image(
                      image: AssetImage('assets/images/mirror.png'),
                      width: 100, 
                      height: 100, 
                      ),
                    )
                    : Container(),
                    isFurniture[1] 
                    ? Padding(
                      padding: EdgeInsets.only(top: roomHeight*0.3, left: roomWidth*0.5),
                      child: const Image(
                      image: AssetImage('assets/images/shelf.png'),
                      width: 100, 
                      height: 100, 
                      ),
                    )
                    : Container(),
                    isFurniture[3]
                    ? Padding(
                      padding: EdgeInsets.only(top: roomHeight*0.51, left: roomWidth*0.65),
                      child: const Image(
                      image: AssetImage('assets/images/lamp.png'),
                      width: 100, 
                      height: 100, 
                      ),
                    )
                    : Container(),
                    isFurniture[4]
                    ? Padding(
                      padding: EdgeInsets.only(top: roomHeight*0.6, left: roomWidth*0.5),
                      child: const Image(
                      image: AssetImage('assets/images/sofa.png'),
                      width: 80, 
                      height: 80, 
                      ),
                    )
                    : Container(),
                    isFurniture[2]
                    ? Padding(
                      padding: EdgeInsets.only(top: roomHeight*0.65, left: roomWidth*0.65),
                      child: const Image(
                      image: AssetImage('assets/images/table.png'),
                      width: 85, 
                      height: 85, 
                      ),
                    )
                    : Container(),
                    _isEating
                    ? Padding(
                      padding: EdgeInsets.only(top: roomHeight*0.65),
                      child: const Center(
                        child: SizedBox(
                          height: 120,
                          width: 120,
                          child: Image(
                            image: AssetImage('assets/gif/eatdog.gif'),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    )
                    : Padding(
                      padding: EdgeInsets.only(top: roomHeight*0.65),
                      child: Center(
                        child: Image(
                          image: AssetImage(randomGif),
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
                  height: MediaQuery.of(context).size.height*0.43 - MediaQuery.of(context).size.height*0.03,
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                            child: ListView.builder(
                              controller: _scrollController,
                              itemCount: messages.length,
                              itemBuilder: (context, index) {
                              final message = messages[index];
                              return ListTile(
                                title: Align(
                                alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                  color: message.isUser ? primary : tertiary,
                                  borderRadius: message.isUser
                                    ? const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20))
                                    : const BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  ),
                                  child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (message.image != null)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Image.file(
                                      File(message.image!.path),
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.contain,
                                      ),
                                    ),
                                    Text(message.text),
                                  ],
                                  ),
                                ),
                                ),
                              );
                              },
                            ),
                        ),
                      ),
                      image != null
                      ? Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1)
                                ),
                                child: Image.file(File(image!.path), fit: BoxFit.contain,) 
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    image = null;
                                  });
                                }, 
                                icon: const Icon(Icons.cancel, size: 30,),
                              )
                            ],
                          ),
                      ) : Container(),
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
                              /*IconButton(
                                  icon: const Icon(Icons.camera_alt),
                                  onPressed: callGeminiModel,
                              ),*/
                              IconButton(
                                  icon: const Icon(Icons.image),
                                  onPressed: imagePickerMethod,
                              ),
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
          _isOpen == true ? Container() :
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
                      color: Colors.white
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
                        Tab(text: 'Designs'),
                        Tab(text: 'Treats'),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                      color: background,
                      ),
                      child: TabBarView(
                      controller: tabController,
                      children: [
                        Inventory(tabIndex: 0, onTap: changeFurnitureStatus,),
                        Inventory(tabIndex: 1, onTap: changeRoomStatus,),
                        Inventory(tabIndex: 2, onTap: changeTreatStatus,),
                      ],
                      ),
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

  Future<void> imagePickerMethod() async {
    final picker = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (picker != null) {
      setState(() {
        image = picker;
      });
    }
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