//
//  signUpViewController.swift
//  playApp
//
//  Created by Priya on 18/09/23.
//

import UIKit

class signUpViewController: UIViewController {

    
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var txtPassword: UITextField!//txtPassword
    @IBOutlet weak var imgConfirmPassword: UIImageView!
    @IBOutlet weak var imgPassword: UIImageView!//imgViewPassword
    @IBOutlet weak var lblLogin: UILabel!//lblLogin
    @IBOutlet weak var btnGoogleOutlet: UIButton!//btnGoogleOutlet
    @IBOutlet weak var btnFbOutlet: UIButton!
    @IBOutlet weak var btnAppleOutlet: UIButton!
    
    var boolIcon = true
    var boolPassword = false
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let labelText = "Already have an account? Login"
        let attributedText = NSMutableAttributedString (string: labelText)
        let textFontSize:CGFloat = 12
        let fontSizeAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: textFontSize)]
        attributedText.addAttributes(fontSizeAttribute,range:NSRange(location:0,length:labelText.count))
     
        let boldAttribute = [NSAttributedString.Key.foregroundColor : UIColor.white]
        let rangeToBold = (labelText as NSString) .range(of: "Login")
        attributedText.addAttributes(boldAttribute, range: rangeToBold)
        lblLogin.attributedText = attributedText
        lblLogin.isUserInteractionEnabled = true
        lblLogin.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(tapLabel(gesture:))))
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(pwdTappedMethod(_:)))
        imgPassword.isUserInteractionEnabled = true
        imgPassword.addGestureRecognizer(tapGestureRecognizer)
        
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(confirmPwdTappedMethod(_:)))
        imgConfirmPassword.isUserInteractionEnabled = true
        imgConfirmPassword.addGestureRecognizer(tapGestureRecognizer1)
    }
    
    //MARK: - UIButtons Actions
    @IBAction func tapLabel(gesture: UITapGestureRecognizer) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "loginViewController") as? loginViewController
        vc?.modalPresentationStyle = .custom
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @objc func pwdTappedMethod(_ sender:AnyObject){
        if boolIcon {
            txtPassword.isSecureTextEntry = false
            imgPassword.image = UIImage(named: "eye.png")
          } else {
              txtPassword.isSecureTextEntry = true
              imgPassword.image = UIImage(named: "unhideEye.png")
          }
          boolIcon = !boolIcon
          }
    
    @objc func confirmPwdTappedMethod(_ sender:AnyObject){
        if boolIcon {
            txtConfirmPassword.isSecureTextEntry = false
            imgConfirmPassword.image = UIImage(named: "eye.png")
          } else {
              txtConfirmPassword.isSecureTextEntry = true
              imgConfirmPassword.image = UIImage(named: "unhideEye.png")
          }
          boolIcon = !boolIcon
         }
    
    @IBAction func signUpTap(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "tabViewController") as? tabViewController
        vc?.modalPresentationStyle = .custom
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
