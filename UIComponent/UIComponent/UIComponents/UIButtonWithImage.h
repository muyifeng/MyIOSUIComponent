//
//  UIButtonWithImage.h
//  UIComponent
//
//  Created by Eric Yang on 9/14/13.
//  Copyright (c) 2013 4everkid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+UIButtonWithImage.h"
#import "UIImage+UIButtonWithImage.h"

@interface UIButtonWithImage : UIButton

//@property (strong, nonatomic) UIColor *buttonBackgroundColor;
@property (strong, nonatomic) UIColor *foregroundColor;
@property (strong, nonatomic) UIColor *highlightedBackgroundColor;
@property (strong, nonatomic) UIColor *highlightedForegroundColor;
@property (assign, nonatomic) BOOL shouldHighlightText;
@property (assign, nonatomic) BOOL shouldHighlightImage;
@property (assign, nonatomic) BOOL activate;
@property (assign, nonatomic) CGRect buttonImageFrame;
@property (nonatomic, strong) UIColor *shadowColor;

#pragma mark - Appearance
- (void)setButtonTitle:(NSString *)title;
- (void)setButtonImage:(UIImage *)image;

- (void)setImage:(UIImage *)image title:(NSString *)title shadowColor:(UIColor *)color andHorizontalAlignment:(UIControlContentHorizontalAlignment)horizontalAlignment;

- (void)setImage:(UIImage *)image;

@end
