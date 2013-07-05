//
//  BankAccountDao2.m
//  TDDBankAccount
//
//  Created by Trinh Huy Cuong  on 7/5/13.
//  Copyright (c) 2013 QSoftVietNam. All rights reserved.
//

#import "BankAccountDao2.h"

@implementation BankAccountDao2

+ (BOOL) saveBankAccount:(BankAccount2*)ba{
    // save to database;
    return YES;
}

+ (BankAccount2*) getAccount:(NSString*)accountNumber{
    // query database, return banaccount2;
    return nil;
}

@end
