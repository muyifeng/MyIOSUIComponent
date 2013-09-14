//
//  UIRoundedImageButton.m
//  UIComponent
//
//  Created by Eric Yang on 9/14/13.
//  Copyright (c) 2013 4everkid. All rights reserved.
//

#import "UIRoundedImageButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIRoundedImageButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Set default values
        self.backgroundColor = [UIColor clearColor];
        self.buttonBorderColor = [UIColor whiteColor];
        self.buttonBorderWidth = 2;
        self.buttonShadowColor = [UIColor blackColor];
        self.buttonShadowOffset = CGSizeMake(0, 1);
        self.buttonShadowOpacity = 0.5;
//        self.buttonImage = [UIImage imageNamed:@"someDefaultImage"];
    }
    return self;
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    [super willMoveToWindow:newWindow];
    [self addImage];
}

#pragma mark - Private instance methods

- (void)addImage {
    CALayer *layer = self.layer;
    CGFloat cornerRadius = (CGRectGetWidth(self.bounds) - self.buttonBorderWidth)/2;
    
    layer.borderWidth = self.buttonBorderWidth;
    layer.cornerRadius = cornerRadius;
    layer.borderColor = self.buttonBorderColor.CGColor;
    layer.shadowColor = self.buttonShadowColor.CGColor;
    layer.shadowOffset = self.buttonShadowOffset;
    layer.shadowOpacity = self.buttonShadowOpacity;
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.layer.masksToBounds = YES;
    self.imageView.layer.cornerRadius = cornerRadius;
}

@end
