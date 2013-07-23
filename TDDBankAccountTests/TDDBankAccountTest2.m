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
        
        [BankAccountDao2 stub:@selector(getAccount:) andReturn:oldBankAccount];
        [BankAccountDao2 stub:@selector(deposit:withAmount:) andReturn:theValue(1)];
        
        [[BankAccountDao2 should] receive:@selector(deposit:withAmount:) andReturn:theValue(1) withArguments:accountNumber, depositAmount];
        
        [BankAccount2 deposit:accountNumber withAmount:depositAmount description:description];
    });
    
    //  4. thông tin về một lần deposit được lưu lại trong CSDL dưới dạng (accountNumber, timestamp, amount, description). Trong đó timestamp là thời điểm deposit được thực hiện. Cần mock phần lấy giờ hiện tại để phục vụ cho việc test.
    it(@"4. Log Deposit", ^{
        NSString *accountNumber = [NSString nullMock];
        NSNumber *depositAmount = @10;
        NSDate *currentDate = [NSDate date];
        [NSDate stub:@selector(date) andReturn:currentDate];
        
        NSString *description = [NSString nullMock];
        
        BankAccount2 *oldBankAccount = [BankAccount2 getAccount:accountNumber];
        
        [BankAccountDao2 stub:@selector(getAccount:) andReturn:oldBankAccount];
        [BankAccountDao2 stub:@selector(deposit:withAmount:) andReturn:theValue(1)];
        
        [[BankAccountDao2 should] receive:@selector(deposit:withAmount:) andReturn:theValue(1) withArguments:accountNumber, depositAmount];
        [[BankAccountDao2 should] receive:@selector(logDeposit:withAmount:at:andDescription:) andReturn:theValue(YES) withArguments:accountNumber, depositAmount, currentDate, description];
        
        [BankAccount2 deposit:accountNumber withAmount:depositAmount description:description];        
    });

    //  5. BankAccount.withdraw(accountNumber, amount, description) rút tiền khỏi tài khoản. kết quả là số tiền trong tài khoản (balance) giảm đi một lượng bằng amount
    it(@"5. Withdraw", ^{
        NSString *accountNumber = [NSString nullMock];
        NSString *description = [NSString nullMock];
        
        NSNumber *withDrawAmount = [NSNumber nullMock];
        
        [[BankAccountDao2 should] receive:@selector(withDraw:withAmount:) andReturn:theValue(1) withArguments:accountNumber, withDrawAmount];
        
        [BankAccount2 withDraw:accountNumber withAmount:withDrawAmount description:description];
    });

    // 6. thông tin về một lần withdraw được lưu lại trong CSDL dưới dạng (accountNumber, timestamp, amount, description), trong đó -amount là số tiền đã rút. Còn lại tương tự như deposit.
    it(@"6. log withdraw", ^{
        NSString *accountNumber = [NSString nullMock];
        NSString *description = [NSString nullMock];
        NSNumber *withDrawAmount = [NSNumber nullMock];
        NSDate *currentDate = [NSDate date];
        [NSDate stub:@selector(date) andReturn:currentDate];
        
        [[BankAccountDao2 should] receive:@selector(withDraw:withAmount:) andReturn:theValue(1) withArguments:accountNumber, withDrawAmount];
        [[BankAccountDao2 should] receive:@selector(logWithdraw:withAmount:at:andDescription:) andReturn:theValue(YES) withArguments:accountNumber, withDrawAmount, currentDate, description];

        [BankAccount2 withDraw:accountNumber withAmount:withDrawAmount description:description];
    });
    
    // 7. lấy danh sách các giao dịch đã thực hiện đối với một tài khoản BankAccount.getTransactionsOccurred(accountNumber). Chỉ cần test tương tác với DAO, nghĩa là kiểm tra xem có gọi đúng hàm, đúng tham số hay không.
    it(@"7. ", ^{
        NSString *accountNumber = [NSString nullMock];
        
        [[BankAccountDao2 should] receive:@selector(getTransactionsOccurred:startTime:stopTime:numberOfNewesetRecord:) andReturn:any() withArguments:accountNumber, nil, nil, nil];
        
        [BankAccount2 getTransactionsOccurred:accountNumber];
    });

});

SPEC_END




































