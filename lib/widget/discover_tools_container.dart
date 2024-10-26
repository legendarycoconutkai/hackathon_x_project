import 'package:flutter/material.dart';

class ToolsContainer extends StatelessWidget {
  const ToolsContainer({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {

    List<String> name = ["Woody", "Buzz", "Rex", "Hamm", "Slinky Dog"];
    List<String> image = [
      "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/686f05f5-5930-4df6-a652-bc126e88f187/dfcnkl4-690bc4c3-3495-4f4c-8bd0-a4e77d7eca0c.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzY4NmYwNWY1LTU5MzAtNGRmNi1hNjUyLWJjMTI2ZTg4ZjE4N1wvZGZjbmtsNC02OTBiYzRjMy0zNDk1LTRmNGMtOGJkMC1hNGU3N2Q3ZWNhMGMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.TGqHjaiIe95oP3735_40hiArfHy2eYb6HO89_RVYN2Q", 
      "https://static.wikia.nocookie.net/disney/images/7/74/Profile_-_Buzz_Lightyear.jpeg/revision/latest?cb=20190623020017", 
      "https://static.wikia.nocookie.net/disney/images/5/56/Profile_-_Rex.jpeg/revision/latest?cb=20190313050619", 
      "https://lumiere-a.akamaihd.net/v1/images/open-uri20150422-20810-f6gkg8_3e65bb6c.jpeg?region=0,0,450,450", 
      "https://static.wikia.nocookie.net/disney/images/a/ac/Profile_-_Slinky_Dog.jpeg/revision/latest?cb=20190313160351"];

    return GestureDetector(
      onTap: () {
        // open search bar
      },
      child: Container(
        height: MediaQuery.of(context).size.width*0.9*25/97,
        width: MediaQuery.of(context).size.width*0.9,
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          top: index == 0 ? 0 : 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
            image: NetworkImage("https://static.vecteezy.com/system/resources/thumbnails/005/720/479/small/banner-abstract-background-board-for-text-and-message-design-modern-free-vector.jpg"),
            fit: BoxFit.cover
          )
        ),
        child: Text(
          name[index], 
          style: const TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}