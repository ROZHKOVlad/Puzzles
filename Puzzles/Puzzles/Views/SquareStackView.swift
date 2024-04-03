import UIKit

final class SquareStackView: UIStackView {
    
    static var size: Int = 0
    
    init(numberOfRows: Int) {
        super.init(frame: CGRect())
        SquareStackView.size = numberOfRows
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.distribution = .fillEqually
        self.alignment = .fill
        var stackViewArray: [UIStackView] = []
        for i in 0 ..< SquareStackView.size {
            
            var childStackViewArray: [UIView] = []
            
            for j in 1 ... SquareStackView.size {
                
                let imageView = ImageView(id: i * SquareStackView.size + j)
                childStackViewArray.append(imageView)
            }
            
            childStackViewArray.shuffle()
            let childStackView = UIStackView(arrangedSubviews: childStackViewArray)
            childStackView.translatesAutoresizingMaskIntoConstraints = false
            childStackView.axis = .horizontal
            childStackView.distribution = .fillEqually
            childStackView.alignment = .fill
            stackViewArray.append(childStackView)
        }
        stackViewArray.shuffle()
        for i in 0..<stackViewArray.count {
            addArrangedSubview(stackViewArray[i])
        }
    }
    
    public func imageView(withIndex: Int) -> ImageView {
        let stackView: UIStackView = self.arrangedSubviews[withIndex / SquareStackView.size] as! UIStackView
        if withIndex < 4 {
            return stackView.arrangedSubviews[withIndex] as! ImageView
        } else {
            return stackView.arrangedSubviews[withIndex % SquareStackView.size] as! ImageView
        }
    }
    
}
