//
//  ViewController.swift
//  UngService
//
//  Created by MasterUNG on 15/1/2562 BE.
//  Copyright © 2562 MasterUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    Explicit
    var user: String?
    var password: String?
    
    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }   // Main Function
    
    func checkAuthen(user: String, password: String) -> Void {
        
        let myConstant = MyConstant()
        
        let urlString: String = myConstant.getUrlGetUser(user: user)
        print("urlString ==> \(urlString)")
        
        
    }
    
    func myAlert(title: String, message: String) -> Void {
        let objAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        objAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            objAlert.dismiss(animated: true, completion: nil)
        }))
        present(objAlert, animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        user = userTextField.text
        password = passwordTextField.text
        
        if (user!.count == 0) || (password!.count == 0) {
//            Have Space
            print("Have Space")
            myAlert(title: "Have Space", message: "Please Fill All Blank")
        }else {
//            No Space
            print("No Space")
            checkAuthen(user: user!, password: password!)
        }
        
        
    }
    
    


}

