//
//  CardDeatilsViewController.h
//  PaymentGateway
//
//  Created by Apple on 29/11/15.
//  Copyright © 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardDeatilsViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *cardName;

@property (weak, nonatomic) IBOutlet UITextField *cardNumber;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (weak, nonatomic) IBOutlet UITextField *cvvNumber;

@property (weak, nonatomic) IBOutlet UISwitch *shouldSaveCard;

- (IBAction)payButtonClicked:(id)sender;

@end
