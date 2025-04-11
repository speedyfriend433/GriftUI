import UIKit

public class AnimatedGradientView: UIView {
    // Gradient Layer
    private let gradientLayer = CAGradientLayer()
    
    // Customizable properties
    public var animationDuration: CFTimeInterval = 3.0 {
        didSet { startAnimating() }
    }
    public var gradientColors: [UIColor] = [.red, .blue, .green, .yellow] {
        didSet { updateColors() }
    }
    public var gradientDirection: (start: CGPoint, end: CGPoint) = (start: CGPoint(x: 0, y: 0), end: CGPoint(x: 1, y: 1)) {
        didSet { updateDirection() }
    }
    
    private var isAnimating = false
    
    // MARK: - Initializers
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    public convenience init(frame: CGRect, colors: [UIColor], duration: CFTimeInterval = 3.0, direction: (start: CGPoint, end: CGPoint) = (start: CGPoint(x: 0, y: 0), end: CGPoint(x: 1, y: 1))) {
        self.init(frame: frame)
        self.gradientColors = colors
        self.animationDuration = duration
        self.gradientDirection = direction
    }
    
    private func setup() {
        gradientLayer.frame = bounds
        gradientLayer.colors = gradientColors.map { $0.cgColor }
        gradientLayer.startPoint = gradientDirection.start
        gradientLayer.endPoint = gradientDirection.end
        layer.addSublayer(gradientLayer)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private func updateColors() {
        gradientLayer.colors = gradientColors.map { $0.cgColor }
    }
    
    private func updateDirection() {
        gradientLayer.startPoint = gradientDirection.start
        gradientLayer.endPoint = gradientDirection.end
    }
    
    public func startAnimating() {
        isAnimating = true
        animateGradient()
    }
    
    public func stopAnimating() {
        isAnimating = false
        gradientLayer.removeAllAnimations()
    }
    
    private func animateGradient() {
        guard isAnimating else { return }
        let fromColors = gradientLayer.colors
        let toColors = gradientColors.shuffled().map { $0.cgColor }
        gradientLayer.colors = toColors
        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = fromColors
        animation.toValue = toColors
        animation.duration = animationDuration
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = true
        animation.delegate = self
        gradientLayer.add(animation, forKey: "colorChange")
    }
}

extension AnimatedGradientView: CAAnimationDelegate {
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag && isAnimating {
            animateGradient()
        }
    }
}