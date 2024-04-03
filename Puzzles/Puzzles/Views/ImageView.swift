import UIKit

final class ImageView: UIImageView {
    
    public var index = 0
    public var id: Int = 0
    public var tapGesture = UITapGestureRecognizer()
    private let mainImage: UIImage = Resources.Images.imageLandscape!
    
    init(id: Int) {
        super.init(frame: CGRect())
        self.id = id
        var point = CGPoint()
        switch id {
        case 1:
            point = CGPoint(x: 0, y: 0)
        case 2:
            point = CGPoint(x: mainImage.size.width / 4, y: 0)
        case 3:
            point = CGPoint(x: mainImage.size.width / 2, y: 0)
        case 4:
            point = CGPoint(x: mainImage.size.width / 4 * 3, y: 0)
        case 5:
            point = CGPoint(x: 0, y: mainImage.size.height / 4)
        case 6:
            point = CGPoint(x: mainImage.size.width / 4, y: mainImage.size.height / 4)
        case 7:
            point = CGPoint(x: mainImage.size.width / 2, y: mainImage.size.height / 4)
        case 8:
            point = CGPoint(x: mainImage.size.width / 4 * 3, y: mainImage.size.height / 4)
        case 9:
            point = CGPoint(x: 0, y: mainImage.size.height / 2)
        case 10:
            point = CGPoint(x: mainImage.size.width / 4, y: mainImage.size.height / 2)
        case 11:
            point = CGPoint(x: mainImage.size.width / 2, y: mainImage.size.height / 2)
        case 12:
            point = CGPoint(x: mainImage.size.width / 4 * 3, y: mainImage.size.height / 2)
        case 13:
            point = CGPoint(x: 0, y: mainImage.size.height / 4 * 3)
        case 14:
            point = CGPoint(x: mainImage.size.width / 4, y: mainImage.size.height / 4 * 3)
        case 15:
            point = CGPoint(x: mainImage.size.width / 2, y: mainImage.size.height / 4 * 3)
        case 16:
            point = CGPoint(x: mainImage.size.width / 4 * 3, y: mainImage.size.height / 4 * 3)
        default:
            print("Error")
        }
        self.image = cropImage(image: mainImage,
                               rect: CGRect(origin: point,
                                            size: CGSize(width: mainImage.size.width / CGFloat(SquareStackView.size),
                                                         height: mainImage.size.height / CGFloat(SquareStackView.size))))
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = true
        tapGesture.addTarget(self, action: #selector(transmitIndex))
        addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func transmitIndex() {
        ViewController.switchIndex = index
    }
    
    private func cropImage(image: UIImage, rect: CGRect) -> UIImage {
            let scale = image.scale
        
            let croppedRect = CGRect(
                x: rect.origin.x * scale,
                y: rect.origin.y * scale,
                width: rect.size.width * scale,
                height: rect.size.height * scale
            )
            
            if let croppedCGImage = image.cgImage?.cropping(to: croppedRect) {
                return UIImage(cgImage: croppedCGImage, scale: scale, orientation: image.imageOrientation)
            }
            return UIImage()
        }
}
