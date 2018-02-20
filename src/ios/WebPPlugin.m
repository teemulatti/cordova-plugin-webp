// Teemu Lätti

#import "WebPPlugin.h"
#import "STWebPDecoder.h"

@implementation WebPPlugin

- (void) pluginInitialize {
}

- (void) decodeWebp:(CDVInvokedUrlCommand*)command
{
    // Webp path
    if ([command.arguments count] == 0) {
        CDVPluginResult * result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"No path given"];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        return;
    }
    NSString * const path = [command.arguments objectAtIndex:0];
    if ([path length] == 0) {
        CDVPluginResult * result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Given path is empty"];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        return;
    }

    // Load webp from local file url
    NSData * data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:path]];
    if (data == nil) {
        CDVPluginResult * result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Could not load webp"];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        return;
    }

    // Convert webp to image
    UIImage * image = [STWebPDecoder imageWithData:data scale:1 error:NULL];
    if (image == nil) {
        CDVPluginResult * result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Could not convert webp to image"];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        return;
    }

    // Convert image to base64 string
    NSString * base64 = [NSString stringWithFormat:@"data:image/png;base64,%@",
                         [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength]];
    if (base64 == nil || [base64 length] == 0) {
        CDVPluginResult * result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Could not convert image to base64"];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        return;
    }

    // Return base64 encoded PNG image string
    CDVPluginResult * result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:base64];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

@end
