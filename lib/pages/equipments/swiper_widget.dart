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
    super.key,
    required this.equipments,
    required this.onBookEquipment,
    required this.onShowParameters, // Accepting the function
    required this.equipmentImage,
    required this.semiDescription,
    required this.descriptions,
    required List<String> description, // New parameter for descriptions
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: equipments.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return Card(
          color: Colors.white,
          shadowColor: Colors.grey,
          elevation: 8,
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            // using this scroll view eliminates the render error
            // due to smaller screen sizes
            child: Column(
              children: [
                // equipment image
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.25,
                  child: Image.asset(
                    equipmentImage[index],
                    scale: 3,
                  ),
                ),

                // equipment heading
                Text(
                  equipments[index],
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                const Divider(
                  height: 2,
                ),
                const SizedBox(height: 5),

                // equipment description
                Text(
                  semiDescription[index],
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10,
                  width: 10,
                ),

                // button to book equipment
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

                // button to show equipment parameters
                ElevatedButton(
                  onPressed: () {
                    onShowParameters(equipments[index],
                        descriptions[index]); // Pass equipment and description
                  },
                  child: const Text('Tap for Parameters'),
                ),
              ],
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: MediaQuery.sizeOf(context).height * 0.73,
        autoPlay: false,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
      ),
    );
  }
}
