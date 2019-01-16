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
        
        let urlObject = URL(string: urlString)
        let requestObject = NSMutableURLRequest(url: urlObject!)
        let task = URLSession.shared.dataTask(with: requestObject as URLRequest) {data, response, error in
            
            if error != nil {
                print("Have Error")
            } else {
                
                if let testResult = data {
                    
                    let canReadAble = NSString(data: testResult, encoding: String.Encoding.utf8.rawValue)
                    print("canReadAble ==> \(String(describing: canReadAble))")
                    DispatchQueue.main.async {
                        self.convertStringToDictionry(rawString: canReadAble! as String)
                    }
                    
                }
            }
        }   // end Task
        task.resume()
    }
    
    func convertStringToDictionry(rawString: String) -> Void {
        print("rawString ==> \(rawString)")
        
        if rawString == "null" {
            myAlert(title: "User False", message: "No \(user!) in my Database")
        } else {
            
            let json: String = slipWord(rawString: rawString)
            print("json ==> \(json)")
            var myDictionary: NSDictionary?
            
            
            if let testJson = json.data(using: String.Encoding.utf8) {
                
                do {
                    
                    myDictionary = try JSONSerialization.jsonObject(with: testJson, options: []) as? [String: AnyObject] as NSDictionary?
                    print("myDictionary ==> \(String(describing: myDictionary))")
                    
                    if let testDictionary = myDictionary {
                        
                        print("testDict ==> \(testDictionary)")
                        let truePassword: String = testDictionary["Password"]! as! String
                        if password! == truePassword {
//                            Success Login
                            
                        } else {
                            myAlert(title: "Password False", message: "Please Try Again Password False")
                        }
                        
                        
                        
                    }
                } catch let error as NSError {
                    print("Have Error \(error)")
                }
                
                
            }   // if
        }   // if
    }   // convert
    
    func slipWord(rawString: String) -> String {
        var results = rawString.components(separatedBy: "[")
        var result2s = results[1].components(separatedBy: "]")
        return result2s[0]
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

