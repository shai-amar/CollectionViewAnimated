//
//  SAGradientBackgroundLayer.m
//  CollectionViewAnimated
//
//  Created by Shai Amar on 5/27/14.
//  Copyright (c) 2014 Shadow. All rights reserved.
//

#import "SAGradientBackgroundLayer.h"

@implementation SAGradientBackgroundLayer

/* 
 This method starts with Black gradient background
 and ends with a clear transparent background.
 
 */
+ (CAGradientLayer*) blackGradient
{
    UIColor *colorOne = [UIColor colorWithRed:(120/255.0) green:(135/255.0) blue:(150/255.0) alpha:0.0];
    UIColor *colorTwo = [UIColor colorWithRed:(0.0/255.0)  green:(0.0/255.0)  blue:(0.0/255.0)  alpha:0.9];
    
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, nil];
    
    NSNumber *stopOne = [NSNumber numberWithFloat:0.5];
    NSNumber *stopTwo = [NSNumber numberWithFloat:1.0];
    
    NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo, nil];
    
    CAGradientLayer *headerLayer = [CAGradientLayer layer];
	headerLayer.colors = colors;
	headerLayer.locations = locations;
	
	return headerLayer;
}

@end
