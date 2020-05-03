//
//  Binding.cpp
//  UniversalDialogCocoaBinding
//
//  Created by 尹照宇 on 2020/4/30.
//  Copyright © 2020 HCGStudio. All rights reserved.
//

#include <CoreFoundation/CoreFoundation.h>
#include <objc/objc.h>
#include <objc/objc-runtime.h>

enum class DialogButton
{
    AbortRetryIgnore = 0x00000002L,
    Ok = 0x00000000L,
    OkCancel = 0x00000001L,
    RetryCancel = 0x00000005L,
    YesNo = 0x00000004L,
    YesNoCancel = 0x00000003L,
    CancelTryContinue = 0x00000006L,
};

enum class DialogIcon
{
    Exclamation = 0x00000030L,
    Information = 0x00000040L,
    Error = 0x00000010L,
    None = 0
};
enum class DialogResult
{
    Abort = 3,
    Cancel = 2,
    Continue = 11,
    Ignore = 5,
    No = 7,
    Ok = 1,
    Retry = 4,
    TryAgain = 10,
    Yes = 6,
    Failed = 0
};

extern "C" DialogResult ShowMessageDialog(char *caption, char *text, DialogButton button, DialogIcon icon);

DialogResult ShowMessageDialog(char *caption, char *text, DialogButton button, DialogIcon icon)
{

        CFOptionFlags result;
        
        CFUserNotificationDisplayAlert(
                                       0,
                                       kCFUserNotificationNoteAlertLevel,
                                       NULL,
                                       NULL,
                                       NULL,
                                       CFSTR("456"),
                                       CFSTR("123"),
                                       NULL,
                                       CFSTR("Cancel"),
                                       NULL,
                                       &result
                                       );

    return DialogResult::Failed;
}
