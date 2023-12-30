
import UIKit
import CoreImage

class ViewController: UIViewController {
    
    @IBOutlet var iv_QRScan: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let urlString = "https://github.com/satputerahul"
        if let qrCodeImage = generateQRCode(from: urlString) {
            // Display or save the QRCode image as needed
            // For example, you can set it to an image view
 
                iv_QRScan.image = qrCodeImage

        }
        
    }

    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            
            let transform = CGAffineTransform(scaleX: 3, y: 3) // Adjust the scale as needed
            if let output = filter.outputImage?.transformed(by: transform) {
                let qrCodeImage = UIImage(ciImage: output)
                return qrCodeImage
            }
        }
        
        return nil
    }

}

