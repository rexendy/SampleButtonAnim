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
    
    btnBackView = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnBackView setFrame:CGRectMake(10, 100, 150, 50)];
    [btnBackView setBackgroundColor:[UIColor returnColorWithHexCode:BG_COLOR]];
    [btnBackView setTitle:@"Download" forState:UIControlStateNormal];
    [btnBackView.titleLabel setFont:[UIFont fontWithName:@"Market_Deco.ttf" size:12]];
    [btnBackView.titleLabel setTextAlignment:NSTextAlignmentRight];
    [btnBackView.layer setCornerRadius:20];
    [btnBackView.layer setBorderWidth:5.0f];
    [btnBackView.layer setBorderColor:[UIColor returnColorWithHexCode:BG_COLOR].CGColor];
    [self.view addSubview:btnBackView];

    
    circleProgressBar = [[DACircularProgressView alloc] initWithFrame:CGRectMake(58, 100, 50, 50)];
    circleProgressBar.roundedCorners = YES;
    circleProgressBar.tintColor = [UIColor clearColor];
    circleProgressBar.progressTintColor = [UIColor returnColorWithHexCode:PROGRESS_COLOR];
    [self.view addSubview:circleProgressBar];
    [circleProgressBar setAlpha:0];
    
    UIImage *btnImage = [UIImage imageNamed:@"Button.png"];
    btnCircle = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnCircle setFrame:CGRectMake(10, 103, 45, 45)];
    [btnCircle setBackgroundImage:btnImage forState:UIControlStateNormal];
    [self.view addSubview:btnCircle];
    [btnCircle addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    
    cloudView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 15, 15)];
    [cloudView setImage:[UIImage imageNamed:@"Cloud_Off.png"]];
    [btnCircle addSubview:cloudView];

    
}

- (void)setBackFrame
{
    [btnBackView setFrame:CGRectMake(10, 100, 150, 50)];
    [circleProgressBar setAlpha:0];
    [cloudView setImage:[UIImage imageNamed:@"Cloud_Off.png"]];
    [btnCircle setFrame:CGRectMake(10, 103, 45, 45)];
    [btnBackView setTitle:@"Download" forState:UIControlStateNormal];
}

- (void)clickBtn
{
    [self setBackFrame];
    [self performSelector:@selector(startButtonAnimation) withObject:nil afterDelay:0.5];
}

- (void)startButtonAnimation
{
    [UIView animateWithDuration: 10
                          delay: 5
         usingSpringWithDamping: 5
          initialSpringVelocity: 2
                        options: 0
                     animations: ^
     {
         
         CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
         [animation setFromValue:[NSNumber numberWithFloat:30]];
         [animation setToValue:[NSNumber numberWithFloat:60]];
         [animation setDuration:5];
         [btnCircle.layer addAnimation:animation forKey:@"animateLayer"];
         // btnCircle.transform = CGAffineTransformMakeRotation(360);
         
         
     }
                     completion: ^(BOOL finished){
                         [btnCircle setFrame:CGRectMake(60, 103, 45, 45)];
                     }
     ];
    
    
    [UIView animateWithDuration: 10
                          delay: 5
         usingSpringWithDamping: 5
          initialSpringVelocity: .8
                        options: 0
                     animations: ^
     {
         [btnBackView setTitle:@"" forState:UIControlStateNormal];
         [btnBackView setFrame:CGRectMake(btnBackView.frame.origin.x + 45, btnBackView.frame.origin.y, btnBackView.frame.size.width - 95, btnBackView.frame.size.height)];
         [[btnBackView layer] setCornerRadius:22];
        // [[btnBackView titleLabel] setAlpha:0];
     }
                     completion:nil
     ];
    
    [self performSelector:@selector(startAnimation) withObject:nil afterDelay:10];
}

- (void)startAnimation
{
    
    [circleProgressBar setAlpha:1];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(processProgress) userInfo:nil repeats:YES];
}

- (void)processProgress
{
    if (circleProgressBar.progress >= 1.0f) {
        [timer invalidate];
         [cloudView setImage:[UIImage imageNamed:@"Cloud_On.png"]];
    }
    else
    {
        circleProgressBar.progress += 0.01f;
    }
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
