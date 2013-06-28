//
//  BankAccountDao.h
//  TDDBankAccount
//
//  Created by Trinh Huy Cuong  on 6/19/13.
//  Copyright (c) 2013 QSoftVietNam. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BankAccount;
@interface BankAccountDao : NSObject

+ (BankAccountDao*) shareInstance;
- (BankAccount*) getAccount:(NSString*)accountNumber;
- (BOOL) deposit:accountNumber withAmount:(NSNumber*)depositAmount;
- (BOOL) withDraw:accountNumber withAmount:(NSNumber*)depositAmount;
- (BOOL) open:accountNumber;
- (BOOL) logDeposit:accountNumber withAmount:(NSNumber*)depositAmount at:(NSDate*)time andDescription:(NSString*)des;
- (BOOL) logwithDraw:accountNumber withAmount:(NSNumber*)withDrawAmount at:(NSDate*)time andDescription:(NSString*)des;

@end
