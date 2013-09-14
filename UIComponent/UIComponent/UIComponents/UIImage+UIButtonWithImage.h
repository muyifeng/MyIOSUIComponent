//
//  UIImage+UIButtonWithImage.h
//  KidsGoal
//
//  Created by Eric Yang on 7/13/13.
//  Copyright (c) 2013 4everkid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (UIButtonWithImage)

- (UIImage *)imageMaskWithColor:(UIColor *)maskColor shadowOffset:(CGPoint)shadow;

@end
