//
//  NSNotificationCenter+CTAutomaticObserverRemoval.m
//  NSNotificationCenter-CTAutomaticObserverRemoval
//
//  Created by Oliver Letterer on 29.04.12.
//  Copyright (c) 2012 ebf. All rights reserved.
//

#import "NSNotificationCenter+CTAutomaticObserverRemoval.h"
#import "NSObject+CTAutomaticObserverRemoval.h"



@implementation NSNotificationCenter (CTAutomaticObserverRemoval)

- (id)addObserver:(id)observer forNotificationName:(NSString *)notificationName usingBlock:(void (^)(NSNotification *notification))block
{
    return [self addObserver:observer forNotificationName:notificationName object:nil dispatchQueue:NULL usingBlock:block];
}

- (id)addObserver:(id)observer forNotificationName:(NSString *)notificationName object:(id)object dispatchQueue:(dispatch_queue_t)queue usingBlock:(void (^)(NSNotification *notification))block
{
    queue = queue ?: dispatch_get_main_queue();
    
    return [self addObserver:observer forNotificationName:notificationName object:object queue:nil usingBlock:^(NSNotification *notification) {
        dispatch_async(queue, ^{
            block(notification);
        });
    }];
}

- (id)addObserver:(id)observer forNotificationName:(NSString *)notificationName object:(id)object queue:(NSOperationQueue *)queue usingBlock:(void (^)(NSNotification *notification))block
{
    id observerReference = [self addObserverForName:notificationName object:object queue:queue usingBlock:block];
    [observer CTAutomaticObserverRemovalAddNotificationObserver:observerReference];
    return observerReference;
}

@end
