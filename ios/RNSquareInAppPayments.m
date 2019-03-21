/*
 Copyright 2019 Square Inc.
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
*/

#import "RNSquareInAppPayments.h"


@implementation RNSquareInAppPayments

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE();

RCT_REMAP_METHOD(setApplicationId,
                 applicationId
                 : (NSString *)applicationId
                     setApplicationIdWithResolver
                 : (RCTPromiseResolveBlock)resolve
                     rejecter
                 : (RCTPromiseRejectBlock)reject)
{
    dispatch_async([self methodQueue], ^{
        SQIPInAppPaymentsSDK.squareApplicationID = applicationId;
        resolve([NSNull null]);
    });
}

@end