import 'package:flutter/material.dart';

class HomeModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  final int numberOfBedrooms;
  final int numberOfBathrooms;
  final String address;
  final String city;
  final bool isAvailable;

  HomeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.numberOfBedrooms,
    required this.numberOfBathrooms,
    required this.address,
    required this.city,
    required this.isAvailable
  });
}

final List<HomeModel> homes=[
  HomeModel(
      id: '1',
      title: 'Belle Villa',
      description: 'Spacious 3 bedroom villa...',
      imageUrl: 'asset/MaisonDesign.jpg',
      price: 150,
      numberOfBedrooms: 3,
      numberOfBathrooms: 2,
      address: 'Lingwala,av de la paix',
      city: 'Kinshasa',
      isAvailable: true
  ),
  HomeModel(
      id: '2',
      title: 'Belle Villa',
      description: 'Spacious 3 bedroom villa...',
      imageUrl: 'asset/MaisonDesign.jpg',
      price: 150,
      numberOfBedrooms: 3,
      numberOfBathrooms: 2,
      address: 'Lingwala,av de la paix',
      city: 'Kinshasa',
      isAvailable: true
  ),
  HomeModel(
      id: '3',
      title: 'Belle Villa',
      description: 'Spacious 3 bedroom villa...',
      imageUrl: 'asset/MaisonDesign.jpg',
      price: 150,
      numberOfBedrooms: 3,
      numberOfBathrooms: 2,
      address: 'Lingwala,av de la paix',
      city: 'Kinshasa',
      isAvailable: true
  ),
  HomeModel(
      id: '4',
      title: 'Belle Villa',
      description: 'Spacious 3 bedroom villa...',
      imageUrl: 'asset/MaisonDesign.jpg',
      price: 150,
      numberOfBedrooms: 3,
      numberOfBathrooms: 2,
      address: 'Lingwala,av de la paix',
      city: 'Kinshasa',
      isAvailable: true
  ),
  HomeModel(
      id: '5',
      title: 'Belle Villa',
      description: 'Spacious 3 bedroom villa...',
      imageUrl: 'asset/MaisonDesign.jpg',
      price: 150,
      numberOfBedrooms: 3,
      numberOfBathrooms: 2,
      address: 'Lingwala,av de la paix',
      city: 'Kinshasa',
      isAvailable: true
  ),
  HomeModel(
      id: '6',
      title: 'Belle Villa',
      description: 'Spacious 3 bedroom villa...',
      imageUrl: 'asset/MaisonDesign.jpg',
      price: 150,
      numberOfBedrooms: 3,
      numberOfBathrooms: 2,
      address: 'Lingwala,av de la paix',
      city: 'Kinshasa',
      isAvailable: true
  ),

];