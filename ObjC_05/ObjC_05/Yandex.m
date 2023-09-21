//
//  Yandex.m
//  ObjC_05
//
//  Created by Admin on 21.09.2023.
//

#import "Yandex.h"

@implementation Yandex

+ (void)searchWithQuery:(NSString *)query completion:(void (^)(NSString *result))completion {
    NSString *urlString = [NSString stringWithFormat:@"https://yandex.ru/search/?text=%@", query];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Ошибка при выполнении запроса: %@", error.localizedDescription);
            completion(nil);
        } else {
            NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"Результат поискового запроса: %@", result);
            completion(result);
        }
    }];
    [task resume];
}

@end
