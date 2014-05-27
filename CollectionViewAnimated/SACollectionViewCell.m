//
//  SACollectionViewCell.m
//  CollectionViewAnimated
//
//  Created by Shai Amar on 5/26/14.
//  Copyright (c) 2014 Shadow. All rights reserved.
//

#import "SACollectionViewCell.h"
#import "SAGradientBackgroundLayer.h"


@interface SACollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation SACollectionViewCell

@synthesize imageView   = _imageView;
@synthesize imageName   = _imageName;
@synthesize titleLabel  = _titleLabel;
@synthesize title       = _title;


#pragma mark Getters & Setters

- (void) setTitle:(NSString *)title
{
    _title = title;
    
    _titleLabel.text = title;
}

- (void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    
    //  Get the icon image
    NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:@"jpg"];
    UIImage  *image = [UIImage imageWithContentsOfFile:path];

    _imageView.image = image;
    
    CAGradientLayer *bgLayer = [SAGradientBackgroundLayer blackGradient];
    bgLayer.frame = _imageView.bounds;
    [_imageView.layer insertSublayer:bgLayer atIndex:0];

}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
