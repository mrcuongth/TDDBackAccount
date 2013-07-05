//
//  TDDBankAccountTest2.m
//  TDDBankAccount
//
//  Created by Trinh Huy Cuong  on 7/5/13.
//  Copyright (c) 2013 QSoftVietNam. All rights reserved.
//

#import "Kiwi.h"

SPEC_BEGIN(BankAccountTest2)

describe(@"Test Bank Account Round 2", ^{
    it(@"1. Open Account", ^{
        NSString *accountNumber = [NSString nullMock];
        
        BankAccount2 *ba = [BankAccount2 open:accountNumber];
        [ba shouldNotBeNil];
        [[ba.balance should] equal:@0];        
    });
});

SPEC_END