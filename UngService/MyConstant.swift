//
//  MyConstant.swift
//  UngService
//
//  Created by MasterUNG on 16/1/2562 BE.
//  Copyright © 2562 MasterUNG. All rights reserved.
//

import Foundation

class MyConstant {
    
    let urlAddUser: String = "https://www.androidthai.in.th/hit/addUserMaster.php?isAdd=true&Name="
    let urlGetUser: String = "https://www.androidthai.in.th/hit/getUserWhereUserMaster.php?isAdd=true&User="
    
    func getUrlGetUser(user: String) -> String {
        let result = "\(urlGetUser)\(user)"
        return result
    }
    
    func getUrlAddUser() -> String {
        return urlAddUser
    }
    
    
}
