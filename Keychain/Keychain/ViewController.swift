//
//  ViewController.swift
//  Keychain
//
//  Created by lemo on 2018/10/30.
//  Copyright © 2018年 wangli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let passwordKey = "passwordKey"
    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func saveAction(_ sender: UIButton) {
        guard let password = textField.text else {
            return
        }
        if !password.isEmpty {
            let saveSuccessful = KeychainWrapper.standard.set(password, forKey: passwordKey)
            print("saveSuccessful: \(saveSuccessful)")
            self.view.endEditing(true)
        }
    }
    
    @IBAction func getInfoAction(_ sender: UIButton) {
        let info = KeychainWrapper.standard.string(forKey: passwordKey)
        guard let inf = info else {
            return
        }
        
        self.textField.text = inf
    }
    
    @IBAction func removeAction(_ sender: UIButton) {
        let remove = KeychainWrapper.standard.removeObject(forKey: passwordKey)
        print("remove: \(remove)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

