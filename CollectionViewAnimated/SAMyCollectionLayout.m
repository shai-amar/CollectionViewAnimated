//
//  SAMyCollectionLayout.m
//  CollectionViewAnimated
//
//  Created by Shai Amar on 5/26/14.
//  Copyright (c) 2014 Shadow. All rights reserved.
//

#import "SAMyCollectionLayout.h"

#define ITEM_SIZE 100.0

@implementation SAMyCollectionLayout

#define ACTIVE_DISTANCE 100.0
#define ZOOM_FACTOR 0.25

- (id) init
{
    self = [super init];
    
    self.itemSize = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.sectionInset = UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0);
    self.minimumLineSpacing = 10.0;
    
    return self;
}


- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size   = self.collectionView.bounds.size;
    
    for(UICollectionViewLayoutAttributes *attributes in array)
    {
        if(CGRectIntersectsRect(attributes.frame, rect))
        {
            CGFloat distance = CGRectGetMidX(visibleRect) - attributes.center.x;
            CGFloat normelizedDistance = distance / ACTIVE_DISTANCE;
            
            if(ABS(distance) < ACTIVE_DISTANCE)
            {
                CGFloat zoom = 1 + ZOOM_FACTOR * (1 - ABS(normelizedDistance));
                attributes.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0);
                attributes.zIndex = round(zoom);
            }
        }
    }
    
    return array;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (CGPoint) targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGFloat offsetAdjustment = MAXFLOAT;
    CGFloat horizontalCenter = proposedContentOffset.x + (CGRectGetWidth(self.collectionView.bounds) / 2.0);
    
    CGRect targetRect = CGRectMake(proposedContentOffset.x,
                                   0.0,
                                   self.collectionView.bounds.size.width,
                                   self.collectionView.bounds.size.height);
    
    NSArray *array = [super layoutAttributesForElementsInRect:targetRect];
    
    for(UICollectionViewLayoutAttributes *layoutAttributes in array)
    {
        CGFloat itemHorizontalCenter = layoutAttributes.center.x;
        
        if(ABS(itemHorizontalCenter - horizontalCenter) < ABS(offsetAdjustment))
        {
            offsetAdjustment = itemHorizontalCenter - horizontalCenter;
        }
    }
    
    return CGPointMake(proposedContentOffset.x + offsetAdjustment, proposedContentOffset.y);
}




@end





















