//
//  UIColor+AddMethod.h
//  ButtonAnimation
//
//  Created by Neil Dy on 9/23/14.
//  Copyright (c) 2014 Rexen Dy. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BG_COLOR @"c2c7d2"
#define PROGRESS_COLOR @"e2bf88"

@interface UIColor (AddMethod)

+ (UIColor *)returnColorWithHexCode:(NSString *)stringColor;
@end
