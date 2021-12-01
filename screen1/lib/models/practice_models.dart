import 'package:flutter/material.dart';

class PracticeModel1 {
  PracticeModel1(
      {required this.id,
      required this.name,
      required this.images,
      required this.description,
      required this.url,
      required this.group});
  String id;
  String name;
  String images;
  String description;
  String url;
  String group;
}

List<PracticeModel1> practiceList = <PracticeModel1>[
  PracticeModel1(
      id: '1',
      name: 'Introduktion',
      images: 'assets/images/Powerpausen.png',
      description: 'Hjärnfokus - 5 min',
      url:
          'https://wpdb.mindfulnessapps.com/wp-content/uploads/2019/12/Introduktion-5-min.mp3',
      group: 'Practices'),
  PracticeModel1(
      id: '2',
      name: 'Andrum',
      images: 'assets/images/Somna.png',
      description: 'En vilsam övning - 3 min',
      url:
          'https://wpdb.mindfulnessapps.com/wp-content/uploads/2019/12/Andrum-3-min.mp3',
      group: 'Practices'),
  PracticeModel1(
      id: '3',
      name: 'Fokusminuten',
      images: 'assets/images/Somna.png',
      description: 'Öva ditt fokus - 1 min',
      url:
          'https://wpdb.mindfulnessapps.com/wp-content/uploads/2019/12/Fokusminuten-1-min.mp3',
      group: 'Practices'),
  PracticeModel1(
      id: '4',
      name: 'Gå med fokus',
      images: 'assets/images/Powerpausen.png',
      description: 'Öva ditt fokus - 5 min',
      url:
          'https://wpdb.mindfulnessapps.com/wp-content/uploads/2019/12/Ga-med-fokus-5-min.mp3',
      group: 'Practices'),
  PracticeModel1(
      id: '5',
      name: 'Mjukstarta dagen',
      images: 'assets/images/Powerpausen.png',
      description: 'Närvaro i rörelse - 5 min',
      url:
          'https://wpdb.mindfulnessapps.com/wp-content/uploads/2019/12/Mjukstarta-dagen-5-min.mp3',
      group: 'Practices'),
  PracticeModel1(
      id: '6',
      name: 'Mjukstarta dagen',
      images: 'assets/images/Somna.png',
      description: 'Närvaro i rörelse - 10 min',
      url:
          'https://wpdb.mindfulnessapps.com/wp-content/uploads/2019/12/Mjukstarta-dagen-10-min.mp3',
      group: 'Practices'),
  PracticeModel1(
      id: '7',
      name: 'PARK',
      images: 'assets/images/Powerpausen.png',
      description: 'Öva ditt fokus - 5 min',
      url:
          'https://wpdb.mindfulnessapps.com/wp-content/uploads/2019/12/PARK-5-min.mp3',
      group: 'Practices'),
  PracticeModel1(
      id: '8',
      name: 'PARK',
      images: 'assets/images/Somna.png',
      description: 'Öva ditt fokus - 10 min',
      url:
          'https://wpdb.mindfulnessapps.com/wp-content/uploads/2019/12/PARK-10-min.mp3',
      group: 'Practices'),
  PracticeModel1(
      id: '9',
      name: 'Powerpausen',
      images: 'assets/images/Powerpausen.png',
      description: 'Ta en vilopaus - 1 min',
      url:
          'https://wpdb.mindfulnessapps.com/wp-content/uploads/2019/12/Powerpausen-1-min.mp3',
      group: 'Practices'),
  PracticeModel1(
      id: '10',
      name: 'Powerpausen',
      images: 'assets/images/Powerpausen.png',
      description: 'Ta en vilopaus - 5 min',
      url:
          'https://wpdb.mindfulnessapps.com/wp-content/uploads/2019/12/Powerpausen-5-min.mp3',
      group: 'Practices'),
  PracticeModel1(
      id: '11',
      name: 'Powerpausen',
      images: 'assets/images/Powerpausen.png',
      description: 'Ta en vilopaus - 10 min',
      url:
          'https://wpdb.mindfulnessapps.com/wp-content/uploads/2019/12/Powerpausen-10-min.mp3',
      group: 'Practices'),
  PracticeModel1(
      id: '12',
      name: 'Powerpausen',
      images: 'assets/images/Powerpausen.png',
      description: 'Ta en vilopaus - 20 min',
      url:
          'https://wpdb.mindfulnessapps.com/wp-content/uploads/2019/12/Powerpausen-20-min.mp3',
      group: 'Practices'),
  PracticeModel1(
      id: '13',
      name: 'Powerpausen',
      images: 'assets/images/Somna.png',
      description: 'Ta en vilopaus - 45 min',
      url:
          'https://wpdb.mindfulnessapps.com/wp-content/uploads/2019/12/Powerpausen-45-min.mp3',
      group: 'Practices'),
  PracticeModel1(
      id: '14',
      name: 'Skarpt fokus',
      images: 'assets/images/Powerpausen.png',
      description: 'Öva ditt fokus - 5 min',
      url:
          'https://wpdb.mindfulnessapps.com/wp-content/uploads/2019/12/Skarpt-fokus-5-min.mp3',
      group: 'Practices'),
  PracticeModel1(
      id: '15',
      name: 'Skarpt fokus',
      images: 'assets/images/Powerpausen.png',
      description: 'Öva ditt fokus - 10 min',
      url:
          'https://wpdb.mindfulnessapps.com/wp-content/uploads/2019/12/Skarpt-fokus-10-min.mp3',
      group: 'Practices'),
  PracticeModel1(
      id: '16',
      name: 'Somna',
      images: 'assets/images/Powerpausen.png',
      description: 'Varva ner - 30 min',
      url:
          'https://wpdb.mindfulnessapps.com/wp-content/uploads/2019/12/Somna-30-min.mp3',
      group: 'Practices'),
  PracticeModel1(
      id: '17',
      name: 'Stå stadigt',
      images: 'assets/images/Powerpausen.png',
      description: 'Andning och närvaro - 5 min',
      url:
          'https://wpdb.mindfulnessapps.com/wp-content/uploads/2019/12/Sta-stadigt-5-min.mp3',
      group: 'Practices'),
  PracticeModel1(
      id: '18',
      name: 'Tre medvetna andetag',
      images: 'assets/images/Somna.png',
      description: 'Fokus på andningen - 1 min',
      url:
          'https://wpdb.mindfulnessapps.com/wp-content/uploads/2019/12/Tre-medvetna-andetag.mp3',
      group: 'Practices'),
  PracticeModel1(
      id: '19',
      name: 'Öppet fokus',
      images: 'assets/images/Powerpausen.png',
      description: 'Inre och yttre närvaro - 5 min',
      url:
          'https://wpdb.mindfulnessapps.com/wp-content/uploads/2019/12/Oppet-fokus-5-min.mp3',
      group: 'Practices'),
  PracticeModel1(
      id: '20',
      name: 'Öppet fokus',
      images: 'assets/images/Powerpausen.png',
      description: 'Inre och yttre närvaro - 10 min',
      url:
          'https://wpdb.mindfulnessapps.com/wp-content/uploads/2019/12/Oppet-fokus-10-min.mp3',
      group: 'Practices'),
  PracticeModel1(
      id: '21',
      name: 'Tystnad med klockor',
      images: 'assets/images/Somna.png',
      description: 'Valfri längd',
      url: 'meditation_timer',
      group: 'Practices'),
];
