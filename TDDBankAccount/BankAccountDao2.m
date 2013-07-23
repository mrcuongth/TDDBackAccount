//
//  BankAccountDao2.m
//  TDDBankAccount
//
//  Created by Trinh Huy Cuong  on 7/5/13.
//  Copyright (c) 2013 QSoftVietNam. All rights reserved.
//

#import "BankAccountDao2.h"

@implementation BankAccountDao2

+ (BOOL) saveBankAccount:(BankAccount2*)ba{
    // save to database;
    return YES;
}

+ (BankAccount2*) getAccount:(NSString*)accountNumber{
    // query database, return banaccount2;
    return nil;
}

+ (BOOL) deposit:(NSString*)accountNumber withAmount:(NSNumber*)ammount{
    return YES;
}

+ (BOOL) logDeposit:(NSString*)accountNumber withAmount:(NSNumber*)depositAmount at:(NSDate*)time andDescription:(NSString*)des{
    return NO;
}

+ (BOOL) withDraw:(NSString*)accountNumber withAmount:(NSNumber*)ammount{
    return YES;
}

+ (BOOL) logWithdraw:(NSString*)accountNumber withAmount:(NSNumber*)withdrawAmount at:(NSDate*)time andDescription:(NSString*)des{
    return YES;
}

+ (NSArray*) getTransactionsOccurred:(NSString*) accountNumber startTime:(NSDate*)startTime stopTime:(NSDate*)stopTime numberOfNewesetRecord:(NSNumber*)numberOfNewesetRecord{
    return nil;
}



@end
