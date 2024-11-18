import 'package:emobility/pages/equipments/equipment_description.dart';
import 'package:flutter/material.dart';
import 'package:emobility/pages/equipments/swiper_widget.dart'; // Import the EquipmentCarousel
import 'package:emobility/pages/equipments/booking_popup.dart'; // Import the booking popup
import 'package:emobility/pages/equipments/parameterpopup.dart'; // Import the parameter popup

class EquipmentsPage extends StatefulWidget {
  const EquipmentsPage({super.key});

  @override
  _EquipmentsPageState createState() => _EquipmentsPageState();
}

class _EquipmentsPageState extends State<EquipmentsPage>
    with SingleTickerProviderStateMixin {
  late List<String> equipments;
  late List<String> descriptions;
  late List<String> imagePaths;
  late List<String> semiDescription;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    final content = EquipmentsPageContent();
    equipments = content.titles;
    descriptions = content.description;
    imagePaths = content.imagePath;
    semiDescription = content.semidescription;

    // Initialize AnimationController and Animation
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Function to show the booking popup
  void _showBookingPopup(String equipment) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BookingPopup(title: equipment);
      },
    );
  }

  // Function to show the parameter popup (now uses description)
  void _showParameterPopup(String equipment, String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ParameterPopup(
          title: equipment,
          description: description,
          parameters: const [],
          equipment: '',
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SingleChildScrollView(
        child: Column(
          children: [
            EquipmentCarousel(
              equipments: equipments,
              onBookEquipment: _showBookingPopup, // Pass the booking function
              onShowParameters:
                  _showParameterPopup, // Pass the parameter popup function
              equipmentImage: imagePaths,
              semiDescription: semiDescription,
              descriptions: descriptions,
              description: const [], // Pass the descriptions (for parameters)
            ),

            // a widget to prevent nav bar overflow
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
