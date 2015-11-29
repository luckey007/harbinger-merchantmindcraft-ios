//
//  CardDeatilsViewController.m
//  PaymentGateway
//
//  Created by Apple on 29/11/15.
//  Copyright © 2015 Apple. All rights reserved.
//

#import "CardDeatilsViewController.h"

@implementation CardDeatilsViewController

- (IBAction)payButtonClicked:(id)sender {
}


-(void)textFieldDidBeginEditing:(UITextField *)textField {
    if ([textField isEqual:_cardNumber] || [textField isEqual:_cvvNumber]) {
        [self loadToolBar:textField];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if ([textField isEqual:_cardNumber]) {
        
    }
}

-(void)loadToolBar:(UITextField *)textField{
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = @[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                            [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)]];
    [numberToolbar sizeToFit];
    textField.inputAccessoryView = numberToolbar;
}

-(void)doneWithNumberPad {
    [_cvvNumber resignFirstResponder];
    [_cardNumber resignFirstResponder];
}

@end
