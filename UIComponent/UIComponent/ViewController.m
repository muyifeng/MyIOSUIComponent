//
//  ViewController.m
//  UIComponent
//
//  Created by Eric Yang on 9/14/13.
//  Copyright (c) 2013 4everkid. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor colorWithHue:0.47f saturation:1.00f brightness:0.82f alpha:1.00f];
    
    self.button1 = [[UIRoundedImageButton alloc] initWithFrame:CGRectMake(20, 20, 96, 96)];
    [self.button1 setImage:[UIImage imageNamed:@"head1.jpeg"] forState:UIControlStateNormal];
    
    self.button2 = [[UIButtonWithImage alloc] initWithFrame:CGRectMake(40, 120, 128, 64)];
    [self.button1 setTitle:@"Heart" forState:UIControlStateNormal];
    [self.button2 setButtonImage:[UIImage imageNamed:@"icon-heart-plus"]];
    self.button2.backgroundColor = [UIColor colorWithHue:0.58f saturation:0.94f brightness:0.99f alpha:1.00f];
    self.button2.highlightedBackgroundColor = [UIColor colorWithHue:0.58f saturation:0.94f brightness:0.59f alpha:1.00f];
    
    [self.view addSubview:self.button1];
    [self.view addSubview:self.button2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
