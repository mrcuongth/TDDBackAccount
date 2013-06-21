//
//  TDDBankAccountTests.m
//  TDDBankAccountTests
//
//  Created by Trinh Huy Cuong  on 6/18/13.
//  Copyright (c) 2013 QSoftVietNam. All rights reserved.
//

#import "Kiwi.h"
#import "BankAccount.h"
#import "BankAccountDao.h"

SPEC_BEGIN(TestBankAccount)

describe(@"Test Back Account class", ^{
    it(@"1. Mở được tài khoản mới, open (accountNumber), mở tài khoản mới với balance = 0.", ^{
        BankAccount *ba = [BankAccount open:@"1234567890"];
        [ba shouldNotBeNil];
        [[theValue(ba.balance) should] equal:theValue(0)];
    });
    
    it(@"2. Tài khoản có tính persistent.", ^{
        NSString *accountNumber = @"123";
        BankAccount *ba = [[BankAccount alloc] init];
        ba.accountNumber = accountNumber;
        
        BankAccountDao *badMock = [BankAccountDao shareInstance];
        [badMock stub:@selector(getAccount:) andReturn:ba];
        
        BankAccount *baGotFromDBWithAccountNumber = [BankAccount getAccount:accountNumber];
        [[baGotFromDBWithAccountNumber.accountNumber should] equal:accountNumber];
    });
    
    it(@"3. BankAccount.deposit(accountNumber, amount, description) gửi thêm tiền vào tài khoản.", ^{
        NSString *accountNumber = @"123";
        NSNumber *depositAmount = @100;
        NSString *description = @"Deposit amount of money to account number 123";

        
        
        BankAccount *baOriginal = [BankAccount getAccount:accountNumber];
        float originalAmount = baOriginal.balance;
        
        [BankAccount deposit:accountNumber withAmount:depositAmount description:description];
        
        [[theValue(baOriginal.balance) should] equal:theValue(originalAmount + [depositAmount floatValue])];
        
        BankAccount *bankAccountAfterDeposit = [BankAccount getAccount:accountNumber];
        [[theValue(bankAccountAfterDeposit.balance) should] equal:theValue(originalAmount + [depositAmount floatValue])];
    });
});

SPEC_END





































