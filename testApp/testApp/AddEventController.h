//
//  AddEventController.h
//  testApp
//
//  Created by Jamal Moubarak on 11/12/13.
//  Copyright (c) 2013 Jamal Moubarak. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddEventDelegate <NSObject>

@required
-(void)eventSaved:(NSString*)EventSaved dateSaved:(NSString *)DateSaved;

@end

@interface AddEventController : UIViewController <UITextFieldDelegate>
{
    id<AddEventDelegate> delegate;
    IBOutlet UITextField *newEventText;
    IBOutlet UIDatePicker *datePicker;
    NSString *newEventSaved;
    NSString *dateString;
}

-(IBAction)onClose:(id)sender;
-(IBAction)onPick:(id)sender;
-(IBAction)onSave:(id)sender;

@property (strong) id<AddEventDelegate> delegate;

@end
