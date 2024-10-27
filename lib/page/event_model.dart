import 'package:flutter/material.dart';

class EventDetail {
  final DateTime date;
  final String time;
  final String description;
  final String? emoji;
  final String? image; // Optional image field for each event detail

  EventDetail({
    required this.date,
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
    emoji: 'assets/images/hapi.jpg',
    image: 'assets/images/milktea.jpg',
  ),
  EventDetail(
    date: DateTime(2024, 10, 23),
    time: '2:00 PM',
    description: 'more happi',
    image: '',
  ),
  EventDetail(
    date: DateTime(2024, 10, 24),
    time: '02:30 PM',
    description: 'susah sedih',
    emoji: 'assets/images/sad.jpg',
    image: 'assets/images/exam.jpg',
  ),
  EventDetail(
    date: DateTime(2024, 10, 25),
    time: '09:00 AM',
    description: 'i dontwan go study',
    emoji: 'assets/images/bored.jpg',
    image: 'assets/images/nostudy.jpeg',
  ),
];

