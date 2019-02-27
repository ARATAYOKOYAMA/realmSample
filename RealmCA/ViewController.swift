//
//  ViewController.swift
//  RealmCA
//
//  Created by 横山新 on 2019/02/27.
//  Copyright © 2019 ARATAYOKOYAMA. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    enum realmCase {
        case add
        case load
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        realm(hoge: .add)
        realm(hoge: .load)
    }
    
    func realm(hoge: realmCase) {
        switch hoge {
        case .add:
            add()
        case .load:
            load()
        }
    }
    
    func load() {
        let realm = try? Realm()
        if let results = realm?.objects(TemplateMessage.self).sorted(byKeyPath: "id", ascending: true) {
            for result in results {
                print(result)
            }
        }

    }
    
    func add() {
        let realm = try? Realm()
        if let latest = realm?.objects(TemplateMessage.self).sorted(byKeyPath: "id", ascending: false).first {
            let templete = TemplateMessage()
            templete.id = latest.id + 1
            templete.message = "test"
            
            try? realm?.write {
                realm?.add(templete)
            }
        }
        
    }

}

