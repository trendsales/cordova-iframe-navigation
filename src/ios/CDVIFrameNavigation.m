#import "CDVUserAgent.h"
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

@end
