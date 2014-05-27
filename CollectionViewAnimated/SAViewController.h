//
//  SAViewController.h
//  CollectionViewAnimated
//
//  Created by Shai Amar on 5/26/14.
//  Copyright (c) 2014 Shadow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SAViewController : UIViewController<UICollectionViewDelegate,
                                               UICollectionViewDataSource>


@property (strong, nonatomic) NSArray *dataArray;


@end
