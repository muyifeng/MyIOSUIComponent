//
//  UIRoundedImageButton.h
//  UIComponent
//
//  Created by Eric Yang on 9/14/13.
//  Copyright (c) 2013 4everkid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIRoundedImageButton : UIButton

@property (nonatomic, strong) UIColor *buttonBorderColor;
@property (nonatomic, assign) CGFloat buttonBorderWidth;
@property (nonatomic, strong) UIColor *buttonShadowColor;
@property (nonatomic, assign) CGSize buttonShadowOffset;
@property (nonatomic, assign) CGFloat buttonShadowOpacity;

@end
