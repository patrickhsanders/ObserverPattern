//
//  ObservableClass.m
//  ObserverPattern
//
//  Created by Aditya Narayan on 11/30/15.
//  Copyright © 2015 turntotech.io. All rights reserved.
//

#import "ObservableClass.h"

@implementation ObservableClass

- (instancetype) init {
  self = [super init];
  self.text = @"";
  return self;
}

+ (id)sharedManager {
  static ObservableClass *sharedMyManager = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedMyManager = [[self alloc] init];
  });
  return sharedMyManager;
}


@end
