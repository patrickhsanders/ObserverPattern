//
//  ObservableClass.h
//  ObserverPattern
//
//  Created by Aditya Narayan on 11/30/15.
//  Copyright © 2015 turntotech.io. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObservableClass : NSObject
@property (nonatomic, strong) NSString *text;
+ (id)sharedManager;
@end
