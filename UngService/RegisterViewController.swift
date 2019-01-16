//
//  RegisterViewController.swift
//  UngService
//
//  Created by MasterUNG on 15/1/2562 BE.
//  Copyright © 2562 MasterUNG. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
//    Explicit
    var name: String?
    var user: String?
    var password: String?
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var userTextField: UITextField!
        
    @IBOutlet weak var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }   // Main Function
    
    
    @IBAction func cloudUploadButton(_ sender: Any) {
        
//        Get Value From TextField
        name = nameTextField.text
        user = userTextField.text
        password = passwordTextField.text
        
//        Call Show Log
        showLog(title: "name", message: name!)
        showLog(title: "user", message: user!)
        showLog(title: "password", message: password!)
        
//        Call checkSpace
        checkSpace(name: name!, user: user!, password: password!)
        
        
    }   // cloudUpload
    
    func myAlert(title: String, message: String) -> Void {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        present(alert, animated: true,completion: nil)
        
        
    }
    
    func checkSpace(name: String, user: String, password: String) -> Void {
        
        if (name.count == 0) || (user.count == 0) || (password.count == 0) {
//            Have Space
            showLog(title: "Result", message: "Have Space")
            myAlert(title: "Have Space", message: "Please Fill All Every Blank")
        }else {
//            No Space
            showLog(title: "Result", message: "No Space")
            uploadToServer(name: name, user: user, password: password)
        }
        
    }
    
    func uploadToServer(name: String, user: String, password: String) -> Void {
        
        let myConstant = MyConstant()
        let urlString: String = "\(myConstant.getUrlAddUser())\(name)&User=\(user)&Password=\(password)"
        let url = URL(string: urlString)
        let request = NSMutableURLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            
            if error != nil {
                print("Have Error")
            }else {
               
                if let testResult = data {
                    
                    let canReadResult = NSString(data: testResult, encoding: String.Encoding.utf8.rawValue)
                    print("canReadResult ==> \(String(describing: canReadResult))")
                    
                    if canReadResult == "True" {
                        
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier: "BackMain", sender: self)
                        }
                        
                    } else {
                        DispatchQueue.main.async {
                            self.myAlert(title: "Cannot Upload", message: "Please Try Again Cannot Upload")
                        }
                    }
                    
                    
                }   // if2
            }   // if
        }   // end task
        task.resume()
        
        
        
        
    }
    
    
    func showLog(title: String, message: String) -> Void {
        print("\(title) = \(message)")
    }
    
}   // Main Class
