//
//  CheckoutObject.h
//  OzanCheckout
//
//  Created by mkeremkeskin on 26/07/2017.
//  Copyright © 2017 mkeremkeskin. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 Object containing info for the item being purchased
 */

@interface CheckoutObject : NSObject {

}

/*! @brief Amount of the purchased item */
@property (nonatomic) double amount;

/*! @brief Currency of the purchased item */
@property (nonatomic, nonnull) NSString *currency;

/*! @brief name of your service */
@property (nonatomic, nonnull) NSString *merchantName;

/*!
    Creates checkout object with given parameters
 */
- (nonnull instancetype)initWithAmount:(double) amount andCurrency:(NSString *_Nonnull) currency andMerchantName:(NSString *_Nonnull) merchantName NS_DESIGNATED_INITIALIZER;

- (nullable instancetype)init NS_UNAVAILABLE;

@end
