//
//  AddEventController.m
//  testApp
//
//  Created by Jamal Moubarak on 11/12/13.
//  Copyright (c) 2013 Jamal Moubarak. All rights reserved.
//

#import "AddEventController.h"

@interface AddEventController ()

@end

@implementation AddEventController

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibnameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibnameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        delegate = nil;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//  Close keyboard button
-(IBAction)onClose:(id)sender
{
    [newEventText resignFirstResponder];
    NSLog(@"Close Keyboard Pressed");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    //  Dispose of any resources that can be recreated.
}

-(IBAction)onSave:(id)sender
{
    // Save Event settings.
    UIBarButtonItem *saveEvent = (UIBarButtonItem*)sender;
    if (saveEvent != nil)
    {
        //  Saves text entered in the text field.
        newEventSaved = newEventText.text;
        //  Error Alert if there is no text in the text field.
        if ([newEventText.text length] == 0)
        {
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"ERROR"
                                  message:@"You have not entered any text"
                                  delegate:nil
                                  cancelButtonTitle:@"Close"
                                  otherButtonTitles:nil];
            [alert show];
            NSLog(@"Save pressed with empty text field");
            
        }
        else if ([newEventText.text length] >= 1)
        {
            NSLog(@"Save was pressed");
            NSLog(@"%@", newEventSaved);
            
            // delegate that passes eventSaved and dateSaved to ViewController
            [delegate eventSaved:newEventSaved dateSaved:dateString];
            
            [self dismissViewControllerAnimated:TRUE completion:nil];
        }
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.text = [NSString stringWithFormat:@""];
}

//  Date Picker
-(IBAction)onPick:(id)sender
{
    UIDatePicker *DatePicker = (UIDatePicker*)sender;
    if (DatePicker != nil)
    {
        DatePicker.minimumDate = [NSDate date];
        NSDate *datePicked = [DatePicker date];
        if(datePicked != nil)
        {
            // Format the date
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
            if (dateFormat != nil)
            {
                [dateFormat setDateFormat:@"MMMM dd, h:mm a"];
            }
            dateString = [dateFormat stringFromDate:datePicked];
            NSLog(@"%@", dateString);
        }
    }
}

@end
