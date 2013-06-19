//
//  TDDBankAccountTests.m
//  TDDBankAccountTests
//
//  Created by Trinh Huy Cuong  on 6/18/13.
//  Copyright (c) 2013 QSoftVietNam. All rights reserved.
//

#import "Kiwi.h"
#import "BankAccount.h"

SPEC_BEGIN(TestBankAccount)

describe(@"Test Back Account class", ^{
    it(@"1. Mở được tài khoản mới, open (accountNumber), mở tài khoản mới với balance = 0.", ^{
        BankAccount *ba = [BankAccount open:@"1234567890"];
        [ba shouldNotBeNil];
        [[theValue(ba.balance) should] equal:theValue(0)];
    });
    
    it(@"2. Tài khoản có tính persistent. BankAccount.getAccount(accountNumber) cho phép lấy thông tin tài khoản có số tài khoản được cho làm tham số. Dùng mock của BankAccountDao cho nhiệm vụ tương tác với CSDL.", ^{
        
    });
});

SPEC_END





































