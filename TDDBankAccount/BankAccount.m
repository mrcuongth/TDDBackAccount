//
//  BankAccount.m
//  TDDBankAccount
//
//  Created by Trinh Huy Cuong  on 6/18/13.
//  Copyright (c) 2013 QSoftVietNam. All rights reserved.
//

#import "BankAccount.h"

@implementation BankAccount
@synthesize balance;

- (BankAccount*) init{
    self = [super init];
    
    self.balance = 0;
    
    return self;
}

- (void) open:(NSString*)accountNumber{

}

@end
