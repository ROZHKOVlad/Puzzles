import UIKit

final class GameOverView: UIView {
    
    public let button = UIButton()
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 15
        
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Restart", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = Resources.Colors.backgroundColor
        button.titleLabel?.textColor = .white
        
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "YOU WON!!!"
        label.textAlignment = .center
        label.textColor = Resources.Colors.backgroundColor
        label.font = UIFont.systemFont(ofSize: 20)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
    
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 40),
            button.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            button.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3),
            
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -25),
            label.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1),
            label.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4)
        ])
    }
}
