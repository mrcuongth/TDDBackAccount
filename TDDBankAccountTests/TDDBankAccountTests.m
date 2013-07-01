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
        BankAccountDao *badMock = [BankAccountDao shareInstance];
        [badMock stub:@selector(open:) andReturn:theValue(1)];
        
        NSString *accountNumber = [NSString nullMock];
        
        [[badMock should] receive:@selector(open:) andReturn:theValue(1) withArguments:accountNumber];
        
        BankAccount *ba = [BankAccount open:accountNumber];
        [ba shouldNotBeNil];
        [[theValue(ba.balance) should] equal:theValue(0)];
    });
    
    it(@"2. Tài khoản có tính persistent.", ^{
        NSString *accountNumber = [NSString nullMock];
        BankAccount *ba = [[BankAccount alloc] init];
        ba.accountNumber = accountNumber;
        
        BankAccountDao *badMock = [BankAccountDao shareInstance];
        [badMock stub:@selector(getAccount:) andReturn:ba];
        
        [[badMock should] receive:@selector(getAccount:) andReturn:ba withArguments:accountNumber];
        
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
        NSNumber *depositAmount = [NSNumber nullMock];
        NSString *description = [NSString nullMock];
        
        NSDate *date = [NSDate date];
        [NSDate stub:@selector(date) andReturn:date];

        BankAccountDao *badMock = [BankAccountDao shareInstance];
        [badMock stub:@selector(logDeposit:withAmount:at:andDescription:) andReturn:theValue(YES)];
        
        [[badMock should] receive:@selector(logDeposit:withAmount:at:andDescription:) andReturn:theValue(YES) withArguments:accountNumber, depositAmount, date, description];
        
        [BankAccount deposit:accountNumber withAmount:depositAmount description:description];
    });
    
    //5. BankAccount.withdraw(accountNumber, amount, description) rút tiền khỏi tài khoản. kết quả là số tiền trong tài khoản (balance) giảm đi một lượng bằng amount
    it(@"5. ", ^{
        NSString *accountNumber = [NSString nullMock];
        NSNumber *withdrawAmmount = @100;
        NSString *description = [NSString nullMock];

        BankAccount *baOriginal = [BankAccount getAccount:accountNumber];
        float originalAmount = baOriginal.balance;
        
        BankAccountDao *badMock = [BankAccountDao shareInstance];
        [badMock stub:@selector(getAccount:) andReturn:baOriginal];
        
        [[badMock should] receive:@selector(withDraw:withAmount:) andReturn:theValue(1) withArguments:accountNumber, withdrawAmmount];
        
        [BankAccount withDraw:accountNumber withAmount:withdrawAmmount description:description];
        [[theValue(baOriginal.balance) should] equal:theValue(originalAmount + [withdrawAmmount floatValue])];
    });
    
    //6. thông tin về một lần withdraw được lưu lại trong CSDL dưới dạng (accountNumber, timestamp, amount, description), trong đó -amount là số tiền đã rút. Còn lại tương tự như deposit.
    it(@"6.", ^{
        NSString *accountNumber = [NSString nullMock];
        NSNumber *withDrawAmount = [NSNumber nullMock];
        NSString *description = [NSString nullMock];
        
        NSDate *date = [NSDate date];
        [NSDate stub:@selector(date) andReturn:date];
        
        BankAccountDao *badMock = [BankAccountDao shareInstance];
        
        [[badMock should] receive:@selector(logwithDraw:withAmount:at:andDescription:) andReturn:theValue(YES) withArguments:accountNumber, withDrawAmount, date, description];
        
        [BankAccount withDraw:accountNumber withAmount:withDrawAmount description:description];
    });
    
    //7. lấy danh sách các giao dịch đã thực hiện đối với một tài khoản BankAccount.getTransactionsOccurred(accountNumber). Chỉ cần test tương tác với DAO, nghĩa là kiểm tra xem có gọi đúng hàm, đúng tham số hay không.
    it(@"7.", ^{
        NSString *accountNumber = [NSString nullMock];
        BankAccountDao *badMock = [BankAccountDao shareInstance];
        
        [[badMock should] receive:@selector(getTransactionsOccurred:startTime:stopTime:numberOfNewesetRecord:) andReturn:any() withArguments:accountNumber, nil, nil, nil];
        
        [BankAccount getTransactionsOccurred:accountNumber];
    });
    
//    8. lấy danh sách các giao dịch đã được thực hiện trong một khoảng thời gian startTime <= t < stopTime. BankAccount.getTransactionsOccurred(accountNumber, startTime, stopTime). Chỉ cần test tương tác với DAO, nghĩa là kiểm tra xem có gọi đúng hàm, đúng tham số hay không.
    it(@"8.", ^{
        NSString *accountNumber = [NSString nullMock];
        BankAccountDao *badMock = [BankAccountDao shareInstance];
        NSDate *startTime = [NSDate nullMock];
        NSDate *stopTime = [NSDate nullMock];
        
        [[badMock should] receive:@selector(getTransactionsOccurred:startTime:stopTime:numberOfNewesetRecord:) andReturn:any() withArguments:accountNumber, startTime, stopTime, nil];
        
        [BankAccount getTransactionsOccurred:accountNumber startTime:startTime stopTime:stopTime];
    });
    
//    9. lấy danh sách n giao dịch mới nhất đã được thực hiện. Chỉ cần test tương tác với DAO, nghĩa là kiểm tra xem có gọi đúng hàm, đúng tham số hay không.
    it(@"9.", ^{
        NSString *accountNumber = [NSString nullMock];
        BankAccountDao *badMock = [BankAccountDao shareInstance];
        NSNumber *numberOfNewestTransactions = [NSNumber nullMock];
        
        [[badMock should] receive:@selector(getTransactionsOccurred:startTime:stopTime:numberOfNewesetRecord:) andReturn:any() withArguments:accountNumber, nil, nil, numberOfNewestTransactions];
        
        [BankAccount getTransactionsOccurred:accountNumber numberOfNewestRecord:numberOfNewestTransactions];
    });
});

SPEC_END





































