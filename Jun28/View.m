//
//  View.m
//  Jun28
//
//  Created by Jim Haughwout on 6/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "View.h"
#import "Ball.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.backgroundColor = [UIColor whiteColor];
		CGFloat radius = 20;
        CGRect f = CGRectMake(self.bounds.size.width/2, self.bounds.size.height/2, 
							  radius, radius);
        ball = [[Ball alloc] initWithFrame: f];
        location = ball.center;
		target = ball.center;
		bounce = ball.center;
		[self addSubview: ball];
		
		// Initialize recognizers
		UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc]
												initWithTarget: self action: @selector(swipe:)
												];
		recognizer.direction = UISwipeGestureRecognizerDirectionRight;
		[self addGestureRecognizer: recognizer];
		
		recognizer = [[UISwipeGestureRecognizer alloc]
					  initWithTarget: self action: @selector(swipe:)
					  ];
		recognizer.direction = UISwipeGestureRecognizerDirectionLeft;
		[self addGestureRecognizer: recognizer];
		
		recognizer = [[UISwipeGestureRecognizer alloc]
					  initWithTarget: self action: @selector(swipe:)
					  ];
		recognizer.direction = UISwipeGestureRecognizerDirectionUp;
		[self addGestureRecognizer: recognizer];
		
		recognizer = [[UISwipeGestureRecognizer alloc]
					  initWithTarget: self action: @selector(swipe:)
					  ];
		recognizer.direction = UISwipeGestureRecognizerDirectionDown;
		[self addGestureRecognizer: recognizer];
		
    }
    return self;
}

/*
// Touch moves to point
- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
    if (touches.count > 0) {
		
		[UIView beginAnimations: nil context: NULL];
		
		//Describe the animation itself.
		[UIView setAnimationDuration: 1.0];	//in seconds; default is 0.2
		[UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
		[UIView setAnimationRepeatCount: 1.0];	//The default is 1.0.
		
		//Describe what the animation should do.
		NSLog(@"Location = (%f,%f)",location.x, location.y); // Print current location
		target = [[touches anyObject] locationInView: self]; // Set target to touched point
		NSLog(@"Touch = (%f,%f)",target.x, target.y); // Print target 
		//ball.center = [[touches anyObject] locationInView: self];
		ball.center = target; // Move to target
		[UIView commitAnimations];
		location = target; // Reset location

		
		
    }
}

*/ 


// Swipe bounces off the wall
- (void) swipe: (UISwipeGestureRecognizer *) recognizer {
	target = [recognizer locationInView: self];
	NSLog(@"corner = (%f,%f)", self.bounds.size.width, self.bounds.size.height);
	NSString *direction = @"unknown";
	if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
		direction = @"→";
		bounce.x = self.bounds.size.width;
		bounce.y = (location.y + target.y) / 2;
		NSLog(@"Bounce %@ to (%f,%f) then (%f,%f)", 
			  direction, bounce.x, bounce.y, target.x, target.y); 
	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
		direction = @"←";
		bounce.x = 0;
		bounce.y = (location.y + target.y) / 2;
		NSLog(@"Bounce %@ to (%f,%f) then (%f,%f)", 
			  direction, bounce.x, bounce.y, target.x, target.y);
	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionUp) {
		direction = @"↑";
		bounce.x = (location.x + target.x) /2;
		bounce.y = 0;
		NSLog(@"Bounce %@ to (%f,%f) then (%f,%f)", 
			  direction, bounce.x, bounce.y, target.x, target.y);
	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionDown) {
		direction = @"↓";
		direction = @"↑";
		bounce.x = (location.x + target.x) /2;
		bounce.y = self.bounds.size.height;
		NSLog(@"Bounce %@ to (%f,%f) then (%f,%f)", 
			  direction, bounce.x, bounce.y, target.x, target.y);
	}


	[UIView animateWithDuration: 1.0
						  delay: 0.0
						options: UIViewAnimationOptionCurveEaseInOut
					 animations: ^{
						 ball.center = bounce;
					 }
					 completion: NULL
	 ];	
	[UIView animateWithDuration: 1.0
						  delay: 0.0
						options: UIViewAnimationOptionCurveEaseInOut
					 animations: ^{
						 ball.center = target;
					 }
					 completion: NULL
	 ];	
	
	/*
	[UIView setAnimationDuration: 1.0];	//in seconds; default is 0.2
	[UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
	[UIView setAnimationRepeatCount: 1.0];	//The default is 1.0.
	ball.center = bounce;
	ball.center = target;
	[UIView commitAnimations]; */
	location = target;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
