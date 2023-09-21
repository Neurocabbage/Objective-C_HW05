//
//  ViewController.m
//  ObjC_05
//
//  Created by Admin on 21.09.2023.
//

#import "ViewController.h"
#import "Loader.h"
#import "Yandex.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loader = [Loader new];
    self.searchBar.delegate = self;
    self.textView.text = @"";
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
   // [self performLoadingWithGETRequest];
   // [self performLoadingWithPOSTRequest];
    [self searchBarSearchButtonClicked];

}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *query = searchBar.text;
    [Yandex searchWithQuery:query completion:^(NSString *result) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.textView.text = result;
        });
    }];
}


- (void)performLoadingWithGETRequest {
    [self.loader performGETRequestForURL:@"https://postman-echo.com/get" arguments:@{@"first": @"first value", @"second": @"second value"} competion:^(NSDictionary * dict, NSError * error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                NSLog(@"%@", [NSString stringWithFormat:@"Error: %@", error]);
                return;
            }
            NSLog(@"%@", [NSString stringWithFormat:@"%@", dict]);
        });
    }];
}

- (void)performLoadingWithPOSTRequest {
    [self.loader performPOSTRequestForURL: @"https://postman-echo.com/post" arguments:@{@"first": @"first value", @"second": @"second value"} competion: ^(NSDictionary * dict, NSError * error){
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                NSLog(@"%@", [NSString stringWithFormat:@"Error: %@", error]);
                return;
            }
            NSLog(@"%@", [NSString stringWithFormat:@"%@", dict]);
        });
    }];
}





@end
