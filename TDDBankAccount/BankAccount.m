//
//  BankAccount.m
//  TDDBankAccount
//
//  Created by Trinh Huy Cuong  on 6/18/13.
//  Copyright (c) 2013 QSoftVietNam. All rights reserved.
//

#import "BankAccount.h"
#import "BankAccountDao.h"

@implementation BankAccount
@synthesize balance, accountNumber;

- (BankAccount*) init{
    self = [super init];
    
    self.balance = 0;
    
    return self;
}

+ (BankAccount*) open:(NSString*)accountNumber{
    [[BankAccountDao shareInstance] open:accountNumber];
    BankAccount *ba = [[BankAccountDao shareInstance] getAccount:accountNumber];
    
    return ba;
}

+ (BankAccount*) getAccount:(NSString*)accountNumber{
    BankAccount *ba = [[BankAccountDao shareInstance] getAccount:accountNumber];
    return ba;
}

+ (void) deposit:accountNumber withAmount:(NSNumber*)depositAmount description:(NSString*)description{
    BankAccount *ba = [[BankAccountDao shareInstance] getAccount:accountNumber];
    ba.balance += [depositAmount floatValue];
    
    [[BankAccountDao shareInstance] deposit:accountNumber withAmount:depositAmount];
    [[BankAccountDao shareInstance] logDeposit:accountNumber withAmount:depositAmount at:[NSDate date] andDescription:description];
}

+ (void) withDraw:accountNumber withAmount:(NSNumber*)widthDrawAmount description:(NSString*)description{
    BankAccount *ba = [[BankAccountDao shareInstance] getAccount:accountNumber];
    ba.balance += [widthDrawAmount floatValue];
    
    [[BankAccountDao shareInstance] withDraw:accountNumber withAmount:widthDrawAmount];
    [[BankAccountDao shareInstance] logwithDraw:accountNumber withAmount:widthDrawAmount at:[NSDate date] andDescription:description];
}

@end


































