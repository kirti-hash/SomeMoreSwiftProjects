//
//  PopOverVC.swift
//  popoverDemo
//
//  Created by MRT102 on 23/10/23.
//

import UIKit

class PopOverVC: UIViewController {
 
    
    @IBOutlet weak var BtnPOpOver: UIButton!
    
    
    @IBOutlet weak var LblPopover: UILabel!
    
    var infoString = "welcome"

       
//    init(infoString: String) {
//            self.infoString = infoString
//            super.init(nibName: "PopOverVC", bundle: nil)
//        }
//        
//        required init?(coder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    @IBAction func btnTapNext(_ sender: Any) {
        
        let nextVC =  secondPOPVC(nibName: "secondPOPVC", bundle: nil)
                nextVC.modalPresentationStyle = .fullScreen
                 self.navigationController?.pushViewController(nextVC, animated: true)
        
        
        
    }
    
    
    
    @IBAction func BtnPopover(_ sender: Any) {
        
        let popoverContent = PopOverVC()
   
        presentPopover(self, popoverContent, sender: BtnPOpOver, size: CGSize(width: 315, height: 120), arrowDirection: .any)
        
    }

    func presentPopover(_ parentViewController: UIViewController, _ viewController: UIViewController, sender: UIView, size: CGSize, arrowDirection: UIPopoverArrowDirection = .down) {
        viewController.preferredContentSize = size
        viewController.modalPresentationStyle = .popover
    
    
        
        if let pres = viewController.presentationController {
            pres.delegate = parentViewController as? any UIAdaptivePresentationControllerDelegate
        }
        parentViewController.present(viewController, animated: true)
        if let pop = viewController.popoverPresentationController {
            pop.sourceView = sender
            pop.sourceRect = sender.bounds
            pop.permittedArrowDirections = arrowDirection
        
        }
    }
}
extension PopOverVC: UIPopoverPresentationControllerDelegate {
    public func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}
