//
//  BankAccountDao.m
//  TDDBankAccount
//
//  Created by Trinh Huy Cuong  on 6/19/13.
//  Copyright (c) 2013 QSoftVietNam. All rights reserved.
//

#import "BankAccountDao.h"
#import "BankAccount.h"

static BankAccountDao *instance;
@implementation BankAccountDao

+ (BankAccountDao*) shareInstance{
    if (!instance) {
        instance = [[BankAccountDao alloc] init];
    }
    
    return instance;
}

- (BOOL) deposit:accountNumber withAmount:(NSNumber*)depositAmount{
    return NO;
}

- (BOOL) withDraw:accountNumber withAmount:(NSNumber*)depositAmount{
    return NO;
}

- (BOOL) logDeposit:accountNumber withAmount:(NSNumber*)depositAmount at:(NSDate*)time andDescription:(NSString*)des{
    return NO;
}

- (BOOL) logwithDraw:accountNumber withAmount:(NSNumber*)withDrawAmount at:(NSDate*)time andDescription:(NSString*)des{
    return NO;
}

- (BankAccount*) getAccount:(NSString*)accountNumber{
    // Do some thing with database to get a BankAccount with accountNumber;
    BankAccount *ba = [[BankAccount alloc] init];
    return ba;
}

- (BOOL) open:accountNumber{
    return NO;
}

- (NSArray*) getTransactionsOccurred:(NSString*) accountNumber startTime:(NSDate*)startTime stopTime:(NSDate*)stopTime{
    return nil;
}

@end





























