# GriftUI

A simple and customizable animated gradient UIView for iOS written in Swift. Easily integrate smooth, dynamic gradients into your app's UI.

## Features

- Animate through random gradient color combinations
- Customizable animation duration
- Adjustable gradient direction
- Easy integration with code

## Installation

### Swift Package Manager (SPM)
Add the following to your `Package.swift`:

```swift
.package(url: "https://github.com/speedyfriend433/GriftUI.git", from: "1.0.0")
```

Or use Xcode:
- File > Add Packages...
- Enter repo URL

## Usage

Import the module:

```swift
import GriftUI
```

Create an `AnimatedGradientView` programmatically:

```swift
import UIKit
import GriftUI

let gradientView = AnimatedGradientView(
    frame: CGRect(x: 0, y: 0, width: 300, height: 300),
    colors: [.red, .blue, .green, .yellow],
    duration: 3.0,
    direction: (start: CGPoint(x: 0, y: 0), end: CGPoint(x: 1, y: 1))
)
view.addSubview(gradientView)
gradientView.startAnimating()
```

### Customization

- **Colors:**

```swift
gradientView.gradientColors = [.purple, .orange, .cyan]
```

- **Animation Duration:**

```swift
gradientView.animationDuration = 5.0
```

- **Gradient Direction:**

```swift
gradientView.gradientDirection = (start: CGPoint(x: 0, y: 0), end: CGPoint(x: 1, y: 0))
```

### Stopping Animation

```swift
gradientView.stopAnimating()
```

## License

MIT License
