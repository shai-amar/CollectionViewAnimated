//
//  SADataObject.m
//  CollectionViewAnimated
//
//  Created by Shai Amar on 5/26/14.
//  Copyright (c) 2014 Shadow. All rights reserved.
//

#import "SADataObject.h"

@implementation SADataObject

@synthesize imageName = _imageName;
@synthesize title     = _title;

- (NSString *)description
{
    NSString *desc = [NSString stringWithFormat:@"Data Object:[Image name:%@, Title:%@]", self.imageName, self.title];
    
    return desc;
}

@end
