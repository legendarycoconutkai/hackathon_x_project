import 'package:image_picker/image_picker.dart';

// Model class for event details
class EventDetail {
  final DateTime date; // Date of the event
  final String title; // Title of the event
  final String time; // Time of the event
  final String description; // Description of the event
  final String? emoji; // Optional emoji representing the mood of the event
  final String? image; // Optional image field for each event detail
  final XFile? imageFile; // Optional image file path for each event detail

  // Constructor for EventDetail
  EventDetail({
    required this.date,
    required this.title,
    required this.time,
    required this.description,
    this.emoji,
    this.image,
    this.imageFile,
  });
}

// Shared event data with specific images for each EventDetail
final List<EventDetail> sharedEvents = [
  EventDetail(
    date: DateTime(2024, 10, 18),
    title: 'Sad Day',
    time: '11:30 PM',
    description: 'Sometimes, I wonder if I’m on the right path at all. I work so hard, but for what? It’s hard to stay motivated when everything feels so uncertain.',
    emoji: 'assets/images/badmood.png',
  ),
  EventDetail(
    date: DateTime(2024, 10, 19),
    title: 'Hectic Day',
    time: '7:00 PM',
    description: 'Today felt endless. I spent most of it organizing files—tedious but satisfying once it was done. Everything feels a bit more in order now.',
    emoji: 'assets/images/moderatemode.png',
  ),
  EventDetail(
    date: DateTime(2024, 10, 20),
    title: 'Normal Day',
    time: '8:00 PM',
    description: 'Tried a new recipe tonight—pasta with a creamy mushroom sauce. Simple but delicious. I think I’ll add it to my regular meals.',
    emoji: 'assets/images/goodmood.png',
    image: 'assets/images/pasta.jpg',
  ),
  EventDetail(
    date: DateTime(2024, 10, 21),
    title: 'Cafe Day',
    time: '2:00 PM',
    description: 'Went to a new coffee shop today. Loved the cozy vibe, and the barista made an incredible latte. Might become my new favorite spot!',
    emoji: 'assets/images/goodmood.png',
    image: 'assets/images/coffeeshop.jpg',
  ),
  EventDetail(
    date: DateTime(2024, 10, 22),
    title: 'Library Day',
    time: '4:00 PM',
    description: 'Today, I spent the afternoon at the local library, something I haven’t done in ages. I browsed through sections I wouldn’t normally visit, picking out books on random topics.',
    emoji: 'assets/images/goodmood.png',
    image: 'assets/images/library.jpg',
  ),
  EventDetail(
    date: DateTime(2024, 10, 23),
    title: 'Milk Tea Day',
    time: '10:00 AM',
    description: 'Today is a happy day. I bought a cup of milk tea and I enjoyed it very much.',
    emoji: 'assets/images/goodmood.png',
    image: 'assets/images/milktea.jpg',
  ),
  EventDetail(
    date: DateTime(2024, 10, 24),
    title: 'Peaceful Walk',
    time: '6:00 PM',
    description: 'Today was one of those rare, peaceful days. I took a long walk by the river, just letting my mind wander. I noticed so many small things I usually overlook: the soft hum of bees around the flowers, the satisfying crunch of gravel under my feet. It was refreshing to slow down and savor the moment. I think I will make this walk a regular thing.',
    emoji: 'assets/images/moderatemode.png',
    image: 'assets/images/river.jpg',
  ),
  EventDetail(
    date: DateTime(2024, 10, 25),
    title: 'Cute Doggie',
    time: '2:00 PM',
    description: 'I found a sticker of a dog being all lazy. It is so cute! I decided to save it and send it to my friends next time.',
    emoji: 'assets/images/goodmood.png',
    image: 'assets/gif/lazydog.gif',
  ),
  EventDetail(
    date: DateTime(2024, 10, 26),
    title: 'Sad Day',
    time: '02:30 PM',
    description: 'I messed up my exam today. I feel so sad and disappointed. I wish I could turn back time and study harder.',
    emoji: 'assets/images/badmood.png',
    image: 'assets/images/exam.jpg',
  ),
  EventDetail(
    date: DateTime(2024, 10, 27),
    title: 'Busy Day',
    time: '02:30 PM',
    description: 'I am feeling pretty overwhelmed. There is so much on my plate with study and this new project I am managing. The day flew by in a whirlwind of meetings and assignments, and I barely had time to catch my breath. I know I need to find a way to make more time for myself. It is going to be a balancing act, but I think I can manage it with a bit more structure.',
    emoji: 'assets/images/badmood.png',
    image: 'assets/images/meeting.jpg',
  ),
  EventDetail(
    date: DateTime(2024, 10, 27),
    title: 'Busy Day',
    time: '02:30 PM',
    description: 'I spent the evening organizing my room. It is amazing how much lighter I feel when my surroundings are in order. I sorted through old books, found some forgotten notes, and even stumbled upon an old postcard from a friend. I decided to hang it up on my wall as a little reminder of all the good memories I have made.',
    emoji: 'assets/images/badmood.png',
    image: 'assets/images/room.jpg',
  ),
  EventDetail(
    date: DateTime(2024, 10, 28),
    title: 'Study Day',
    time: '09:00 AM',
    description: 'I don\'t feel like studying today. I am so tired and I just want to relax. I wish I could take a break and do something fun.',
    emoji: 'assets/images/moderatemode.png',
    image: 'assets/images/nostudy.jpeg',
  ),
  EventDetail(
    date: DateTime(2024, 10, 28),
    title: 'Nights Out',
    time: '11:00 PM',
    description: 'Tonight was magical. I went out with some friends to this rooftop café in the city, and the sunset view was spectacular—fiery reds and purples all across the sky. We ended up staying longer than planned, talking about everything and nothing. It was one of those nights where time just fades away. I haven\'t felt that carefree in a while, and I realized how much I needed it.',
    emoji: 'assets/images/happymood.png',
    image: 'assets/images/rooftopcafe.jpg',
  ),
];
