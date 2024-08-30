//
//  searchViewController.swift
//  playApp
//
//  Created by Priya on 19/09/23.
//

import UIKit

class searchViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
    @IBOutlet weak var recentSearchColl: UICollectionView!
    @IBOutlet weak var recentMusicColl: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(collectionView == recentSearchColl){
            return CGSize(width: 60, height: 300)
        }else{
            return CGSize(width: 300, height: 100)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == recentSearchColl){
            let cell = recentSearchColl.dequeueReusableCell(withReuseIdentifier: "musicCellOne", for: indexPath)
            return cell
        }else{
            let cell = recentMusicColl.dequeueReusableCell(withReuseIdentifier: "searchCellTwo", for: indexPath)
            return cell
        }
    }
    
}
