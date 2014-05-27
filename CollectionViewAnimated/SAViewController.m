//
//  SAViewController.m
//  CollectionViewAnimated
//
//  Created by Shai Amar on 5/26/14.
//  Copyright (c) 2014 Shadow. All rights reserved.
//

#import "SAViewController.h"
#import "SADataObject.h"
#import "SACollectionViewCell.h"
#import "SADataObject.h"
#import "SAMyCollectionLayout.h"


@interface SAViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;


@end

@implementation SAViewController

@synthesize dataArray = _dataArray;

@synthesize myCollectionView = _myCollectionView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    SADataObject *dataObj1 = [self createObjectWithTitle:@"Batman" image:@"Batman"];
    SADataObject *dataObj2 = [self createObjectWithTitle:@"Superman" image:@"Superman"];
    SADataObject *dataObj3 = [self createObjectWithTitle:@"The Arrow" image:@"theArrow"];
    SADataObject *dataObj4 = [self createObjectWithTitle:@"Wonderwoman" image:@"wonderWoman"];
    
    NSLog(@"Data array:%@", self.dataArray);
    
    self.dataArray = [[NSArray alloc] initWithObjects:dataObj1, dataObj2, dataObj3, dataObj4, nil];
    
    NSLog(@"Data array size:%lu", (unsigned long)[self.dataArray count]);
    
    for (int i=0; i<4; i++)
    {
        SADataObject *data = [self.dataArray objectAtIndex:i];
        NSLog(@"Data object:%@", data);
    }
    
    self.myCollectionView.dataSource = self;
    self.myCollectionView.delegate = self;
    self.myCollectionView.collectionViewLayout = [[SAMyCollectionLayout alloc] init];
}

- (SADataObject *)createObjectWithTitle:(NSString *)title image:(NSString *)imageName
{
    SADataObject *data = [[SADataObject alloc] init];
    
    data.imageName = imageName;
    data.title = title;
    
    return data;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SACollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewID" forIndexPath:indexPath];
    
    //  CONFIGURE THE CELL
    //  Get the image
    SADataObject  *dataObject = [self.dataArray objectAtIndex:indexPath.item];
    cell.imageName = dataObject.imageName;
    cell.title = dataObject.title;
        
    return cell;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"Collection size:%lu", (unsigned long)[self.dataArray count]);
    
    return [self.dataArray count];
}



@end

















