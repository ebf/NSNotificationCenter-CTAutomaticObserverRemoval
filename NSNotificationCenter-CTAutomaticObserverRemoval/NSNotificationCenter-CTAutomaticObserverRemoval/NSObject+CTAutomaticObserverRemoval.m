//
//  NSObject+CTAutomaticObserverRemoval.m
//  NSNotificationCenter-CTAutomaticObserverRemoval
//
//  Created by Oliver Letterer on 29.04.12.
//  Copyright (c) 2012 ebf. All rights reserved.
//

#import "NSObject+CTAutomaticObserverRemoval.h"
#import "CTNotificationStorage.h"
#import <objc/runtime.h>



NSString *const CTAutomaticObserverRemovalObserversStorageKey = @"CTAutomaticObserverRemovalObserversStorageKey";



@interface NSObject (CTAutomaticObserverRemovalPrivate)

@property (nonatomic, readonly) CTNotificationStorage *CTNotificationStorage;

@end



@implementation NSObject (CTAutomaticObserverRemoval)

- (void)CTAutomaticObserverRemovalAddNotificationObserver:(id)notificationObserver
{
    [self.CTNotificationStorage addNotificationObserver:notificationObserver];
}

@end



@implementation NSObject (CTAutomaticObserverRemovalPrivate)

- (CTNotificationStorage *)CTNotificationStorage
{
    @synchronized(self) {
        CTNotificationStorage *notificationStorage = objc_getAssociatedObject(self, &CTAutomaticObserverRemovalObserversStorageKey);
        
        if (!notificationStorage) {
            notificationStorage = [[CTNotificationStorage alloc] initWithObserver:self];
            objc_setAssociatedObject(self, &CTAutomaticObserverRemovalObserversStorageKey,
                                     notificationStorage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        
        return notificationStorage;
    }
}

@end