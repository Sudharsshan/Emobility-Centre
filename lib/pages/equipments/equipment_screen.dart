import 'package:flutter/material.dart';
import 'swiper_widget.dart';
// Import the popup

class EquipmentsScreen extends StatelessWidget {
  final List<String> equipments = [
    'Li-ion cell testing lab 5V12A 8Ch',
    'IMPEDANCE ANALYZER (1 mHz to 200kHz)',
    '100 Cells for testing',
    'Fixture for cell testing',
    'Li-ion pack testing 99V 10A Charging 20 A discharging 1Ch',
    'Pack ACIR testing lab 60V 1Ch',
    'Li-ion battery packs for testing',
    'Jigs, wiring & fixture for testing',
    'Environmental chamber (-10 to +70 Deg Cel)',
    '5 units of single cell BMS algorithm Development Lab',
    '5 units of single cell multi cell BMS algorithm Development',
    'BMS algorithm Software Package',
  ];

  final List<String> equipmentImage,
      semiDescription,
      descriptions; // Add descriptions

  final void Function(String) onBookEquipment;
  final void Function(String, String)
      onShowParameters; // Pass description for parameter popup

  EquipmentsScreen({
    super.key,
    required this.onBookEquipment,
    required this.onShowParameters, // Add function for showing parameters
    required this.equipmentImage,
    required this.semiDescription,
    required this.descriptions, // Add descriptions list
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 200),
        EquipmentCarousel(
          equipments: equipments,
          onBookEquipment: onBookEquipment,
          onShowParameters:
              onShowParameters, // Pass the parameter popup function
          equipmentImage: equipmentImage,
          semiDescription: semiDescription,
          description: descriptions, descriptions: [], // Pass descriptions list
        ),
        const SizedBox(height: 20),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
        //   child: ElevatedButton(
        //     onPressed: () {
        //       onBookEquipment(''); // Trigger the booking function
        //     },
        //     style: ElevatedButton.styleFrom(
        //       foregroundColor: Colors.white,
        //       backgroundColor: const Color(0xFF4CAF50),
        //       textStyle: const TextStyle(
        //         fontFamily: 'Lora',
        //         fontSize: 16,
        //       ),
        //       padding: const EdgeInsets.symmetric(vertical: 15.0),
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(8),
        //       ),
        //     ),
        //     child: const Text('Book Equipment'),
        //   ),
        // ),
        const SizedBox(height: 20),
      ],
    );
  }
}
