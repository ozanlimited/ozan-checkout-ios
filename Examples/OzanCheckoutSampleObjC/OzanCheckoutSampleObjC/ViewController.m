//
//  ViewController.m
//  OzanCheckoutSampleObjC
//
//  Created by mkeremkeskin on 03/08/2017.
//  Copyright © 2017 mkeremkeskin. All rights reserved.
//

#import "ViewController.h"
#import <OzanCheckout/OzanCheckoutManager.h>

@interface ViewController () <OzanCheckoutManagerDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *envPickerView;
@property (weak, nonatomic) IBOutlet UITextField *apiKeyTextField;

@end

@implementation ViewController

NSArray *environments;

- (void)viewDidLoad {
    [super viewDidLoad];

    environments = @[@"Dev", @"QA", @"Sandbox", @"Production"];
    [OzanCheckoutManager.sharedManager setEnvironment:EnvDev];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];

}

- (IBAction)presentWebview {

    [OzanCheckoutManager.sharedManager setPublicApiKey:_apiKeyTextField.text];
    [OzanCheckoutManager.sharedManager setLocale:localeRU];
    OzanCheckoutManager.sharedManager.ozanCheckoutManagerDelegate = self;
    CheckoutObject *checkoutObject = [[CheckoutObject alloc] initWithAmount:61.98 andCurrency:@"EUR" andMerchantName:@""];
    [OzanCheckoutManager.sharedManager presentCheckoutScreen:self withCheckoutInfo:checkoutObject];
}

- (IBAction)pushWebview {

    [OzanCheckoutManager.sharedManager setPublicApiKey:_apiKeyTextField.text];
    [OzanCheckoutManager.sharedManager setLocale:localeRU];
    OzanCheckoutManager.sharedManager.ozanCheckoutManagerDelegate = self;
    CheckoutObject *checkoutObject = [[CheckoutObject alloc] initWithAmount:61.98 andCurrency:@"EUR" andMerchantName:@""];
    [OzanCheckoutManager.sharedManager pushCheckoutScreenToNavigation:self.navigationController withCheckoutInfo:checkoutObject];
}

- (void)dismissKeyboard {
    [self.view endEditing:TRUE];
}

// MARK: - OzanCheckoutManagerDelegate

- (void)authenticationSuccessful {
    NSLog(@"YAYYY! You are logged in!");
}

- (void)errorOccured:(CheckoutErrorModel *)checkoutErrorModel {
    NSLog(@"Ooops something is wrong here is your message: %@", checkoutErrorModel.errorMessage);
}

- (void)paymentTokenReceived:(NSString *)paymentToken {
    NSLog(@"Payment is finished. Here is your token:  %@", paymentToken);
}

- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return environments.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return environments[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if(row == 0) {
        [OzanCheckoutManager.sharedManager setEnvironment:EnvDev];
    }
    else if(row == 1) {
        [OzanCheckoutManager.sharedManager setEnvironment:EnvQA];
    }
    else if(row == 2) {
        [OzanCheckoutManager.sharedManager setEnvironment:EnvSandbox];
    }
    else {
        [OzanCheckoutManager.sharedManager setEnvironment:EnvProduction];
    }
}
@end

