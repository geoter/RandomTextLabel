import UIKit

private var randomValueKey : UInt8 = 3

extension UILabel {
    
    @objc dynamic func _swizzled_setText(_ text: String?) {
        guard text != nil else { return }
        let hasRandomValue = objc_getAssociatedObject(self, &randomValueKey) as? Bool
        guard self.text == nil || hasRandomValue == nil || hasRandomValue == false else { return }
        objc_setAssociatedObject(self, &randomValueKey, true, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        var randomText = ""
        if text?.isNumeric ?? false {
            randomText = "\(Float.random(in: 0..<10000))"
        } else {
            let wordLength = Int.random(in: 1..<50)
            randomText = String.random(length: wordLength)
        }
        _swizzled_setText(randomText)
    }
        
    static func randomText() {
        let selector1 = #selector(setter: UILabel.text)
        let selector2 = #selector(UILabel._swizzled_setText(_:))
        let originalMethod = class_getInstanceMethod(UILabel.self, selector1)!
        let swizzleMethod = class_getInstanceMethod(UILabel.self, selector2)!
        method_exchangeImplementations(originalMethod, swizzleMethod)
    }
}

extension String {
    static func random(length: Int = 20) -> String {
       let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
       var randomString: String = ""
       for _ in 0..<length {
           let randomValue = arc4random_uniform(UInt32(base.count))
           randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
       }
       return randomString
    }
}
extension String {
    var isNumeric : Bool {
        return !self.isEmpty && self.rangeOfCharacter(from: NSCharacterSet.letters) == nil
    }
}
