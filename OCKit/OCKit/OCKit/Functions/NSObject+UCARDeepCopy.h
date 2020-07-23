//
//  NSObject+UCARDeepCopy.h
//  BWCMT_UserBusiness
//
//  Created by wenbo.sun on 2019/8/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (UCARDeepCopy)

- (void)deepCopy:(NSObject *)originObj;

@end

NS_ASSUME_NONNULL_END
