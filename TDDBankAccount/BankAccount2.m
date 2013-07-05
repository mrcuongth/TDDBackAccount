//
//  BankAccount2.m
//  TDDBankAccount
//
//  Created by Trinh Huy Cuong  on 7/5/13.
//  Copyright (c) 2013 QSoftVietNam. All rights reserved.
//

#import "BankAccount2.h"

@implementation BankAccount2
@synthesize balance, accountNumber;

- (BankAccount2*) initWithAccountNumber:(NSString*) _accountNumber{
    self = [super init];
    accountNumber = _accountNumber;
    balance = @0;
    
    return self;
}

+ (BankAccount2*) open:(NSString*) accountNumber{
    BankAccount2 *ba = [[BankAccount2 alloc] initWithAccountNumber:accountNumber];
    
    return ba;
}

@end
