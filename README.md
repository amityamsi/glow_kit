# ✨ Glow Kit

> A powerful, customizable, and high-performance Flutter glow animation package supporting 20+ shapes.

Glow Kit provides a flexible `GlowEffect` widget that adds smooth, animated glow effects to any widget with full customization and optimized rendering using `CustomPainter`.

---

## 🚀 Why Glow Kit?

✔ Smooth & modern glow animations  
✔ 20+ built-in shapes  
✔ Highly customizable  
✔ Optimized for performance  
✔ Easy to use  
✔ Null-safe  
✔ Flutter 3+ compatible  

---

# 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  glow_kit: ^1.0.0
```

Then run:

```bash
flutter pub get
```

---

# 📥 Import

```dart
import 'package:glow_kit/glow_kit.dart';
```

---

# ⚡ Quick Start

The simplest way to use `GlowEffect`:

```dart
GlowEffect(
  glowColor: Colors.blue,
  child: const Icon(
    Icons.star,
    size: 60,
    color: Colors.white,
  ),
)
```

That’s it! 🎉

---

# 🧩 Complete Example

Below is a full runnable example:

```dart
import 'package:flutter/material.dart';
import 'package:glow_kit/glow_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GlowDemoPage(),
    );
  }
}

class GlowDemoPage extends StatefulWidget {
  const GlowDemoPage({super.key});

  @override
  State<GlowDemoPage> createState() => _GlowDemoPageState();
}

class _GlowDemoPageState extends State<GlowDemoPage> {
  bool _animate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GlowEffect(
          glowColor: Colors.purple,
          glowCount: 3,
          duration: const Duration(seconds: 2),
          startDelay: const Duration(milliseconds: 500),
          repeatPauseDuration: const Duration(milliseconds: 300),
          glowRadiusFactor: 0.8,
          animate: _animate,
          repeat: true,
          curve: Curves.easeInOut,
          shape: GlowShape.hexagon,
          child: const Icon(
            Icons.favorite,
            size: 80,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
```

---

# 🎨 Supported Shapes

Glow Kit supports more than 20 shapes:

## 🔷 Basic Shapes
- Rectangle  
- RoundedRectangle  
- Circle  
- Square  
- Oval  
- Stadium  
- Capsule  

## 🔺 Polygon Shapes
- Triangle  
- Diamond  
- Pentagon  
- Hexagon  
- Octagon  

## ⭐ Star Shapes
- StarFive  
- StarSix  

## 💖 Decorative Shapes
- Heart  
- Cloud  
- Bubble  
- Badge  
- Shield  

## 🧩 Modern UI Shapes
- CutCorner  
- BeveledRect  
- Ticket  
- Ribbon  

---

# ⚙️ Properties

| Property            | Type        | Description                              |
|---------------------|------------|------------------------------------------|
| `glowColor`         | Color       | Color of the glow                        |
| `glowCount`         | int         | Number of glow layers                    |
| `glowRadiusFactor`  | double      | Controls glow expansion scale            |
| `endGlowRadius`     | double?     | Explicit final glow radius               |
| `duration`          | Duration    | Animation duration                       |
| `startDelay`        | Duration    | Delay before animation starts            |
| `repeatPauseDuration` | Duration  | Pause between animation loops            |
| `animate`           | bool        | Start or stop animation                  |
| `repeat`            | bool        | Repeat animation                         |
| `curve`             | Curve       | Animation curve                          |
| `shape`             | GlowShape   | Select glow shape                        |

---

# 🛠 Advanced Usage Example

```dart
GlowEffect(
  glowColor: Colors.cyan,
  glowCount: 4,
  glowRadiusFactor: 1.0,
  duration: const Duration(seconds: 3),
  curve: Curves.elasticOut,
  repeat: true,
  shape: GlowShape.starFive,
  child: Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(12),
    ),
    child: const Text(
      "Glow Kit",
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
)
```

---

# 🎯 Best Practices

- Use darker backgrounds for better glow visibility.
- Keep `glowCount` between 2–4 for optimal performance.
- Adjust `glowRadiusFactor` carefully to avoid excessive blur.
- Use `animate: false` for static glow effects.

---

# 📌 Performance Notes

Glow Kit is optimized using `CustomPainter` to ensure:

- Minimal rebuilds
- Smooth animations
- High FPS performance
- Efficient glow rendering

---

# 🤝 Contributing

Contributions are welcome!

If you find bugs or want to request features:
- Open an issue
- Submit a pull request

---

# 📄 License

This project is licensed under the MIT License.

---

# 💙 Support

If you like this package, consider giving it a ⭐ on pub.dev and GitHub.

---

**Glow beautifully. Animate smoothly. Build professionally. ✨**
