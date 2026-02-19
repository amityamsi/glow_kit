# Changelog

All notable changes to this project will be documented in this file.

The format is based on Keep a Changelog (https://keepachangelog.com/en/1.0.0/)  
and this project adheres to Semantic Versioning (https://semver.org/).

---

## 1.0.1 - 2026-02-19

### 📚 Documentation Update

This release improves pub.dev scoring and developer experience by enhancing API documentation.

### ✨ Improved

- Added comprehensive Dartdoc comments for public API elements.
- Documented `GlowEffect`, constructor, and public properties.
- Improved overall documentation coverage to meet pub.dev requirements.
- Enhanced IDE tooltips and API discoverability.

### 🧹 Internal

- No functional changes.
- No breaking changes.
- No API changes.

---

## 1.0.0 - 2026-02-18

### 🎉 Initial Stable Release

This version marks the official launch of the redesigned and expanded Glow Kit package.

---

### ✨ Added

- Introduced `GlowEffect` widget with fully customizable glowing animation.
- Support for multiple glow layers using `glowCount`.
- Custom glow color via `glowColor`.
- Adjustable glow expansion using `glowRadiusFactor`.
- Optional `endGlowRadius` for precise glow size control.
- Customizable animation duration.
- Customizable animation curve.
- Optional `startDelay` for delayed animation start.
- Optional `repeatPauseDuration` between animation cycles.
- `animate` flag to control animation state.
- `repeat` flag for looping animation behavior.

---

### 🔷 Supported Shapes

**Basic Shapes**
- Rectangle
- Rounded Rectangle
- Circle
- Square
- Oval / Ellipse
- Stadium
- Capsule / Pill

**Polygon Shapes**
- Triangle
- Diamond
- Pentagon
- Hexagon
- Octagon

**Star Shapes**
- Star (5-point)
- StarFive
- StarSix

**Decorative Shapes**
- Heart
- Cloud
- Bubble
- Badge
- Shield

**Modern UI Shapes**
- CutCorner
- BeveledRect
- Ticket
- Ribbon

---

### ⚡ Performance

- Optimized rendering using `CustomPainter`
- Added `RepaintBoundary` for improved performance
- Smooth animation powered by `AnimationController`
- Efficient repaint handling
- Flutter 3+ compatible
- Fully null-safe implementation

---

### 📦 Included

- Complete example app demonstrating:
  - Multiple glow styles
  - Different shapes
  - Icons and image support
  - Rounded asset glow usage
  - Animation customization examples

---

### 🔧 Technical

- Clean and extensible enum-based shape system
- Modular and reusable design
- Production-ready implementation

---
