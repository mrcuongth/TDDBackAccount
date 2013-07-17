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
    
    //3. BankAccount.deposit(accountNumber, amount, description) gửi thêm tiền vào tài khoản. Kết quả là số tiền trong tài khoản (balance) tăng thêm một lượng bằng amount.
    it(@"3. Deposit", ^{
        NSString *accountNumber = [NSString nullMock];
        NSNumber *depositAmount = @10;
        
        NSString *description = @"Deposit amount of money to account number 123";
        
        BankAccount2 *oldBankAccount = [BankAccount2 getAccount:accountNumber];
        NSNumber *oldAmmount = oldBankAccount.balance;
        
        [BankAccountDao2 stub:@selector(getAccount:) andReturn:oldBankAccount];
        [BankAccountDao2 stub:@selector(deposit:withAmount:) andReturn:theValue(1)];
        
        [[BankAccountDao2 should] receive:@selector(deposit:withAmount:) andReturn:theValue(1) withArguments:accountNumber, depositAmount];
        
        [BankAccount2 deposit:accountNumber withAmount:depositAmount description:description];
        [[oldBankAccount.balance should] equal:@(oldAmmount.floatValue + depositAmount.floatValue)];
    });
});

SPEC_END




































