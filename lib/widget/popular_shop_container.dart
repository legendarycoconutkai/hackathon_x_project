import 'package:flutter/material.dart';

class PopularContainer extends StatelessWidget{

  const PopularContainer({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context){

    List<String> name = ["Modern1", "Modern2", "Modern3", "Modern4",];
    List<String> image = [
      "assets/images/shop1.png", 
      "assets/images/shop2.png", 
      "assets/images/shop3.png", 
      "assets/images/shop4.png",];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey,
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
                    "Room", 
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
                  color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}