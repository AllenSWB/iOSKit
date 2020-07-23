//
//  NSObject+UCARDeepCopy.m
//  BWCMT_UserBusiness
//
//  Created by wenbo.sun on 2019/8/27.
//

#import "NSObject+UCARDeepCopy.h"
#import <objc/runtime.h>
@implementation NSObject (UCARDeepCopy)

- (void)deepCopy:(NSObject *)originObj {
    unsigned int property_count = 0;
    objc_property_t * propertys = class_copyPropertyList([originObj class], &property_count);
    for (int i = 0; i < property_count; i++) {
        objc_property_t property = propertys[i];
        const char * property_name = property_getName(property);
        NSString * property_name_string = [NSString stringWithUTF8String:property_name];
        [self setValue:[originObj valueForKey:property_name_string] forKey:property_name_string];
    }
    free(propertys);
}
@end
