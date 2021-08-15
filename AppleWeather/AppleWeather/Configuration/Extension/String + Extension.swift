//
//  String + Extension.swift
//  AppleWeather
//
//  Created by 김혜수 on 2021/08/15.
//

import Foundation

extension String {
    
    func stringFromDate() -> String {
        let date = NSDate(timeIntervalSince1970: TimeInterval(Double(self)!))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "a hh:mm"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: date as Date)
    }
    
    
    
}
