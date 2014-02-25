//
//  Ball.m
//  Jun28
//
//  Created by Jim Haughwout on 6/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Ball.h"

@implementation Ball

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.backgroundColor = [UIColor clearColor];

    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
	CGFloat radius = 20;
	CGFloat red = 1.0;
	CGFloat green = 0;
	CGFloat blue = 0;
	CGFloat alpha = 0.5;
	
	CGRect r = CGRectMake(0, 0, radius, radius);
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextBeginPath(c); //unnecessary here: the path is already empty.
    CGContextAddEllipseInRect(c, r);
    CGContextSetRGBFillColor(c, red, green, blue, alpha);	//red, 50% opaque
    CGContextFillPath(c);
}


@end
