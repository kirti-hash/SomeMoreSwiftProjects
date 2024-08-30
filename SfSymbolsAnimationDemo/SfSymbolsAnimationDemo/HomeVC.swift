//
//  HomeVC.swift
//  SfSymbolsAnimationDemo
//
//  Created by MRT102 on 03/01/24.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var imgMessage: UIImageView!
    @IBOutlet weak var imgHome: UIImageView!
    @IBOutlet weak var imgPencil: UIImageView!
 
    @IBOutlet weak var imgHeart: UIImageView!
    
    @IBOutlet weak var imgCal: UIImageView!
    var imgToggle = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(tapResponse1))
        imgMessage.addGestureRecognizer(tapGestureRecognizer1)
        imgMessage.isUserInteractionEnabled = true
        
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(tapResponse2))
        imgHome.addGestureRecognizer(tapGestureRecognizer2)
        imgHome.isUserInteractionEnabled = true
        
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(tapResponse3))
        imgPencil.addGestureRecognizer(tapGestureRecognizer3)
        imgPencil.isUserInteractionEnabled = true
        
        let tapGestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(tapResponse4))
        imgHeart.addGestureRecognizer(tapGestureRecognizer4)
        imgHeart.isUserInteractionEnabled = true
        
        let tapGestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(tapResponse5))
        imgCal.addGestureRecognizer(tapGestureRecognizer5)
        imgCal.isUserInteractionEnabled = true
    }

    @objc func tapResponse1() {
        imgMessage.addSymbolEffect(.bounce, animated: true)
    }

    
    @objc func tapResponse2() {
        imgHome.setSymbolImage(UIImage(systemName: "paperplane.fill")!, contentTransition: .automatic,options: .repeating)
    }
    
    @objc func tapResponse3() {
        imgPencil.addSymbolEffect(.variableColor,animated: true)
    }
    @objc func tapResponse4() {
        imgHeart.addSymbolEffect(.pulse,animated: true)
    }
    @objc func tapResponse5() {
        if imgToggle {
            imgCal.addSymbolEffect(.disappear,animated: true)
        }else{
            imgCal.addSymbolEffect(.appear,animated: true)
        }
        imgToggle.toggle()
    }
    
    
    @IBAction func BtnNextTap(_ sender: Any) {
        
        let nextVC =  nextVC(nibName: "nextVC", bundle: nil)
                nextVC.modalPresentationStyle = .fullScreen
                 self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    
    
}
