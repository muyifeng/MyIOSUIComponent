//
//  Utils.h
//  KidsGoal
//
//  Created by Eric Yang on 7/22/13.
//  Copyright (c) 2013 4everkid. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AppDelegate;
@class Record;

@interface Utils : NSObject

+ (void)addShawdowForLayer:(CALayer *)layer WithColor:(UIColor *)color;
+ (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize sourceImage:(UIImage *)srcimage;
+ (UIImage *)imageFromColor:(UIColor *)color;
+ (UILabel *)getAutoSizeLabelWithFrame:(CGRect)frame text:(NSString *)text andFont:(UIFont *)font;
+ (float)getContentHeightByWidth:(float)width text:(NSString *)text font:(UIFont *)font;
+ (AppDelegate *)AppDelegate;
+ (UILabel*)createLabelWithFontName:(NSString*)fontName fontSize:(CGFloat)fontSize textColor:(UIColor *)color;

+ (void)inspectRect:(CGRect)aRect withLabel:(NSString *)label;
@end
