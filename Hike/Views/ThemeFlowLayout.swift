//
//  ThemeFlowLayout.swift
//  Hike
//
//  Created by Manuel Cubillo on 2/11/19.
//  Copyright © 2019 Manuel Cubillo. All rights reserved.
//

import UIKit

class ThemeFlowLayout: UICollectionViewFlowLayout {
    let standardItemAlpha: CGFloat = 0.5
    let standardItemScale: CGFloat = 0.7
    
    override func prepare() {
        super.prepare()
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        var attributesCopy = [UICollectionViewLayoutAttributes]()
        
        for itemAttributes in attributes! {
            let itemAttributesCopy = itemAttributes.copy() as! UICollectionViewLayoutAttributes
            
            changeLayoutAttributes(itemAttributesCopy)
            attributesCopy.append(itemAttributesCopy)
        }
        
        
        return attributesCopy
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true //update yourself whenever the collection view is scrolling
    }
    
    func changeLayoutAttributes(_ attributes: UICollectionViewLayoutAttributes) {
        let collectionCenter = collectionView!.frame.size.width/2
        let offset = collectionView!.contentOffset.x
        let normalizedCenter = attributes.center.x - offset
        
        let maxDistance = self.itemSize.width + self.minimumLineSpacing
        let distance = min(abs(collectionCenter - normalizedCenter), maxDistance)
        let ratio = (maxDistance - distance)/maxDistance

        if ratio < 0.9 { //outside of center
            attributes.alpha = standardItemAlpha
            attributes.transform3D = CATransform3DScale(CATransform3DIdentity, standardItemScale, standardItemScale, 1)
        } else { //in center
            attributes.alpha = 1.0
            attributes.transform3D = CATransform3DScale(CATransform3DIdentity, 1.0, 1.0, 1)
        }
    }
}
