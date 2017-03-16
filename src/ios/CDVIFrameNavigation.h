#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>
#import <WebKit/WebKit.h>

@interface CDVIFrameNavigation : CDVPlugin <WKUIDelegate>

@property (nonatomic, strong) IBOutlet WKWebView* webView;

@end
