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
- (BOOL) deposit:(NSString*)accountNumber withAmount:(NSNumber*)depositAmount;
- (BOOL) withDraw:(NSString*)accountNumber withAmount:(NSNumber*)depositAmount;
- (BOOL) open:(BankAccount*)account;
- (BOOL) logDeposit:(NSString*)accountNumber withAmount:(NSNumber*)depositAmount at:(NSDate*)time andDescription:(NSString*)des;
- (BOOL) logwithDraw:(NSString*)accountNumber withAmount:(NSNumber*)withDrawAmount at:(NSDate*)time andDescription:(NSString*)des;
- (NSArray*) getTransactionsOccurred:(NSString*) accountNumber startTime:(NSDate*)startTime stopTime:(NSDate*)stopTime numberOfNewesetRecord:(NSNumber*)numberOfNewesetRecord;

@end
