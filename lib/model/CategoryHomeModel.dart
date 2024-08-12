import 'package:flutter/material.dart';

class CategoryHomeModel{
  final String title;
  final IconData icon;

  CategoryHomeModel({required this.title,required this.icon});
}

final List<CategoryHomeModel> categories=[
  CategoryHomeModel(title: "Appartement", icon: Icons.apartment_outlined),
  CategoryHomeModel(title: "Bureau", icon: Icons.business_center_sharp),
  CategoryHomeModel(title: "Maison", icon: Icons.warehouse_outlined),
  CategoryHomeModel(title: "Studio", icon: Icons.house_siding_outlined),
  CategoryHomeModel(title: "Vila", icon: Icons.business),
];

