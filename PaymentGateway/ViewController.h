//
//  ViewController.h
//  PaymentGateway
//
//  Created by Apple on 28/11/15.
//  Copyright © 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebService.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, ResponseDelegate>
{
   
}
    
@property (weak, nonatomic) IBOutlet UITableView *paymentOptionsTableView;
@property (nonatomic, strong) NSIndexPath *lastIndexPath;
@property (nonatomic, strong) NSMutableArray *paymentNames;

@end

