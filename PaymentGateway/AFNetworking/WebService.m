//
//  WebService.m
//  PaymentGateway
//
//  Created by Apple on 28/11/15.
//  Copyright © 2015 Apple. All rights reserved.
//

#import "WebService.h"
#import "AFHTTPRequestOperation.h"
#import "Constants.h"

@implementation WebService

+(WebService*)sharedInstance
{
    static WebService *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[WebService alloc] init];
    });
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)getPaymentModes {
    
    NSMutableArray *response = [[NSMutableArray alloc]init];
    NSURL *url=[NSURL URLWithString:GET_PAYMENT_MODES];
    NSURLRequest *request=[[NSURLRequest alloc] initWithURL:url];
    
    NSURLResponse *result = nil;
    NSError *error = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&result error:&error];
    
    
    if (data) {
        BOOL isValid=[NSJSONSerialization isValidJSONObject:data];
        NSLog(isValid?@"JSON is valid":@"JSON is not valid");
        
        
        NSMutableArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        NSLog(@"jsonArray %@",jsonArray);
        
        for(id key in jsonArray)
        {
            if([key valueForKey:@"paymentOptionName"]  != Nil)
            {
                [response addObject:[key valueForKey:@"paymentOptionName"]];
            }
        }
        
        //NSLog(@"response %@",[response objectAtIndex:0]);
        if (response) {
            [_responseDelegate responseReceived:response];
        }
    }

}

@end
