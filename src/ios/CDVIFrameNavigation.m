#import "CDVIFrameNavigation.h"
#import <Cordova/CDVPlugin.h>
#import <WebKit/WebKit.h>


@implementation CDVIFrameNavigation : CDVPlugin

- (void)pluginInitialize
{
    id<WKUIDelegate> uiDelegate = self;
    [self.webViewEngine updateWithInfo:@{
        kCDVWebViewEngineWKUIDelegate : uiDelegate
    }];
}

- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures {
    if (!navigationAction.targetFrame.isMainFrame) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:navigationAction.request.URL.absoluteString]];
    }
    return nil;
}

- (BOOL)shouldOverrideLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (navigationType == 0)
    {
        if ([request.URL.host rangeOfString:@"trendsales"].location == NSNotFound
            || [request.URL.host rangeOfString:@"about.trendsales."].location != NSNotFound
            || [request.URL.host rangeOfString:@"www.trendsales."].location != NSNotFound
            || [request.URL.host rangeOfString:@"external.trendsales."].location != NSNotFound)
        {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:request.URL.absoluteString]];
            return NO;
        }
    }
    return YES;
}

@end
