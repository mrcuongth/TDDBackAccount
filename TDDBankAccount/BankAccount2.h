//
//  BankAccount2.h
//  TDDBankAccount
//
//  Created by Trinh Huy Cuong  on 7/5/13.
//  Copyright (c) 2013 QSoftVietNam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BankAccount2 : NSObject

@property (nonatomic, readonly) NSNumber *balance;
@property (nonatomic, readonly) NSString *accountNumber;
@property (nonatomic, readonly) NSDate *openDate;

- (BankAccount2*) initWithAccountNumber:(NSString*) _accountNumber;

+ (BankAccount2*) open:(NSString*) accountNumber;
+ (BankAccount2*) getAccount:(NSString*) accountNumber;
+ (void) deposit:(NSString*)accountNumber withAmount:(NSNumber*)depositAmount description:(NSString*)description;

+ (void) withDraw:(NSString*)accountNumber withAmount:(NSNumber*)withDrawAmount description:(NSString*)description;

+ (NSArray*) getTransactionsOccurred:(NSString*) accountNumber;
+ (NSArray*) getTransactionsOccurred:(NSString*) accountNumber startTime:(NSDate*)startTime stopTime:(NSDate*)stopTime;
+ (NSArray*) getTransactionsOccurred:(NSString*) accountNumber numberOfNewestRecord:(NSNumber*)numberOfNewestRecord;

@end
