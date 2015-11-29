//
//  WebService.h
//  PaymentGateway
//
//  Created by Apple on 28/11/15.
//  Copyright © 2015 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ResponseDelegate <NSObject>

-(void)responseReceived:(NSMutableArray *)response;

@end

@interface WebService : NSObject

-(void)getPaymentModes;

@property(nonatomic, strong) id responseDelegate;

@end
