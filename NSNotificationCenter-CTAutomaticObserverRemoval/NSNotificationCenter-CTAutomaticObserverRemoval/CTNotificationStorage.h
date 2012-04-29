//
//  CTNotificationStorage.h
//  NSNotificationCenter-CTAutomaticObserverRemoval
//
//  Created by Oliver Letterer on 29.04.12.
//  Copyright 2012 ebf. All rights reserved.
//



/**
 @abstract  <#abstract comment#>
 */
@interface CTNotificationStorage : NSObject {
@private
    NSMutableArray *_notificationObservers;
    __unsafe_unretained id _observer;
}

- (id)initWithObserver:(id)observer;

- (void)addNotificationObserver:(id)notificationObserver;

@end
