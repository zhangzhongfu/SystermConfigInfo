//
//  SystemConfigCommon.h
//
//  Created by zzf on 2018/7/6.
//  Copyright © 2018 buduobushao. All rights reserved.
//

#ifndef SystemConfigCommon_h
#define SystemConfigCommon_h

//@[@"CPU", @"内存", @"下载", @"上传", @"FPS", @"沙盒"];
typedef NS_ENUM(NSUInteger, SystemConfigInfoSource) {
    SystemConfigInfoSourceCPU,
    SystemConfigInfoSourceMemory,
    SystemConfigInfoSourceDownload,
    SystemConfigInfoSourceUpload,
    SystemConfigInfoSourceFPS,
    SystemConfigInfoSourceSandbox,
};


#endif /* SystemConfigCommon_h */
