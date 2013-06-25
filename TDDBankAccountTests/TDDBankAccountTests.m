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
        NSString *accountNumber = [NSString nullMock];
        NSNumber *depositAmount = @100;
        NSString *description = @"Deposit amount of money to account number 123";

        BankAccount *baOriginal = [BankAccount getAccount:accountNumber];
        float originalAmount = baOriginal.balance;
        
        BankAccountDao *badMock = [BankAccountDao shareInstance];
        [badMock stub:@selector(getAccount:) andReturn:baOriginal];
        [badMock stub:@selector(deposit:withAmount:) andReturn:theValue(1)];
        
        [[badMock should] receive:@selector(deposit:withAmount:) andReturn:theValue(1) withArguments:accountNumber, depositAmount];
        
        [BankAccount deposit:accountNumber withAmount:depositAmount description:description];
        [[theValue(baOriginal.balance) should] equal:theValue(originalAmount + [depositAmount floatValue])];        
    });
    
    //4. thông tin về một lần deposit được lưu lại trong CSDL dưới dạng (accountNumber, timestamp, amount, description). Trong đó timestamp là thời điểm deposit được thực hiện. Cần mock phần lấy giờ hiện tại để phục vụ cho việc test.
    it(@"4.", ^{
        NSString *accountNumber = [NSString nullMock];
        NSNumber *depositAmount = @100;
        NSString *description = @"Deposit amount of money to account number 123";
        NSDate *date = [NSDate date];
        [NSDate stub:@selector(date) andReturn:date];

        DepositDao *depMock = [DepositDao shareInstance];
        [[depMock should] receive:@selector(deposit:withAmount:timeStamp:des:) andReturn:theValue(1) withArguments:accountNumber, depositAmount, date, description];
        
        [BankAccount deposit:accountNumber withAmount:depositAmount description:description];
    });

});

SPEC_END





































