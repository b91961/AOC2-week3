//
//  ViewController.h
//  testApp
//
//  Created by Jamal Moubarak on 11/12/13.
//  Copyright (c) 2013 Jamal Moubarak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddEventController.h"

@interface ViewController : UIViewController <AddEventDelegate>

{
    NSString *eventText;
    NSString *firstEventText;
    IBOutlet UITextView *newEvents;
}

-(IBAction)addOnClick:(id)sender;

@end
