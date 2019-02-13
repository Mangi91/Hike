//
//  HikeViewController+CollectionView.swift
//  Hike
//
//  Created by Manuel Cubillo on 2/12/19.
//  Copyright © 2019 Manuel Cubillo. All rights reserved.
//

import UIKit

extension HikeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return themeImageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"ThemeCell", for: indexPath) as! ThemeCollectionViewCell
        
        if themeImageNames[indexPath.row] == "" {
            cell.isHidden = true
        } else {
            cell.isHidden = false
            cell.theme.image = UIImage(named:themeImageNames[indexPath.row])
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 60)
    }
}
