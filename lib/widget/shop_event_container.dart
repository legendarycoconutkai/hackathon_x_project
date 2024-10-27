import 'package:flutter/material.dart';

class EventContainer extends StatelessWidget{

  const EventContainer({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context){

    List<String> name = ["Woody", "Buzz", "Rex", "Hamm", "Slinky Dog"];
    List<String> image = [
      "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/686f05f5-5930-4df6-a652-bc126e88f187/dfcnkl4-690bc4c3-3495-4f4c-8bd0-a4e77d7eca0c.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzY4NmYwNWY1LTU5MzAtNGRmNi1hNjUyLWJjMTI2ZTg4ZjE4N1wvZGZjbmtsNC02OTBiYzRjMy0zNDk1LTRmNGMtOGJkMC1hNGU3N2Q3ZWNhMGMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.TGqHjaiIe95oP3735_40hiArfHy2eYb6HO89_RVYN2Q", 
      "https://static.wikia.nocookie.net/disney/images/7/74/Profile_-_Buzz_Lightyear.jpeg/revision/latest?cb=20190623020017", 
      "https://static.wikia.nocookie.net/disney/images/5/56/Profile_-_Rex.jpeg/revision/latest?cb=20190313050619", 
      "https://lumiere-a.akamaihd.net/v1/images/open-uri20150422-20810-f6gkg8_3e65bb6c.jpeg?region=0,0,450,450", 
      "https://static.wikia.nocookie.net/disney/images/a/ac/Profile_-_Slinky_Dog.jpeg/revision/latest?cb=20190313160351"];

    return Container(
      height: 165,
      width: 120,
      margin: EdgeInsets.only(
        left: index == 0 ? 0 : 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey,
      ),
      padding: const EdgeInsets.all(9),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(fit: BoxFit.cover, image[index]),
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
                    "Toy Story", 
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