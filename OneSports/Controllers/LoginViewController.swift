//
//  LoginViewController.swift
//  SreenidhiSports
//
//  Created by Apple on 28/04/21.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextfield: UITextField!
    @IBOutlet weak var OnTapOfLoginBtn: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        // Do any additional setup after loading the view.
    }

    func updateUI (){
        
        EmailTextField.layer.cornerRadius = 26
        EmailTextField.layer.masksToBounds = true
        EmailTextField.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        EmailTextField.layer.borderWidth = 1
        PasswordTextfield.layer.cornerRadius = 26
        PasswordTextfield.layer.masksToBounds = true
        PasswordTextfield.layer.borderWidth = 1
        PasswordTextfield.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        OnTapOfLoginBtn.layer.cornerRadius = 26
        OnTapOfLoginBtn.layer.masksToBounds = true
        
    }
  
    var tokenMain = ""
    
    func primaryAPI(){
       
//        let param : Parameters  = [
//              "userName":"9133117471",
//              "password":"Sree@123"
//
//                               ]
//
        let param : Parameters  = [

            "userName":EmailTextField.text!,
            "password":PasswordTextfield.text!
        ]
          
       
       let url1 = "https://staging.sreenidhi1sports.com/api/AppUsers/loginWithPassword"
//
         print(param)
    
        AF.request(url1, method: .post, parameters:param ,encoding: JSONEncoding.default, headers: nil).validate().responseJSON { [self]
                  response in
                
                  switch response.result {
                  case .success(let value):
                      do {
                        var data = value as? [String:Any]
                        print(data)
                        
                        if let token =  data!["token"] as? String {
                         tokenMain = token
                            loginAPI()
                        }
                      
                      }
                      break
                  case .failure(let error):
                         
                      print("failed response ",error)
      //                print("sendLatLong Err", error.localizedDescription)
                                    
                  }
              }
    }

    func loginAPI(){
    
                let headers:HTTPHeaders = ["Authorization": tokenMain]
           let url2 = "https://staging.sreenidhi1sports.com/api/AppUsers/fetchUserDetails"
      
            AF.request(url2, method: .get, parameters:nil ,encoding: JSONEncoding.default, headers: headers).validate().responseJSON { [self]
                      response in
                    
                      switch response.result {
                      case .success(let value):
                          do {
                        
                            var data = value as? [String:Any]
                            print(data)
                          }
                          break
                      case .failure(let error):
                             
                          print("failed response ",error)
          //                print("sendLatLong Err", error.localizedDescription)
                                        
                      }
                  }
          
        }
    @IBAction func OnTapOfLoginBtn(_ sender: Any) {
        primaryAPI()
    }
    
}

