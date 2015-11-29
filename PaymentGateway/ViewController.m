//
//  ViewController.m
//  PaymentGateway
//
//  Created by Apple on 28/11/15.
//  Copyright © 2015 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIView *blurrView;
    UIActivityIndicatorView *activityIndicator;
    UILabel *lblPleaseWait;
}

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self showLoadingView];
    
    WebService *webService = [[WebService alloc]init];
    webService.responseDelegate = self;
    [webService getPaymentModes];
    
    // Do any additional setup after loading the view, typically from a nib.
    _paymentOptionsTableView.delegate = self;
    _paymentOptionsTableView.dataSource = self;
    _paymentOptionsTableView.allowsSelection = YES;
}

- (void)showLoadingView {
    self.navigationController.navigationBar.hidden = YES;
    
    blurrView = [[UIView alloc]initWithFrame:self.view.frame];
    blurrView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:blurrView];
    
    activityIndicator = [[UIActivityIndicatorView alloc]init];
    activityIndicator.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    activityIndicator.color = [UIColor whiteColor];
    [activityIndicator startAnimating];
    [blurrView addSubview:activityIndicator];
    
    lblPleaseWait = [[UILabel alloc]initWithFrame:CGRectMake(activityIndicator.frame.origin.x - 50, activityIndicator.frame.origin.y + activityIndicator.frame.size.height, 150, 100)];
    
    lblPleaseWait.text = @"Please Wait...";
    
    lblPleaseWait.textColor = [UIColor  whiteColor];
    
    [blurrView addSubview:lblPleaseWait];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _paymentNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil )
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [_paymentNames objectAtIndex:indexPath.row];

    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _lastIndexPath = indexPath;
    //NSLog(@"didSelectRowAtIndexPath %ld", indexPath.row);
    [_paymentOptionsTableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSLog(@"didDeselectRowAtIndexPath %ld", indexPath.row);
    [_paymentOptionsTableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
}


#pragma mark Response Delegate

-(void)responseReceived:(NSMutableArray *)response{
    _paymentNames = [[NSMutableArray alloc]init];
    _paymentNames = response;
    
    self.navigationController.navigationBar.hidden = NO;

    NSLog(@"_paymentNames %@",_paymentNames);
    [blurrView removeFromSuperview];
}

@end
