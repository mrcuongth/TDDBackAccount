//
//  BankAccount2.h
//  TDDBankAccount
//
//  Created by Trinh Huy Cuong  on 7/5/13.
//  Copyright (c) 2013 QSoftVietNam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BankAccount2 : NSObject

@property (nonatomic, readonly) NSNumber *balance;
@property (nonatomic, readonly) NSString *accountNumber;

- (BankAccount2*) initWithAccountNumber:(NSString*) _accountNumber;
+ (BankAccount2*) open:(NSString*) accountNumber;

@end
