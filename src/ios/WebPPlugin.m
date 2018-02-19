
#import "WebPPlugin.h"
#import <WebP/decode.h>

@implementation WebPPlugin

- (void) pluginInitialize {
}

- (void) decodeWebp:(CDVInvokedUrlCommand*)command
{
    if ([command.arguments count] == 0) {
        CDVPluginResult *pluginResult;
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"No path provided"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        return;
    }
    
    NSString * const webpPath = [command.arguments objectAtIndex:0];
    NSData * const webpData = [[NSData alloc] initWithContentsOfFile:webpPath options:NSDataReadingMappedIfSafe error:NULL];
    UIImage * image = [STWebPDecoder imageWithData:webpData scale:1 error:NULL];
    NSString * base64 = [NSString stringWithFormat:@"data:image/png;base64",[UIImagePNGRepresentation(image) base64EncodedString]];
    CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:base64];
    [self.commandDelegate sendPluginResult:result callbackId:self.callbackID];
}

@end
