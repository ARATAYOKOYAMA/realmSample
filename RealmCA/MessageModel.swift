//
//  MessageModel.swift
//  RealmCA
//
//  Created by 横山新 on 2019/02/27.
//  Copyright © 2019 ARATAYOKOYAMA. All rights reserved.
//

import Foundation
import RealmSwift

class TemplateMessage: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var message: String = ""
    override static func primaryKey() -> String? {
        return "id"
    }
}

