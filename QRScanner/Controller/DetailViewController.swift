import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailLabel: CopyLabel!
    
    var qrData: QRData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = qrData?.codeString
        UIPasteboard.general.string = detailLabel.text
        showToast(message : "Text copied to clipboard")
        
    }
    
    @IBAction func openInWebAction(_ sender: Any) {
        //        if let url = URL(string: qrData?.codeString ?? ""), UIApplication.shared.canOpenURL(url) {
        //            UIApplication.shared.open(url, options: [:])
        //        } else {
        //            showToast(message : "Not a valid URL")
        //        }
        let urlString = "upi://pay?pa=test@dcb&cu=INR&mc=0000&appName=TEST&tn=To&am=1.0&pn=TEST&tr=TEST-1574159602900"
        
        guard let url = URL.init(string: qrData?.codeString ?? "") else {
            
            return
        }
        UIApplication.shared.openURL(url)
    }
}
