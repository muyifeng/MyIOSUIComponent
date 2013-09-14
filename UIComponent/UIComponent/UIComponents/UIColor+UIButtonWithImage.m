//
//  UIColor+UIButtonWithImage.m
//  KidsGoal
//
//  Created by Eric Yang on 7/13/13.
//  Copyright (c) 2013 4everkid. All rights reserved.
//

#import "UIColor+UIButtonWithImage.h"

@implementation UIColor (UIButtonWithImage)

- (UIColor *)darkenedColor
{
    CGFloat h,s,b,a;
    [self getHue:&h saturation:&s brightness:&b alpha:&a];
    return [UIColor colorWithHue:h saturation:s brightness:b * 0.85f alpha:a];
}

- (UIColor *)lightenedColor
{
    CGFloat h,s,b,a;
    [self getHue:&h saturation:&s brightness:&b alpha:&a];
    return [UIColor colorWithHue:h saturation:s brightness:b * 1.15f alpha:a];
}

@end
