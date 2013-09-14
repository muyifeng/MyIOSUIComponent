//
//  UIButtonWithImage.m
//  UIComponent
//
//  Created by Eric Yang on 9/14/13.
//  Copyright (c) 2013 4everkid. All rights reserved.
//

#import "UIButtonWithImage.h"
#import "Utils.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIButtonWithImage

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Set default values
        self.shouldHighlightText = NO;
        self.shouldHighlightImage = NO;
        
        self.backgroundColor = [UIColor whiteColor];
        self.foregroundColor = [UIColor blackColor];
        self.layer.cornerRadius = 15;
        self.layer.masksToBounds = YES;
        self.shadowColor = [UIColor colorWithRed:0.64f green:0.23f blue:0.13f alpha:1.00f];
    }
    return self;
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    [super willMoveToWindow:newWindow];
    
    if (self.highlightedBackgroundColor == nil) {
        self.highlightedBackgroundColor = [self.backgroundColor darkenedColor];
    }
    
    if (self.highlightedForegroundColor == nil) {
        self.highlightedForegroundColor = [self.foregroundColor lightenedColor];
    }
    
    [self refreshTitleAndImage];
}

//#pragma mark - Setters
//
//- (void)setForegroundColor:(UIColor *)color
//{
//    self.foregroundColor = color;
//    self.highlightedForegroundColor = [color lightenedColor];
//    [self refreshTitleAndImage];
//}
//
//- (void)setHighlightedBackgroundColor:(UIColor *)color
//{
//    self.highlightedBackgroundColor = color;
//    [self refreshTitleAndImage];
//}
//
//- (void)setHilightedForegroundColor:(UIColor *)color
//{
//    self.highlightedForegroundColor = color;
//    [self refreshTitleAndImage];
//}
//
//- (void)setShouldHighlightText:(BOOL)highlight
//{
//    self.shouldHighlightText = highlight;
//    [self refreshTitleAndImage];
//}
//
//- (void)setShouldHighlightImage:(BOOL)highlight
//{
//    self.shouldHighlightImage = highlight;
//    [self refreshTitleAndImage];
//}

#pragma mark - Parent overrides

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    self.backgroundColor = highlighted ? self.highlightedBackgroundColor : self.backgroundColor;
    //    self.titleLabel.textColor = highlighted ? highlightedForegroundColor : buttonForegroundColor;
    //
    //    [self.imageView.image imageMaskWithColor:self.highlightedForegroundColor
    //                         shadowOffset:CGPointMake(0.0f, 0.0f)];
    
    [self setNeedsDisplay];
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    //    self.backgroundColor = selected ? highlightedBackgroundColor : buttonBackgroundColor;
    [self setBackgroundImage:[Utils imageFromColor:self.highlightedBackgroundColor] forState:UIControlStateSelected];
    [self setNeedsDisplay];
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    self.backgroundColor = enabled ? self.backgroundColor : self.highlightedBackgroundColor;
    [self setNeedsDisplay];
}

- (void)layoutSubviews
{
    // Allow default layout, then adjust image and label positions
    [super layoutSubviews];
    
    UIImageView *imageView = [self imageView];
    UILabel *label = [self titleLabel];
    
    CGRect imageFrame = imageView.frame;
    CGRect labelFrame = label.frame;
    
    labelFrame.origin.x = imageFrame.origin.x;
    imageFrame.origin.x = labelFrame.origin.x + CGRectGetWidth(labelFrame);
    imageFrame.origin.y = labelFrame.origin.y + 1;
    
    imageView.frame = imageFrame;
    label.frame = labelFrame;
}

#pragma mark - Appearance
- (void)setButtonTitle:(NSString *)title
{
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitle:title forState:UIControlStateHighlighted | UIControlStateSelected];
    
    [self setTitleColor:self.foregroundColor forState:UIControlStateNormal];
    
    [self setTitleColor:(self.shouldHighlightText ? self.highlightedForegroundColor : self.foregroundColor)
               forState:UIControlStateHighlighted | UIControlStateSelected];
    
}

- (void)setButtonImage:(UIImage *)image
{
    image = [image imageMaskWithColor:self.foregroundColor
                         shadowOffset:CGPointMake(0.0f, 0.0f)];
    
    [self setImage:image forState:UIControlStateNormal];
    
    if (self.shouldHighlightImage) {
        image = [image imageMaskWithColor:self.highlightedForegroundColor
                             shadowOffset:CGPointMake(0.0f, 0.0f)];
    }
    
    [self setImage:image forState:UIControlStateHighlighted | UIControlStateSelected];
}

#pragma mark - Utilities

- (void)refreshTitleAndImage
{
    [self setButtonTitle:self.titleLabel.text];
    [self setButtonImage:self.imageView.image];
}

- (void)setImage:(UIImage *)image title:(NSString *)title shadowColor:(UIColor *)color andHorizontalAlignment:(UIControlContentHorizontalAlignment)horizontalAlignment
{
    CALayer *titleTextLayer = self.titleLabel.layer;
    CALayer *imageLayer = self.imageView.layer;
    [Utils addShawdowForLayer:titleTextLayer WithColor:color];
    [Utils addShawdowForLayer:imageLayer WithColor:color];
    
    [self setContentHorizontalAlignment:horizontalAlignment];
    [self setButtonImage:image];
    [self setButtonTitle:title];
}

- (void)setImage:(UIImage *)image{
    [self setImage:image title:nil shadowColor:self.shadowColor andHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
}

@end
