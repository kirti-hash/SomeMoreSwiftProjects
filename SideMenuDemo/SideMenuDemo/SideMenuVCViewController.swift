//
//  SideMenuVCViewController.swift
//  SideMenuDemo
//
//  Created by MRT102 on 09/10/23.
//

import UIKit
import SideMenu

class SideMenuVCViewController: UIViewController,SideMenuNavigationControllerDelegate {
    open var leftMenuNavigationController: SideMenuNavigationController?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func BtnSideMenuAction(_ sender: Any) {
        
        SideMenuManager.default.leftMenuNavigationController = SideMenuNavigationController(rootViewController: TableVC(nibName: "TableVC", bundle: nil))
        present(SideMenuManager.default.leftMenuNavigationController!, animated: true, completion: nil)
        SideMenuManager.default.leftMenuNavigationController!.presentationStyle.backgroundColor = .black
        SideMenuManager.default.leftMenuNavigationController!.presentationStyle.presentingEndAlpha = 0.5
    }
}
