//
//  CreateAccountViewController.swift
//  SreenidhiSports
//
//  Created by Apple on 29/04/21.
//

import UIKit

class CreateAccountViewController: UIViewController {

  

  
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var genderTF: UITextField!
    @IBOutlet weak var mobileNumberTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var qualifiTF: UITextField!
    @IBOutlet weak var DOBTF: UITextField!
    
    @IBOutlet weak var bloodGRPTF: UITextField!
    @IBOutlet weak var dominantSideTf: UITextField!
    @IBOutlet weak var schoolNameTF: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var comfirmPasswordTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        userNameTF.cornerRadius()
        genderTF.cornerRadius()
        emailTF.cornerRadius()
        mobileNumberTF.cornerRadius()
        qualifiTF.cornerRadius()
        DOBTF.cornerRadius()
        bloodGRPTF.cornerRadius()
        dominantSideTf.cornerRadius()
        schoolNameTF.cornerRadius()
        passwordTf.cornerRadius()
        comfirmPasswordTf.cornerRadius()
       
        
        
        // Do any additional setup after loading the view.
    }
    
   
    
    
    

}

extension UITextField {

    func cornerRadius(){
        
        self.layer.cornerRadius = self.frame.width/14
        self.layer.masksToBounds = true
    }
}
