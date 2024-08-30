//
//  ViewController.swift
//  playApp
//
//  Created by Priya on 18/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var BtnSignIn: UIButton!
    @IBOutlet weak var BtnSignUp: UIButton!
    
    var boolRec:Bool = true
    //MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: UIButton Actions
    
    @IBAction func SignInTap(_ sender: Any) {
        boolRec = !boolRec
          if boolRec {
              BtnSignIn.setImage(UIImage(named: "button.png"), for: .normal)
          } else {
              BtnSignIn.setImage(UIImage(named: "selectSignIn.png"), for: .normal)
          }
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "loginViewController") as? loginViewController
        vc?.modalPresentationStyle = .custom
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func signUpTap(_ sender: Any) {
        boolRec = !boolRec
          if boolRec {
              BtnSignUp.setImage(UIImage(named: "button.png"), for: .normal)
          } else {
              BtnSignUp.setImage(UIImage(named: "selectSignUp.png"), for: .normal)
          }
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "signUpViewController") as? signUpViewController
        
        vc?.modalPresentationStyle = .custom
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
