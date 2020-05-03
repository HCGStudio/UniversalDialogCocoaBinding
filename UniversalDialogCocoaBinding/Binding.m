//
//  Binding.m
//  UniversalDialogCocoaBinding
//
//  Created by 尹照宇 on 2020/5/3.
//  Copyright © 2020 HCGStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : unsigned long
{
    AbortRetryIgnore = 0x00000002L,
    OkButton = 0x00000000L,
    OkCancel = 0x00000001L,
    RetryCancel = 0x00000005L,
    YesNo = 0x00000004L,
    YesNoCancel = 0x00000003L,
    CancelTryContinue = 0x00000006L,
} DialogButton;

typedef enum : unsigned long
{
    Exclamation = 0x00000030L,
    Information = 0x00000040L,
    Error = 0x00000010L,
    None = 0
} DialogIcon;

typedef enum : int
{
    Abort = 3,
    Cancel = 2,
    Continue = 11,
    Ignore = 5,
    No = 7,
    OkResult = 1,
    Retry = 4,
    TryAgain = 10,
    Yes = 6,
    Failed = 0
} DialogResult;

int ShowMessageDialog(char *caption, char *text,DialogIcon icon,char* defaultButton, char* alternateButton, char* otherButton)
{
    CFOptionFlags response;
    CFStringRef captionRef = CFStringCreateWithCString(nil, caption, kCFStringEncodingUTF8);
    CFStringRef textRef = CFStringCreateWithCString(nil, text, kCFStringEncodingUTF8);
    
    CFStringRef defaultButtonRef = nil,alternateButtonRef = nil, otherButtonRef =nil;
    if(defaultButton != nil)
        defaultButtonRef =  CFStringCreateWithCString(nil, defaultButton, kCFStringEncodingUTF8);
    if(alternateButton != nil)
        alternateButtonRef = CFStringCreateWithCString(nil, alternateButton, kCFStringEncodingUTF8);
    if(otherButton != nil)
        otherButtonRef = CFStringCreateWithCString(nil, otherButton, kCFStringEncodingUTF8);
    CFOptionFlags level;
    switch (icon)
    {
        case None:
            level = kCFUserNotificationPlainAlertLevel;
            break;
        case Information:
            level = kCFUserNotificationNoteAlertLevel;
            break;
        case Exclamation:
            level = kCFUserNotificationCautionAlertLevel;
            break;
        case Error:
            level = kCFUserNotificationStopAlertLevel;
            break;
        default:
            return Failed;
            break;
    }
    
    int result = CFUserNotificationDisplayAlert(0, level, nil, nil, nil,
                                                captionRef, textRef, defaultButtonRef,
                                                alternateButtonRef, otherButtonRef, &response);
    CFRelease(captionRef);
    CFRelease(textRef);
    if(defaultButtonRef != nil)
        CFRelease(defaultButtonRef);
    if(alternateButtonRef != nil)
        CFRelease(alternateButtonRef);
    if(otherButtonRef != nil)
        CFRelease(otherButtonRef);
    if(result == 0)
        return response;
    return -1;
}
