//
//  BankAccount.h
//  TDDBankAccount
//
//  Created by Trinh Huy Cuong  on 6/18/13.
//  Copyright (c) 2013 QSoftVietNam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BankAccount : NSObject

@property (nonatomic, readwrite) float balance;
@property (nonatomic, retain) NSString *accountNumber;

+ (BankAccount*) open:(NSString*)accountNumber;
+ (BankAccount*) getAccount:(NSString*)accountNumber;
+ (void) deposit:accountNumber withAmount:(NSNumber*)depositAmount description:(NSString*)description;
+ (void) withDraw:accountNumber withAmount:(NSNumber*)widthDrawAmount description:(NSString*)description;
+ (NSArray*) getTransactionsOccurred:(NSString*) accountNumber;
+ (NSArray*) getTransactionsOccurred:(NSString*) accountNumber startTime:(NSDate*)startTime stopTime:(NSDate*)stopTime;

@end
