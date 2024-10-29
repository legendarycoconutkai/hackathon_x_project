import 'package:flutter/material.dart';
import 'package:hackathon_x_project/backend/colour.dart';

class EventContainer extends StatelessWidget{

  const EventContainer({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context){

    List<String> name = ["Woody", "Buzz", "Rex", "Hamm", "Slinky Dog"];
    List<String> image = [
      "assets/images/shopwoody.png", 
      "assets/images/buzz.png", 
      "assets/images/rex.png", 
      "assets/images/hamm.jpeg", 
      "assets/images/tsdog.png"];

    return Container(
      height: 165,
      width: 120,
      margin: EdgeInsets.only(
        left: index == 0 ? 0 : 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: secondary,
      ),
      padding: const EdgeInsets.all(9),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(fit: BoxFit.cover, image[index]),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 17,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.5),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: const Center(
                  child: Text(
                    "AI Voice", 
                    style: TextStyle(
                      color: Colors.black, fontSize:12, fontWeight: FontWeight.bold),),
                ),
              ),
              //const Icon(Icons.new_label_outlined, color: Colors.white, size: 16),                              
            ],
          ),
          const SizedBox(width: 6),
          Row(
            children:[
              Text(
                name[index], 
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black, fontSize: 15,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}