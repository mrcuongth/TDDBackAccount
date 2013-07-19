//
//  BankAccountDao2.h
//  TDDBankAccount
//
//  Created by Trinh Huy Cuong  on 7/5/13.
//  Copyright (c) 2013 QSoftVietNam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BankAccount2.h"

@interface BankAccountDao2 : NSObject

+ (BOOL) saveBankAccount:(BankAccount2*)ba;
+ (BankAccount2*) getAccount:(NSString*)accountNumber;
+ (BOOL) deposit:(NSString*)accountNumber withAmount:(NSNumber*)ammount;
+ (BOOL) logDeposit:(NSString*)accountNumber withAmount:(NSNumber*)depositAmount at:(NSDate*)time andDescription:(NSString*)des;

+ (BOOL) withDraw:(NSString*)accountNumber withAmount:(NSNumber*)ammount;
+ (BOOL) logWithdraw:(NSString*)accountNumber withAmount:(NSNumber*)withdrawAmount at:(NSDate*)time andDescription:(NSString*)des;

@end
