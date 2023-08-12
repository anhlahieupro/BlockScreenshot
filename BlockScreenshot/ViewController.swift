import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        let textField = UITextField()
        //        textField.backgroundColor = .red
        //        textField.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        //        textField.center = view.center
        //        view.addSubview(textField)
        //
        //        textField.isSecureTextEntry = true
        //        if let hiddenView = textField.hiddenView {
        //            hiddenView.backgroundColor = .red
        //
        //            let label = UILabel()
        //            label.backgroundColor = .blue
        //            label.textColor = .white
        //            label.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        //            label.text = "hello"
        //
        //            let contentView = UIView()
        //            contentView.backgroundColor = .green
        //            contentView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        //
        //            label.center = contentView.center
        //            contentView.addSubview(label)
        //            hiddenView.addSubview(contentView)
        //        }
        
        let contentView = UIView()
        contentView.backgroundColor = .red
        contentView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        contentView.center = view.center
        view.addSubview(contentView)
        
        let label = UILabel()
        label.backgroundColor = .blue
        label.textColor = .white
        label.text = "hello"
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        contentView.addSubview(label)
        
        label.makeSecure()
    }
}

//extension UITextField {
//    private var _hiddenView: String? {
//        if #available(iOS 15, *) {
//            return "_UITextLayoutCanvasView"
//        }
//
//        if #available(iOS 14, *) {
//            return "_UITextFieldCanvasView"
//        }
//
//        if #available(iOS 13, *) {
//            return "_UITextFieldCanvasView"
//        }
//
//        if #available(iOS 12, *) {
//            return "_UITextFieldContentView"
//        }
//
//        return nil
//    }
//
//    var hiddenView: UIView? {
//        if _hiddenView == nil { return nil }
//        return subviews.first(where: { type(of: $0).description() == _hiddenView })
//    }
//}

extension UIView {
    func makeSecure() {
        DispatchQueue.main.async {
            let field = UITextField()
            field.isSecureTextEntry = true
            self.addSubview(field)
            field.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            field.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            self.layer.superlayer?.addSublayer(field.layer)
            field.layer.sublayers?.first?.addSublayer(self.layer)
        }
    }
}
