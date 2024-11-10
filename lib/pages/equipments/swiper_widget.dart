import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class EquipmentCarousel extends StatelessWidget {
  final List<String> equipments;
  final List<String> equipmentImage;
  final List<String> semiDescription;
  final List<String> descriptions;
  final void Function(String) onBookEquipment;
  final void Function(String, String) onShowParameters; // New parameter

  const EquipmentCarousel({
    Key? key,
    required this.equipments,
    required this.onBookEquipment,
    required this.onShowParameters, // Accepting the function
    required this.equipmentImage,
    required this.semiDescription,
    required this.descriptions,
    required List<String> description, // New parameter for descriptions
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: equipments.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            children: [
              Image.asset(
                equipmentImage[index],
                scale: 3,
              ),
              Text(
                equipments[index],
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                semiDescription[index],
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
              ),
              ElevatedButton(
                onPressed: () {
                  onBookEquipment(equipments[index]);
                },
                child: const Text('Book Equipment'),
              ),
              const SizedBox(
                height: 10,
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  onShowParameters(equipments[index],
                      descriptions[index]); // Pass equipment and description
                },
                child: const Text('Tap for Parameters'),
              ),
            ],
          ),
        );
      },
      options: CarouselOptions(
        height: 450,
        autoPlay: false,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
      ),
    );
  }
}
