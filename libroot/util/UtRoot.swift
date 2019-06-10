//
//  UtRoot.swift
//  libroot
//
//  Created by wangzezhi on 2019/6/5.
//  Copyright © 2019 Dazhi528. All rights reserved.
//

import Foundation

public class UtRoot {
    
    public static func getUuidStr() -> String {
        let uuidRef = CFUUIDCreate(kCFAllocatorDefault)
        let strRef = CFUUIDCreateString(kCFAllocatorDefault, uuidRef)
        let uuidString = (strRef! as String).replacingOccurrences(of: "-", with: "")
        return uuidString
    }
    
    
}
