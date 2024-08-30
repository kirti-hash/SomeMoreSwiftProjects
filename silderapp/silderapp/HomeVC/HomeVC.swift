//
//  HomeVC.swift
//  silderapp
//
//  Created by MRT102 on 11/10/23.
//

import UIKit

class HomeVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate {
  
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var clvCollection: UICollectionView!
    
    var arrNewImg = ["1","2","3","4","5","6","7","8","9","10"]
    var currentCellIndex = 0
    var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        doLongSyncTaskInSerialQueue()
//        doLongAsyncTaskInSerialQueue()
//        doLongSyncTaskInConcurrentQueue()
//        doLongASyncTaskInConcurrentQueue()
        
      
        
        
        DispatchQueue.global().async {
            print("Generic global queue")
        }
        
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
       
        clvCollection.delegate = self
        clvCollection.dataSource = self
        clvCollection.register(UINib(nibName: "myCVC", bundle: nil), forCellWithReuseIdentifier: "cell")
        pageControl.numberOfPages = arrNewImg.count
       
    }

    func doLongAsyncTaskInSerialQueue() {

      let serialQueue = DispatchQueue(label: "com.queue.Serial")
        
           serialQueue.async {

               if Thread.isMainThread{
                   print("task running in main thread...1")
                   
               }else{
                   print("task running in background thread....2")
               }
          
           
       }
   }
    func doLongSyncTaskInSerialQueue() {
        let serialQueue = DispatchQueue(label: "com.queue.Serial")
        
        serialQueue.sync {
            if Thread.isMainThread{
                print("task running in main thread....3")
            }else{
                print("task running in background thread....4")
            }
            
        }
    }
    
    func doLongASyncTaskInConcurrentQueue() {
        let concurrentQueue = DispatchQueue(label: "com.queue.Concurrent", attributes: .concurrent)
        for i in 1...5 {
            concurrentQueue.async {
                if Thread.isMainThread{
                    print("task running in main thread....5")
                }else{
                    print("task running in background thread....6")
                }
              
            }
            print("\(i) executing")
        }
    }
    
    func doLongSyncTaskInConcurrentQueue() {
      let concurrentQueue = DispatchQueue(label: "com.queue.Concurrent", attributes: .concurrent)
        for i in 1...5 {
            concurrentQueue.sync {
                if Thread.isMainThread{
                    print("task running in main thread....7")
                }else{
                    print("task running in background thread....8")
                }
             
            }
            print("\(i) executed")
        }
    }
    
    
    
    
    @IBAction func BtnNextVC(_ sender: Any) {
        
        let nextVC =  SwipeVC(nibName: "SwipeVC", bundle: nil)
        nextVC.modalPresentationStyle = .custom
        self.navigationController?.pushViewController(nextVC, animated: true)
    
    }
    
    @objc func slideToNext(){
        if currentCellIndex < arrNewImg.count-1 {
            pageControl.currentPage = currentCellIndex
            //print(currentCellIndex)
            currentCellIndex += 1
        }else {
            currentCellIndex = 0
        }
        pageControl.currentPage = currentCellIndex
        clvCollection.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
      
        let pageIndex = round(scrollView.contentOffset.x/clvCollection.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
   
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 400.00)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrNewImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clvCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCVC
        cell.myImg.image = UIImage(named: "\(arrNewImg[indexPath.row])")
        return cell
    }
}
