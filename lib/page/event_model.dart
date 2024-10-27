import 'package:flutter/material.dart';

class EventDetail {
  final DateTime date;
  final String title;
  final String time;
  final String description;
  final String? emoji;
  final String? image; // Optional image field for each event detail

  EventDetail({
    required this.date,
    required this.title,
    required this.time,
    required this.description,
    this.emoji,
    this.image,
  });
}

// Shared event data with specific images for each EventDetail
final List<EventDetail> sharedEvents = [
  EventDetail(
    date: DateTime(2024, 10, 23),
    time: '10:00 AM',
    description: 'happy day hapi',
    title: 'Happy Day',
    emoji: 'assets/hapi.jpg',
    image: 'assets/milktea.jpg',
  ),
  EventDetail(
    date: DateTime(2024, 10, 23),
    title: '',
    time: '2:00 PM',
    description: 'more happi',
    image: 'assets/bored gif.png',
  ),
  EventDetail(
    date: DateTime(2024, 10, 24),
    title: 'Sad Day',
    time: '02:30 PM',
    description: 'susah sedih',
    emoji: 'assets/sad.jpg',
    image: 'assets/exam.jpg',
  ),
  EventDetail(
    date: DateTime(2024, 10, 25),
    title: 'Study Day',
    time: '09:00 AM',
    description: 'i dontwan go study',
    emoji: 'assets/bored.jpg',
    image: 'assets/nostudy.jpeg',
  ),
];

