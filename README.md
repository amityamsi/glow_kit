# ✨ Glow Kit

A powerful, customizable, high-performance Flutter glow animation package  
supporting 20+ beautiful shapes with smooth, modern animations.
----
## 🎥 Preview

https://raw.githubusercontent.com/amityamsi/glow_kit/main/src/app.gif
---

## ✨ Features

- Smooth animated glow effects  
- 20+ built-in shapes  
- Fully customizable  
- Optimized with CustomPainter  
- High FPS performance  
- Null-safe  
- Flutter 3+ compatible  

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  glow_kit: ^1.0.1
```

Then run:

```bash
flutter pub get
```

---

## 📥 Import

```dart
import 'package:glow_kit/glow_kit.dart';
```

---

## ⚡ Quick Start

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

That’s it. ✨

---

## 🎥 Preview

> Add a GIF inside `/assets/demo.gif` and reference it below.

```markdown
![Glow Kit Demo](https://raw.githubusercontent.com/yourusername/glow_kit/main/assets/demo.gif)
```

After publishing, it will render automatically on pub.dev.

---

## 🧩 Full Example

```dart
GlowEffect(
  glowColor: Colors.purple,
  glowCount: 3,
  duration: const Duration(seconds: 2),
  startDelay: const Duration(milliseconds: 500),
  repeatPauseDuration: const Duration(milliseconds: 300),
  glowRadiusFactor: 0.8,
  animate: true,
  repeat: true,
  curve: Curves.easeInOut,
  shape: GlowShape.hexagon,
  child: const Icon(
    Icons.favorite,
    size: 80,
    color: Colors.white,
  ),
)
```

---

## 🎨 Supported Shapes

### Basic
Rectangle • RoundedRectangle • Circle • Square • Oval • Stadium • Capsule  

### Polygon
Triangle • Diamond • Pentagon • Hexagon • Octagon  

### Stars
StarFive • StarSix  

### Decorative
Heart • Cloud • Bubble • Badge • Shield  

### Modern UI
CutCorner • BeveledRect • Ticket • Ribbon  

---

## ⚙️ Properties

| Property | Type | Description |
|----------|------|------------|
| glowColor | Color | Glow color |
| glowCount | int | Number of glow layers |
| glowRadiusFactor | double | Glow expansion scale |
| endGlowRadius | double? | Final glow radius |
| duration | Duration | Animation duration |
| startDelay | Duration | Delay before start |
| repeatPauseDuration | Duration | Pause between loops |
| animate | bool | Enable/disable animation |
| repeat | bool | Repeat animation |
| curve | Curve | Animation curve |
| shape | GlowShape | Select glow shape |

---

## 🚀 Performance

Glow Kit uses CustomPainter for:

- Minimal rebuilds  
- Smooth animations  
- Efficient blur rendering  
- High performance on all devices  

---

## 🎯 Best Practices

- Use darker backgrounds for better glow visibility  
- Keep glowCount between 2–4  
- Avoid excessive radius scaling  
- Use animate: false for static glow  

---

## 🤝 Contributing

Contributions are welcome!  
Feel free to open issues or submit pull requests.

---

## 💙 Support Glow Kit

If **Glow Kit** helps your project and saves development time,  
consider supporting its continued development ❤️

<div align="center">

### ☕ Buy Me a Coffee

[![Support via PayPal](https://img.shields.io/badge/Support%20via-PayPal-00457C?style=for-the-badge&logo=paypal&logoColor=white)](https://paypal.me/AmitBahadur)

</div>

---

Your support helps:

- 🚀 Add new glow shapes  
- 🎨 Improve animation smoothness  
- ⚡ Optimize performance  
- 🛠 Maintain long-term updates  

Thank you for supporting open source 💙

If this package helps your project:

- ⭐ Like it on pub.dev  
- ⭐ Star it on GitHub  
- 📢 Share it with the Flutter community  

---

## 📄 License

MIT License
