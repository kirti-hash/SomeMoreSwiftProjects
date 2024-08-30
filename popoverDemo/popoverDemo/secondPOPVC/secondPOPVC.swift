//
//  secondPOPVC.swift
//  popoverDemo
//
//  Created by MRT102 on 25/10/23.
//

import UIKit

class secondPOPVC: UIViewController,UIPopoverPresentationControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
 func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
    
    @IBAction func BtnTap(_ sender: UIButton) {
      
        let popoverContentViewController = popVC()
            popoverContentViewController.modalPresentationStyle = .popover
            popoverContentViewController.preferredContentSize = CGSize(width: 150, height: 150)
      
    if let popover = popoverContentViewController.popoverPresentationController {
               popover.sourceView = sender
              popover.sourceRect = sender.bounds
              
               popover.permittedArrowDirections = .any
               popover.delegate = self
           }
    
        self.present(popoverContentViewController, animated: true, completion: nil)
    }
    
    
   
    
}
