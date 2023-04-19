//
//  KDMString_Extension.swift
//  IQHanProduct
//
//  Created by Google.com  on 2023/3/2.
//

import UIKit
import Foundation

extension String{
    
    func getWidth(font: UIFont ) -> CGFloat {
        
        let ceilString = NSString.init(format: "%@", self)
        let size = CGSize(width: 1000, height: font.pointSize)
        let rect = ceilString.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(rect.width)
    }
    
    func getHeight(font: UIFont, width: CGFloat, numberOfLines: Int = 0,minHeight: CGFloat = 20.0,maxHeight: CGFloat = 300.0) -> CGFloat{
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: 0))
        label.numberOfLines = numberOfLines
        label.font = font
        label.text = self
        label.sizeToFit()
        
        if(label.frame.height > maxHeight) {
            return maxHeight
        }
        
        if(label.frame.height < minHeight) {
            return minHeight
        }
    
        return label.frame.height
    }
    
    var doubleValue: Double {
        return (self as NSString).doubleValue
    }
    var integerValue: Int {
        return (self as NSString).integerValue
    }
    
    ///通过裁剪字符串中的空格和换行符，将得到的结过进行isEmpty
    var isReBlank:Bool{
        let str = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return str.isEmpty
    }
    
    var getImageData : UIImage{
                            
        let data: NSData = NSData(base64Encoded: self, options:NSData.Base64DecodingOptions.ignoreUnknownCharacters)!
        return UIImage(data: data as Data)!
        
    }
    
    
}

// MARK: 字符串转字典
extension String {
    
    func toDictionary() -> [String : Any] {
        
        var result = [String : Any]()
        guard !self.isEmpty else { return result }
        
        guard let dataSelf = self.data(using: .utf8) else {
            return result
        }
        
        if let dic = try? JSONSerialization.jsonObject(with: dataSelf,
                           options: .mutableContainers) as? [String : Any] {
            result = dic
        }
        return result
    
    }
    
}

extension NSAttributedString{
    func getHeight(font: UIFont?, width: CGFloat, numberOfLines: Int = 0) -> CGFloat{
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: 0))
        label.numberOfLines = numberOfLines
        if let f = font{
            label.font = f
        }
        label.attributedText = self
        label.sizeToFit()
        return label.frame.height
    }
}


extension String{
    //时间戳转成字符串
    static func timeIntervalChangeToTimeStr(timeInterval:Double, _ dateFormat:String? = "yyyy-MM-dd") -> String {
        let date:Date = Date.init(timeIntervalSince1970: timeInterval)
        let formatter = DateFormatter.init()
        if dateFormat == nil {
            formatter.dateFormat = "yyyy-MM-dd"
        }else{
            formatter.dateFormat = dateFormat
        }
        return formatter.string(from: date as Date)
    }
    //MARK:- 字符串转时间戳
    func timeStrChangeTotimeInterval(_ dateFormat:String? = "yyyyMMdd") -> String {
        if self.isEmpty {
            return ""
        }
        let format = DateFormatter.init()
        format.dateStyle = .medium
        format.timeStyle = .short
        if dateFormat == nil {
            format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        }else{
            format.dateFormat = dateFormat
        }
        let date = format.date(from: self)

        return String.timeIntervalChangeToTimeStr(timeInterval: Double.init(date?.timeIntervalSince1970 ?? 0))
    }
}
