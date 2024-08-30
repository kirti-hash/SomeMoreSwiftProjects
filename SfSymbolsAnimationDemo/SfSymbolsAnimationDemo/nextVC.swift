//
//  nextVC.swift
//  SfSymbolsAnimationDemo
//
//  Created by MRT102 on 03/01/24.
//

import UIKit

class nextVC: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var bottomSheet: UIView!
    
    var translation: CGPoint!
    var startPosition: CGPoint! //Start position for the gesture transition
    var originalHeight: CGFloat = 0 // Initial Height for the UIView
    var difference: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        bottomSheet.layer.cornerRadius = 10
        bottomSheet.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        let panGesture = UIPanGestureRecognizer(target: self, action:(#selector(self.handleGesture(_:))))
        self.bottomSheet.addGestureRecognizer(panGesture)

        
    }
    @objc func handleGesture(_ sender: UIPanGestureRecognizer) {
        
        switch sender.state {
        case .began:
            print("began")
            startPosition = sender.location(in: bottomSheet)
            //  print("****\(startPosition)")
        case .changed:
            print("changed")
            let endPosition = sender.location(in: bottomSheet) // the posiion at which PanGesture Ended
            difference = endPosition.y - startPosition.y
            print(difference!)
            // print(".......\(endPosition)")
            
            
            //MARK: for whole screen pan gesture
            /*
             translation = sender.translation(in: self.view)
             sender.setTranslation(CGPoint(x: 0.0, y: 0.0), in: self.view)
             let endPosition = sender.location(in: bottomSheet) // the posiion at which PanGesture Ended
             difference = endPosition.y - startPosition.y
             print(difference!)
             print(".......\(endPosition)")
             
             var newFrame = bottomSheet.frame
             newFrame.origin.x = bottomSheet.frame.origin.x
             newFrame.origin.y = bottomSheet.frame.origin.y + difference //Gesture Moving Upward will produce a negative value for difference
             newFrame.size.width = bottomSheet.frame.size.width
             newFrame.size.height = bottomSheet.frame.size.height - difference //Gesture Moving Upward will produce a negative value for difference
             bottomSheet.frame = newFrame
             */
            
        case .cancelled:
            print("cancelled")
        case .ended:
            
            let velocity = sender.velocity(in: view)
            if velocity.y > 0 {
                print("panning down")
                if bottomSheet.frame.size.height > 200 {
                    
                    if difference > 300 {
                        
                        UIView.animate(withDuration: 0.5) {
                            self.bottomSheet.alpha = 1
                            self.bottomSheet.frame.size.height = self.bottomSheet.frame.size.height - 500
                            self.bottomSheet.frame.origin.y = self.bottomSheet.frame.origin.y + (500)
                            
                        }
                    }else {
                        UIView.animate(withDuration: 0.5) {
                            self.bottomSheet.alpha = 1
                            self.bottomSheet.frame.size.height = self.bottomSheet.frame.size.height - 250
                            self.bottomSheet.frame.origin.y = self.bottomSheet.frame.origin.y + (250)
                        }
                    }
                }
                } else {
                    print("panning up")
                    if bottomSheet.frame.size.height < 650 {
                        UIView.animate(withDuration: 0.5) {
                            self.bottomSheet.alpha = 1
                            self.bottomSheet.frame.size.height = self.bottomSheet.frame.size.height + 250
                            self.bottomSheet.frame.origin.y = self.bottomSheet.frame.origin.y + (-250)
                        }
                    }
                }
            print("ended")
        default:
           break
            }
       
        }
        }



