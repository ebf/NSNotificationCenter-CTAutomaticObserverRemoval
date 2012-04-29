//
//  CTNotificationStorage.m
//  NSNotificationCenter-CTAutomaticObserverRemoval
//
//  Created by Oliver Letterer on 29.04.12.
//  Copyright 2012 ebf. All rights reserved.
//

#import "CTNotificationStorage.h"



@interface CTNotificationStorage () {
    
}

@end



@implementation CTNotificationStorage

#pragma mark - Initialization

- (id)initWithObserver:(id)observer
{
    if (self = [super init]) {
        // Initialization code
        _observer = observer;
        _notificationObservers = [NSMutableArray array];
    }
    return self;
}

#pragma mark - Instance methods

- (void)addNotificationObserver:(id)notificationObserver
{
    if (![_notificationObservers containsObject:notificationObserver]) {
        [_notificationObservers addObject:notificationObserver];
    }
}

#pragma mark - Memory management

- (void)dealloc
{
    for (id observer in _notificationObservers) {
        [[NSNotificationCenter defaultCenter] removeObserver:observer];
    }
    
    [[NSNotificationCenter defaultCenter] removeObserver:_observer];
}

#pragma mark - Private category implementation ()

@end
