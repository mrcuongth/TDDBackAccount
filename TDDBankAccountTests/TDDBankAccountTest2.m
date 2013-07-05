//
//  TDDBankAccountTest2.m
//  TDDBankAccount
//
//  Created by Trinh Huy Cuong  on 7/5/13.
//  Copyright (c) 2013 QSoftVietNam. All rights reserved.
//

#import "Kiwi.h"
#import "BankAccount2.h"
#import "BankAccountDao2.h"

SPEC_BEGIN(BankAccountTest2)

describe(@"Test Bank Account Round 2", ^{
    it(@"1. Open Account", ^{
        NSString *accountNumber = [NSString nullMock];
        
        
        [[BankAccountDao2 should] receive:@selector(saveBankAccount:) andReturn:any() withArguments:any()];

        BankAccount2 *ba = [BankAccount2 open:accountNumber];
        [ba shouldNotBeNil];
        [[ba.balance should] equal:@0];
    });
    
    it(@"2. Get Account", ^{
        NSString *accountNumber = [NSString nullMock];
        BankAccount2 *retunedBa = [BankAccount2 mock];
        [retunedBa stub:@selector(accountNumber) andReturn:accountNumber];
        [BankAccountDao2 stub:@selector(getAccount:) andReturn:retunedBa];
        
        [[BankAccountDao2 should] receive:@selector(getAccount:) andReturn:any() withArguments:accountNumber];
        
        BankAccount2 *ba = [BankAccount2 getAccount:accountNumber];        
        [ba shouldNotBeNil];
        [[ba.accountNumber should] equal:accountNumber];
    });
});

SPEC_END




































