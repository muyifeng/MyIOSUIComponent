//
//  Utils.m
//  KidsGoal
//
//  Created by Eric Yang on 7/22/13.
//  Copyright (c) 2013 4everkid. All rights reserved.
//

#import "Utils.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@implementation Utils

+ (void)addShawdowForLayer:(CALayer *)layer WithColor:(UIColor *)color
{
    layer.shadowColor = color.CGColor;
    layer.shadowOffset = CGSizeMake(0, 1);
    layer.shadowOpacity = 1;
    layer.shadowRadius = 0;
}

+ (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize sourceImage:(UIImage *)srcimage
{
    UIImage *sourceImage = srcimage;
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);

    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;

        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;

        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else
            if (widthFactor < heightFactor)
            {
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
            }
    }

    UIGraphicsBeginImageContext(targetSize); // this will crop

    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;

    [sourceImage drawInRect:thumbnailRect];

    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil)
        NSLog(@"could not scale image");

    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)imageFromColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UILabel *)getAutoSizeLabelWithFrame:(CGRect)frame text:(NSString *)text andFont:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.font = font;
    label.text = text;
    label.numberOfLines = 0;
    [label sizeToFit];
    return label;
}

+ (float)getContentHeightByWidth:(float)width text:(NSString *)text font:(UIFont *)font
{
    UILabel *label = [self getAutoSizeLabelWithFrame:CGRectMake(0, 0, width, 0) text:text andFont:font];
    return label.frame.size.height;
}

+ (AppDelegate *)AppDelegate
{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return delegate;
}

+ (UILabel*)createLabelWithFontName:(NSString*)fontName fontSize:(CGFloat)fontSize textColor:(UIColor *)color{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.font = [UIFont fontWithName:fontName size:fontSize];
    label.textColor = color;
    label.numberOfLines = 0;
    return label;
}

+ (void)inspectRect:(CGRect)aRect withLabel:(NSString *)label{
    NSLog(@"%@, Origin: (%f, %f), Size: (%f, %f)", label, CGRectGetMinX(aRect), CGRectGetMinY(aRect), CGRectGetWidth(aRect), CGRectGetHeight(aRect));
}
@end
