//
//  UtSp.swift
//  libroot
//
//  Created by wangzezhi on 2019/6/4.
//  Copyright © 2019 Dazhi528. All rights reserved.
//

import DefaultsKit

public class UtSp {
   
    // MARK: - 存取字符串
    public static func putString(_ strKey: String, _ strValue: String?) {
        let key=Key<String>(strKey)
        if(strValue==nil){
            Defaults.shared.clear(key)
        }else {
            Defaults.shared.set(strValue!, for:key)
        }
    }
    public static func getString(_ strKey: String)-> String {
        return Defaults.shared.get(for: Key<String>(strKey)) ?? ""
    }
    
    
}
