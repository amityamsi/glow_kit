import 'package:glow_kit/glow_effect.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GlowEffect Showcase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.white,
      ),
      home: const GlowShowcasePage(),
    );
  }
}

class GlowShowcasePage extends StatelessWidget {
  const GlowShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GlowEffect – Shape Showcase"),
        centerTitle: true,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          // Circle
          SizedBox(
            width: 140,
            height: 140,
            child: Center(
              child: GlowEffect(
                glowCount: 1,
                glowShape: GlowShapeType.circle,
                glowColor: Colors.blue,
                endGlowRadius: 80,
                child: const Icon(Icons.mic, size: 40, color: Colors.white),
              ),
            ),
          ),

          // Rectangle
          SizedBox(
            width: 140,
            height: 140,
            child: Center(
              child: GlowEffect(
                glowCount: 3,
                glowShape: GlowShapeType.rectangle,
                glowColor: Colors.green,
                endGlowRadius: 100,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.green,
                  child: const Text("LIVE"),
                ),
              ),
            ),
          ),

          // Rounded Rect (Asset Image)
          SizedBox(
            width: 140,
            height: 140,
            child: Center(
              child: GlowEffect(
                glowCount: 5,
                glowShape: GlowShapeType.roundedRect,
                glowBorderRadius: BorderRadius.circular(16),
                glowColor: Colors.orange,
                endGlowRadius: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/codemicros.png',
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          // Heart
          SizedBox(
            width: 140,
            height: 140,
            child: Center(
              child: GlowEffect(
                glowCount: 10,
                glowShape: GlowShapeType.heart,
                glowColor: Colors.pink,
                endGlowRadius: 120,
                child:
                    const Icon(Icons.favorite, size: 40, color: Colors.white),
              ),
            ),
          ),

          // Triangle
          SizedBox(
            width: 140,
            height: 140,
            child: Center(
              child: GlowEffect(
                glowCount: 3,
                glowShape: GlowShapeType.triangle,
                glowColor: Colors.teal,
                endGlowRadius: 100,
                child: const Icon(Icons.change_history,
                    size: 40, color: Colors.white),
              ),
            ),
          ),

          // Hexagon
          SizedBox(
            width: 140,
            height: 140,
            child: Center(
              child: GlowEffect(
                glowCount: 3,
                glowShape: GlowShapeType.hexagon,
                glowColor: Colors.amber,
                endGlowRadius: 80,
                child: const Icon(Icons.stop, size: 40, color: Colors.black),
              ),
            ),
          ),

          // Star Five
          SizedBox(
            width: 140,
            height: 140,
            child: Center(
              child: GlowEffect(
                glowCount: 4,
                glowShape: GlowShapeType.starFive,
                glowColor: Colors.yellow,
                endGlowRadius: 110,
                child: const Icon(Icons.star, size: 40, color: Colors.black),
              ),
            ),
          ),

          // Star Six
          SizedBox(
            width: 140,
            height: 140,
            child: Center(
              child: GlowEffect(
                glowCount: 4,
                glowShape: GlowShapeType.starSix,
                glowColor: Colors.deepOrange,
                endGlowRadius: 110,
                child: const Icon(Icons.auto_awesome,
                    size: 40, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
