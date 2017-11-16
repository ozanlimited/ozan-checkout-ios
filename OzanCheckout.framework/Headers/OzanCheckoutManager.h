//
//  OzanCheckoutManager.h
//  OzanCheckout
//
//  Created by mkeremkeskin on 21/07/2017.
//  Copyright © 2017 mkeremkeskin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CheckoutObject.h"
#import "CheckoutErrorModel.h"

/*!
 @typedef
 
 Enums for selecting necessary environment
 
 @enum EnvSandbox
 @enum EnvProduction

 */

typedef enum {
    EnvDev,
    EnvQA,
    EnvSandbox,
    EnvProduction
} Environment;


/*!
 @protocol OzanCheckoutManagerDelegate

 The OzanCheckoutManagerDelegate protocol

 This is used to give info about the state of CheckoutView
 */

@protocol OzanCheckoutManagerDelegate

@optional

/*!

 Called when authentication is done successfully to OzanWallet

 */
- (void) authenticationSuccessful;

@required

/*!

 Called when an error is coming from CheckoutView
 
 @param checkoutErrorModel model containing error details

*/
- (void) errorOccured: (CheckoutErrorModel * _Nonnull) checkoutErrorModel;

/*!

 Called when a payment is finished

 @param paymentToken token string

 */
- (void) paymentTokenReceived: (NSString * _Nonnull) paymentToken;

@end

/*!

 Where all the mambo jambo is happening

 */

@interface OzanCheckoutManager : NSObject <OzanCheckoutManagerDelegate>{

}

@property (nonatomic, nonnull) id <OzanCheckoutManagerDelegate> ozanCheckoutManagerDelegate;

+ (instancetype _Nonnull ) sharedManager;

/*!

 Setting the public api key which being used when making checkout with webview
 
 @param apiKey your public api key
 
 <pre>@textblock
 OzanCheckoutManager.shared().setPublicApiKey("xxxxxxx-xxx-xxxx-xxxx-xxxxxxx")
 @/textblock</pre>

 */
- (void) setPublicApiKey: (NSString * _Nonnull) apiKey;


/*!

 Setting the environment

 @param environment selected environment

 <pre>@textblock
 OzanCheckoutManager.shared().setEnvironment(Environment.EnvProduction)
 @/textblock</pre>

 */
- (void) setEnvironment: (Environment) environment;


/*!

 Shows checkout screen via presenting it

 @param visibleViewController view controller to present from
 @param checkoutObject Object containing info for the item being purchased

 <pre>@textblock
 let checkoutObject = CheckoutObject.init(amount: 61.98, andCurrency: "EUR", andMerchantName: "")
 OzanCheckoutManager.shared().presentCheckoutScreen(self, withCheckoutInfo: checkoutObject)
 @/textblock</pre>

 */
- (void) presentCheckoutScreen: (UIViewController * _Nonnull) visibleViewController withCheckoutInfo:(CheckoutObject* _Nonnull) checkoutObject;


/*!

 Shows checkout screen via pushing it to navigation stack

 @param navigationController navigation controller to push from
 @param checkoutObject Object containing info for the item being purchased
 
 <pre>@textblock
 let checkoutObject = CheckoutObject.init(amount: 61.98, andCurrency: "EUR", andMerchantName: "")
 OzanCheckoutManager.shared().pushCheckoutScreen(toNavigation: self.navigationController!, withCheckoutInfo: checkoutObject)
 @/textblock</pre>

 */
- (void) pushCheckoutScreenToNavigation: (UINavigationController * _Nonnull) navigationController withCheckoutInfo:(CheckoutObject* _Nonnull) checkoutObject;

@end
