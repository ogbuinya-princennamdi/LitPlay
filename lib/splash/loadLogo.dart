import 'package:flutter/material.dart';

class loadLogo extends StatefulWidget {
  const loadLogo({super.key});

  @override
  State<loadLogo> createState() => _loadLogoState();
}

class _loadLogoState extends State<loadLogo> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this,
        lowerBound: 0.0,
        upperBound: 1.0)
      .. repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        rotatingTransition(_controller),
      ],
    );
  }

}
  Widget rotatingTransition(AnimationController controller) {

    return Column(
      children: [
        RotationTransition(
          turns: controller,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(2.0), // Padding around the border
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),

              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                // Clip the image to match the border radius
                child: Image.asset(
                  'assets/litmac.png', // Correct asset path
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover, // Ensure the image covers the container
                ),
              ),
            ),
          ),
        ),
        const Text(
          'Safety in Privacy',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 18,
              color: Colors.white
          ),
        ),
      ],
    );
  }
