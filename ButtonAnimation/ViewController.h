//
//  ViewController.h
//  ButtonAnimation
//
//  Created by Neil Dy on 9/23/14.
//  Copyright (c) 2014 Rexen Dy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+AddMethod.h"

#import "DACircularProgressView.h"

@interface ViewController : UIViewController
{
    UIButton *btnCircle;
    UIButton *btnBackView;
    UIImageView *cloudView;
    
    DACircularProgressView *circleProgressBar;
    
    NSTimer *timer;
}

- (void)clickBtn;

- (void)startAnimation;
@end
