//
//  LoginViewController.m
//  Blocstagram
//
//  Created by Chad Clayton on 8/14/15.
//  Copyright (c) 2015 Chad Clayton. All rights reserved.
//

#import "LoginViewController.h"
#import "DataSource.h"

@interface LoginViewController ()

@property (nonatomic, weak) UIWebView *webView;

@end

@implementation LoginViewController

NSString *const LoginViewControllerDidGetAccessTokenNotification = @"LoginViewControllerDidGetAccessTokenNotification";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIWebView *webView = [[UIWebView alloc] init];
    webView.delegate = self;
    
    [self.view addSubview:webView];
    self.webView = webView;
    
    self.title = NSLocalizedString(@"Login", @"Login");
    
    NSString *urlString = [NSString stringWithFormat:@"https://instagram.com/oauth/authorize/?client_id=%@&scope=likes&redirect_uri=%@&response_type=token", [DataSource instagramClientID], [self redirectURI]];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    if (url) {
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
    }
}

- (void) dealloc {
    
    [self clearInstagramCookies];
    
    self.webView.delegate = nil;
}

/**
 Clears Instagram cookies. This prevents caching the credentials in the cookie jar.
 */
- (void) clearInstagramCookies {
    // TEST to see if "[NSHTTPCookieStorage sharedHTTPCookieStorage].cookies" could work here instead. "cookies" is a read only property and should be accessable via dot notation if I understand correctly
    for(NSHTTPCookie *cookie in [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]){
        NSRange domainRange = [cookie.domain rangeOfString:@"instagram.com"];
        if (domainRange.location != NSNotFound) {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
        }
    }
        
}

- (BOOL) webView:(UIWebView *) webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *urlString = request.URL.absoluteString;
    if ([urlString hasPrefix:[self redirectURI]]){
        // This contains the auth token
        NSRange rangeOfAccessTokenParamenter = [urlString rangeOfString:@"access_token="];
        NSUInteger indexOfTokenStarting = rangeOfAccessTokenParamenter.location + rangeOfAccessTokenParamenter.length;
        NSString *accessToken = [urlString substringFromIndex:indexOfTokenStarting];
        [[NSNotificationCenter defaultCenter] postNotificationName:LoginViewControllerDidGetAccessTokenNotification object:accessToken];
        
        return NO;
    }
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillLayoutSubviews {
    self.webView.frame  = self.view.bounds;
}

- (NSString *) redirectURI {
    return @"http://bloc.io";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
