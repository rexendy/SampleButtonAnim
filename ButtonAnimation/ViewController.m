//
//  ViewController.m
//  ButtonAnimation
//
//  Created by Neil Dy on 9/23/14.
//  Copyright (c) 2014 Rexen Dy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView
{
    CGRect fullScreen = [[UIScreen mainScreen] applicationFrame];
    
    self.view = [[UIView alloc] initWithFrame:fullScreen];
    //[self.view setBackgroundColor:[UIColor returnColorWithHexCode:BG_COLOR]];
    
    UIButton *btnprogress = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnprogress setFrame:CGRectMake(10, 102, 150, 50)];
    [btnprogress setBackgroundColor:[UIColor returnColorWithHexCode:BG_COLOR]];
    [btnprogress setTitle:@"Download" forState:UIControlStateNormal];
    [btnprogress.titleLabel setFont:[UIFont fontWithName:@"Market_Deco.ttf" size:12]];
    [btnprogress.titleLabel setTextAlignment:NSTextAlignmentRight];
    [btnprogress.layer setCornerRadius:20];
    [btnprogress.layer setBorderWidth:5.0f];
    [btnprogress.layer setBorderColor:[UIColor returnColorWithHexCode:BG_COLOR].CGColor];
    [self.view addSubview:btnprogress];

    
    UIImage *btnImage = [UIImage imageNamed:@"Button.png"];
    buttonView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 103, 45, 45)];
    [buttonView setImage:btnImage];
    [self.view addSubview:buttonView];
    
    UIImageView *cloudView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 15, 15)];
    [cloudView setImage:[UIImage imageNamed:@"Cloud_Off.png"]];
    [buttonView addSubview:cloudView];
    
    [UIView animateWithDuration: 10
                          delay: 5
         usingSpringWithDamping: 5
          initialSpringVelocity: 2
                        options: 0
                     animations: ^
     {
         
         CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
         [animation setFromValue:[NSNumber numberWithFloat:btnprogress.frame.origin.x + 20]];
         [animation setToValue:[NSNumber numberWithFloat:60]];
         [animation setDuration:5];
         [buttonView.layer addAnimation:animation forKey:@"animateLayer"];
         buttonView.transform = CGAffineTransformMakeRotation(360);
         [cloudView setImage:[UIImage imageNamed:@"Cloud_Off.png"]];

        
     }
                     completion: nil
     ];
    
    
    [UIView animateWithDuration: 10
                          delay: 5
         usingSpringWithDamping: 5
          initialSpringVelocity: .8
                        options: 0
                     animations: ^
     {
         
         [btnprogress setTitle:@"" forState:UIControlStateNormal];
        [btnprogress setFrame:CGRectMake(buttonView.frame.origin.x + 2, btnprogress.frame.origin.y, btnprogress.frame.size.width - 100, btnprogress.frame.size.height)];
         
         [cloudView setImage:[UIImage imageNamed:@"Cloud_On.png"]];
     }
                     completion: nil
     ];

    
   
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
