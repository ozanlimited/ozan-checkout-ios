//
//  OzanCheckoutErrorModel.h
//  OzanCheckout
//
//  Created by mkeremkeskin on 28/07/2017.
//  Copyright © 2017 mkeremkeskin. All rights reserved.
//

#import <Foundation/Foundation.h>


/*!
 Error object for OzanCheckout
 */
@interface CheckoutErrorModel : NSObject {

}

/*! @brief errorCode (some numbers) */
@property (nonatomic, nonnull) NSString *errorCode;

/*! @brief message coming from OzanCheckout, can be shown to user */
@property (nonatomic, nonnull) NSString *errorMessage;

@end
