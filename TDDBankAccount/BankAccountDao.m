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

- (BankAccount*) getAccount:(NSString*)accountNumber{
    // Do some thing with database to get a BankAccount with accountNumber;
    BankAccount *ba = [[BankAccount alloc] init];
    return ba;
}

- (BOOL) open:accountNumber{
    return NO;
}

@end





























