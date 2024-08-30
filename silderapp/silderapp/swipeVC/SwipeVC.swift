//
//  SwipeVC.swift
//  silderapp
//
//  Created by MRT102 on 12/10/23.
//

import UIKit

class SwipeVC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate{
    @IBOutlet weak var myColl: UICollectionView!
    
    var arrNewImg = ["11","12","13","14","15","16"]
    var currentCellIndex2 = 0
    var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTimer()
       
        myColl.delegate = self
        myColl.dataSource = self
        myColl.register(UINib(nibName: "SwipeCVC", bundle: nil), forCellWithReuseIdentifier: "swipeCell")
       // pageControl.numberOfPages = arrNewImg.count
       
    }
    func setUpTimer(){
       
        print("timer again")
        timer = Timer.scheduledTimer(timeInterval: 02.8, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func previousBtn(_ sender: Any) {
        print("back")
        let collectionView = self.myColl
        let cellSize = CGRect(x: 0, y: 0, width: self.myColl.frame.width, height: self.view.frame.height)
        let contentOffset = collectionView!.contentOffset
        collectionView!.scrollRectToVisible(CGRect(x: contentOffset.x - cellSize.width, y: contentOffset.y, width: cellSize.width, height: cellSize.height), animated: true)
        self.currentCellIndex2 = self.currentCellIndex2 - 1
    }
    
    
    
    @IBAction func BtnNextImg(_ sender: Any) {
      //  timer?.invalidate()
        print("forward")
      
            let collectionView = self.myColl
            let cellSize = CGRect(x: 0, y: 0, width: self.myColl.frame.width, height: self.view.frame.height)
            let contentOffset = collectionView!.contentOffset
            collectionView!.scrollRectToVisible(CGRect(x: contentOffset.x + cellSize.width, y: contentOffset.y, width: cellSize.width, height: cellSize.height), animated: true)
            self.currentCellIndex2 = self.currentCellIndex2 + 1
        
    }
    
    @objc func slideToNext(){
        if currentCellIndex2 < arrNewImg.count-1 {
            
            myColl.scrollToItem(at: IndexPath(item: currentCellIndex2, section: 0), at: .centeredHorizontally, animated: true)
          
            
            currentCellIndex2 += 1
        }else {
            currentCellIndex2 = 0
            myColl.scrollToItem(at: IndexPath(item: currentCellIndex2, section: 0), at: .centeredHorizontally, animated: false)
        }
   
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
      
        let pageIndex = round(scrollView.contentOffset.x/myColl.frame.width)
        currentCellIndex2 = Int(pageIndex)
    
      //  print(currentCellIndex2)
       
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
   
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        currentCellIndex2 = Int(pageNumber)
     
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 600.00)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrNewImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myColl.dequeueReusableCell(withReuseIdentifier: "swipeCell", for: indexPath) as! SwipeCVC
        cell.myImage.image = UIImage(named: "\(arrNewImg[indexPath.row])")
        return cell
    }
}
