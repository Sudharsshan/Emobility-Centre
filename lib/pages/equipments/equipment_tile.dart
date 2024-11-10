import 'package:flutter/material.dart';

class EquipmentTile extends StatelessWidget {
  final String title, equipmentImage, semiDescription;
  final VoidCallback onTap;

  const EquipmentTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.equipmentImage,
    required this.semiDescription
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade50, // Adjust pastel color here
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                // Increase the image size here
                Image.asset(
                  equipmentImage,
                  height: MediaQuery.sizeOf(context).height,  // Increased image size
                  width: MediaQuery.sizeOf(context).width*0.3,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image, size: 150); // Error handling for image
                  },
                ),

                const SizedBox(width: 20),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      //heading of equipment
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 30,  // Slightly larger title font size
                          fontFamily: 'Lora',  // Playfair Display for title
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),

                      //short semiDescription of the equipment
                      Text(
                        semiDescription,  // Add subtitle or additional text
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Lora',  // Use Lora for additional text
                          color: Colors.grey,
                        ),
                        maxLines:  17,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
