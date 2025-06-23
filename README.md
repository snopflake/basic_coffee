# WORKSHOP FE MOBILE - Flutter Animation 🚀

## Basic Coffee Redeem 🍵

A simple Flutter app that lets users “redeem” virtual tokens for delicious coffee items. Tap any card to animate a fill effect when you have enough tokens, or shake the card if you don’t — all while tracking your token balance in real time.

### Features

- **Animated Fill**: Smooth left-to-right fill animation on successful redemption  
- **Shake Feedback**: Card shakes on insufficient tokens  
- **Token Balance**: Live counter that decreases when you redeem  
- **Customizable**: Easily swap out coffee items, colors, durations, and icons  
- **Clean UI**: Rounded cards, smooth transitions, and Inter font via Google Fonts  

---

## Workshop Instructions

In this workshop, you will **implement your own version** of the fill animation in `lib/widgets/fill_animation.dart`. We’ve stubbed out the core class with `TODO` comments and a `GlobalKey` hook—your task is to:

1. **Initialize** an `AnimationController` and an `Animation<double>` in `initState()`.  
2. **Implement** `startFill()` to drive the animation (e.g. `_controller.forward(from: 0.0)`).  
3. **Build** your fill overlay inside the `build()` method (for example, using `AnimatedBuilder` and `FractionallySizedBox`, or any creative approach you prefer).

This is your chance to experiment with curves, shapes, or even gradients—make the fill effect uniquely yours!

---

## Getting Started

1. **Clone** the repo  
   ```bash
   git clone https://github.com/your-username/basic_coffee.git
   cd basic_coffee
