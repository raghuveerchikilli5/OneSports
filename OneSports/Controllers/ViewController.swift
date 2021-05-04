//
//  ViewController.swift
//  SreenidhiSports
//
//  Created by Apple on 28/04/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var createAccountBtn: UIButton!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
       
    }
    
    func updateUI()
    {
        loginBtn.layer.cornerRadius = 26
        loginBtn.layer.masksToBounds = true
        createAccountBtn.layer.cornerRadius = 26
        createAccountBtn.layer.masksToBounds = true
        createAccountBtn.layer.borderColor = #colorLiteral(red: 0.8686868687, green: 0.1299475731, blue: 0.007505266494, alpha: 0.940397351)
        createAccountBtn.layer.borderWidth = 1
    }

    
    
    @IBAction func loginBtn(_ sender: Any) {
        
        let loginVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "LoginVC") as! LoginViewController
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true, completion: nil)
        
    }
    

    @IBAction func creatAccountBtn(_ sender: Any) {
        
        let createVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "CreateVC") as! CreateAccountViewController
        createVC.modalPresentationStyle = .fullScreen
        present(createVC, animated: true, completion: nil)

        
        
        
        
    }
    
}


//take another view controller and set scrollview with constraints 0000, and addstack view. fromstack view to contentlayout select First 4 options and fromstack view to frame layout select equal widths.
//in the below constarnt make all constaint to 0.
//take a uiview on top of that  and give height constarint.

//take a label for text login and anotherlabel for add your details to login.
//take two textfields and give constarints with height 45 and left and right 30 and add corner radius
//same with the button , height 45 , left right 30,
//and another button to forgot password? text color dark grey

// take outlets to textfields and add corner radius an
//both action and outlet for button


