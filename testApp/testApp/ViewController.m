//
//  ViewController.m
//  testApp
//
//  Created by Jamal Moubarak on 11/12/13.
//  Copyright (c) 2013 Jamal Moubarak. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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

// Go to Add Event Page
-(IBAction)addOnClick:(id)sender
{
    AddEventController *AddEvent = [[AddEventController alloc] initWithNibName:@"AddEvent" bundle:nil];
    if (AddEvent != nil)
    {
        AddEvent.delegate = self;
        [self presentViewController:AddEvent animated:true completion:nil];
        NSLog(@"Add Event Button Pressed");
    }
}

-(void)eventSaved:(NSString*)EventSaved dateSaved:(NSString *)DateSaved
{
    // Add event text to text field and if event is present then append new text.
    NSString *eventText = [NSString stringWithFormat:@"\n\nNew Event: %@\n%@", EventSaved, DateSaved];
    if ([newEvents.text isEqualToString:@""])
    {
        newEvents.text = [NSString stringWithFormat:@"\nNew Event: %@\n%@", EventSaved, DateSaved];
    }
    else
    {
        newEvents.text = [newEvents.text stringByAppendingString:eventText];
    }
}

@end
