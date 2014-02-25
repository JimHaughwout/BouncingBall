//
//  View.h
//  Jun28
//
//  Created by Jim Haughwout on 6/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Ball;

@interface View : UIView {
	//CGFloat width;
	//CGFloat height;
	Ball *ball;
	CGPoint location;
	CGPoint bounce;
	CGPoint target;
	
}
@end




