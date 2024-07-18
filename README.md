# Flutter Oscilloscope App

This Flutter application demonstrates the use of a custom ColorOscilloscope widget and a ValueAdjuster widget to visualize and control dynamic data in real-time.

## Features

- Real-time visualization of data using color-coded oscilloscopes
- Adjustable thresholds for color changes
- Interactive value adjustment for oscilloscope input and thresholds

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK (latest stable version)
- An IDE (e.g., Android Studio, VS Code)

### Installation

1. Clone this repository:
   ```
   git clone https://github.com/yourusername/flutter-oscilloscope-app.git
   ```

2. Navigate to the project directory:
   ```
   cd flutter-oscilloscope-app
   ```

3. Install dependencies:
   ```
   flutter pub get
   ```

4. Run the app:
   ```
   flutter run
   ```

## Usage

### ColorOscilloscope Widget

The `ColorOscilloscope` widget displays a real-time graph of data with color-coded sections based on specified thresholds.

To use the `ColorOscilloscope` in your Flutter app:

1. Import the widget:
   ```dart
   import 'color_oscilloscope.dart';
   ```

2. Add the widget to your build method:
   ```dart
   ColorOscilloscope(
     name: 'Sensor Data',
     counterValue: yourDataValue,
     lowThreshold: lowThresholdValue,
     highThreshold: highThresholdValue,
   )
   ```

   - `name`: The title of the oscilloscope
   - `counterValue`: The current value to be plotted
   - `lowThreshold`: The lower threshold for color change
   - `highThreshold`: The upper threshold for color change

### ValueAdjuster Widget

The `ValueAdjuster` widget provides a simple interface to increment or decrement a value.

To use the `ValueAdjuster` in your Flutter app:

1. Import the widget:
   ```dart
   import 'value_adjuster.dart';
   ```

2. Add the widget to your build method:
   ```dart
   ValueAdjuster(
     label: 'Counter Value',
     value: currentValue,
     changeBy: 0.25,
     onIncrement: (value) => setState(() => currentValue += value),
     onDecrement: (value) => setState(() => currentValue -= value),
     showSign: true,
   )
   ```

   - `label`: The label for the value being adjusted
   - `value`: The current value
   - `changeBy`: The increment/decrement step
   - `onIncrement`: Function to call when incrementing
   - `onDecrement`: Function to call when decrementing
   - `showSign`: Whether to show a plus sign for positive values

## Customization

You can customize the appearance and behavior of both widgets by modifying their respective Dart files:

- `color_oscilloscope.dart`: Adjust colors, thresholds, and oscilloscope parameters
- `value_adjuster.dart`: Modify the layout or style of the adjustment controls
