//
//  MessageBubblesAppDelegate.h
//  MessageBubbles
//
//  Created by cwiles on 6/17/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MessageBubblesViewController;

@interface MessageBubblesAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MessageBubblesViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MessageBubblesViewController *viewController;

@end

