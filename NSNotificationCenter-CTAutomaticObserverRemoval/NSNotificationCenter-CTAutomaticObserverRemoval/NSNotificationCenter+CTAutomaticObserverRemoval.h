//
//  NSNotificationCenter+CTAutomaticObserverRemoval.h
//  NSNotificationCenter-CTAutomaticObserverRemoval
//
//  Created by Oliver Letterer on 29.04.12.
//  Copyright (c) 2012 ebf. All rights reserved.
//

@interface NSNotificationCenter (CTAutomaticObserverRemoval)

- (id)addObserver:(id)observer forNotificationName:(NSString *)notificationName usingBlock:(void (^)(NSNotification *notification))block;
- (id)addObserver:(id)observer forNotificationName:(NSString *)notificationName object:(id)object dispatchQueue:(dispatch_queue_t)queue usingBlock:(void (^)(NSNotification *notification))block;

- (id)addObserver:(id)observer forNotificationName:(NSString *)notificationName object:(id)object queue:(NSOperationQueue *)queue usingBlock:(void (^)(NSNotification *notification))block;

@end
