//
//  Yandex.h
//  ObjC_05
//
//  Created by Admin on 21.09.2023.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Yandex : NSObject

+ (void)searchWithQuery:(NSString *)query completion:(void (^)(NSString *result))completion;

@end

NS_ASSUME_NONNULL_END
