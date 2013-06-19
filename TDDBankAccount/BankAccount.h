//
//  BankAccount.h
//  TDDBankAccount
//
//  Created by Trinh Huy Cuong  on 6/18/13.
//  Copyright (c) 2013 QSoftVietNam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BankAccount : NSObject

@property (nonatomic, readwrite) float balance;
@property (nonatomic, retain) NSString *accountNumber;

+ (BankAccount*) open:(NSString*)accountNumber;

@end
