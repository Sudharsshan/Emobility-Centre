import 'package:flutter/material.dart';

class ParameterPopup extends StatefulWidget {
  final String title;
  final String description;
  final List<String> parameters; // List of parameters to display

  const ParameterPopup({
    super.key,
    required this.title,
    required this.description,
    required this.parameters, required String equipment,
  });

  @override
  State<ParameterPopup> createState() => _ParameterPopupState();
}

class _ParameterPopupState extends State<ParameterPopup>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
            fontFamily: 'Lora',
            fontWeight: FontWeight.bold,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.description,
                style: const TextStyle(fontFamily: 'Lora'),
              ),
              const SizedBox(height: 10),
              const Text(
                'Parameters:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'Lora',
                ),
              ),
              const SizedBox(height: 10),
              ...widget.parameters.map((param) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  param,
                  style: const TextStyle(fontFamily: 'Lora'),
                ),
              )),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey,
            ),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
