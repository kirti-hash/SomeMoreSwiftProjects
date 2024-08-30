//
//  FirstVC.swift
//  OnboardingIOS
//
//  Created by MRT102 on 17/10/23.
//

import UIKit

class FirstVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
 
    
    @IBOutlet weak var PageControl: UIPageControl!
    
    @IBOutlet weak var ClvMyCollection: UICollectionView!
    
    var arrColor:[UIColor] = [.systemBlue,.systemGreen,.systemPink,.systemMint]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ClvMyCollection.delegate = self
        ClvMyCollection.dataSource = self
        PageControl.numberOfPages = arrColor.count
        ClvMyCollection.register(UINib(nibName: "FirstCVC", bundle: nil), forCellWithReuseIdentifier: "FirstCVC")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrColor.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextVC =  SecondVC(nibName: "SecondVC", bundle: nil)
                nextVC.modalPresentationStyle = .fullScreen
                 self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ClvMyCollection.frame.size.width, height: 725)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ClvMyCollection.dequeueReusableCell(withReuseIdentifier: "FirstCVC", for: indexPath) as! FirstCVC
        
        cell.MyView.backgroundColor = arrColor[indexPath.row]
        print(indexPath.row)
        cell.tblcontent.reloadData()
        return cell
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        PageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        //print(PageControl.currentPage)
    }
}
