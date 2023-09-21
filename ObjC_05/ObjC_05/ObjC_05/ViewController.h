//
//  ViewController.h
//  ObjC_05
//
//  Created by Admin on 21.09.2023.
//

#import <UIKit/UIKit.h>
#import "Loader.h"


@interface ViewController : UIViewController  <UISearchBarDelegate>

@property (strong, nonatomic) Loader *loader;
@property (nonatomic, strong) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) IBOutlet UITextView *textView;

-(void) performLoadingWithGETRequest;
-(void) performLoadingWithPOSTRequest;


@end

