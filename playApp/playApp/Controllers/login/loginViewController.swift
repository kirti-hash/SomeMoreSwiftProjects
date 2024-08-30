//
//  loginViewController.swift
//  playApp
//
//  Created by Priya on 18/09/23.
//

import UIKit

class loginViewController: UIViewController {

    
    @IBOutlet weak var imgPassword: UIImageView!
    @IBOutlet weak var btnGoogleOutlet: UIButton!
    @IBOutlet weak var btnFbOutlet: UIButton!
    @IBOutlet weak var btnAppleOutlet: UIButton!
    @IBOutlet weak var txtPassword: UITextField!
    
    var boolIcon = true
    
    //MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(cellTappedMethod(_:)))
        imgPassword.isUserInteractionEnabled = true
        imgPassword.addGestureRecognizer(tapGestureRecognizer)
    }
    
    //MARK: UIButtons Actions
    
    @objc func cellTappedMethod(_ sender:AnyObject){
        if boolIcon {
            txtPassword.isSecureTextEntry = true
            imgPassword.image = UIImage(named: "unhideEye.png")
          } else {
              txtPassword.isSecureTextEntry = false
              imgPassword.image = UIImage(named: "eye.png")
          }
          boolIcon = !boolIcon
    }
    
    @IBAction func signUpHereTap(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "signUpViewController") as? signUpViewController
        
        vc?.modalPresentationStyle = .custom
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
