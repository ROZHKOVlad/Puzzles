import UIKit

class ViewController: UIViewController {
    
    static var switchIndex: Int = 0
    
    private var switchKey1: Int = 100
    private var switchKey2: Int = 0
    private var squareStackView: SquareStackView = SquareStackView(numberOfRows: 4)
    private let gameOverView = GameOverView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
    
    private func setup() {
        view.backgroundColor = .lightGray
        view.addSubview(squareStackView)
        view.addSubview(gameOverView)
        self.squareStackView.alpha = 1
        for i in 0..<(SquareStackView.size * SquareStackView.size) {
            squareStackView.imageView(withIndex: i).index = i
            squareStackView.imageView(withIndex: i).tapGesture.addTarget(self, action: #selector(getIndexAndSwap(_:)))
        }
        
        gameOverView.alpha = 0
        gameOverView.isHidden = true
        gameOverView.button.addTarget(self, action: #selector(restartGame), for: .touchUpInside)
    }
    
    @objc
    private func restartGame() {
        squareStackView = SquareStackView(numberOfRows: 4)
        self.viewDidLoad()
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            squareStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            squareStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            squareStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -10),
            squareStackView.heightAnchor.constraint(equalTo: squareStackView.widthAnchor, multiplier: 1),
        ])
    }
    
    @objc
    private func getIndexAndSwap(_ sender: UITapGestureRecognizer) {
        if switchKey1 == 100 {
            switchKey1 = ViewController.switchIndex
        } else {
            switchKey2 = ViewController.switchIndex
            
            let switchImage = squareStackView.imageView(withIndex: switchKey1).image!
            squareStackView.imageView(withIndex: switchKey1).image = squareStackView.imageView(withIndex: switchKey2).image!
            squareStackView.imageView(withIndex: switchKey2).image = switchImage
            
            let switchId = squareStackView.imageView(withIndex: switchKey1).id
            squareStackView.imageView(withIndex: switchKey1).id = squareStackView.imageView(withIndex: switchKey2).id
            squareStackView.imageView(withIndex: switchKey2).id = switchId
            
            switchKey1 = 100
        }
        if checkWin() {
            for i in 0..<(SquareStackView.size * SquareStackView.size) {
                squareStackView.imageView(withIndex: i).index = i
                squareStackView.imageView(withIndex: i).tapGesture.removeTarget(self, action: #selector(getIndexAndSwap))
            }
            UIView.animate(withDuration: 2.0) { [self] in
                self.squareStackView.alpha = 0.4
                NSLayoutConstraint.activate([
                     gameOverView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                     gameOverView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                     gameOverView.widthAnchor.constraint(equalToConstant: 300),
                     gameOverView.heightAnchor.constraint(equalToConstant: 150)
                ])
                gameOverView.alpha = 1
                gameOverView.isHidden = false
            }
        }
    }
    
    private func checkWin() -> Bool {
        for i in 0..<(SquareStackView.size * SquareStackView.size) {
            if squareStackView.imageView(withIndex: i).id != i + 1 {
                return false
            }
        }
        return true
    }
}

