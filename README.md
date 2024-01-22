# iOS

Integrating One Tap OTPLESS Sign In into your Ios Application using our SDK is a streamlined process. This guide offers a comprehensive walkthrough, detailing the steps to install the SDK and seamlessly retrieve user information.

1. Install **OTPless SDK** Dependency

- In your app's project file, please insert the following line into the dependencies section.
```
pod 'OtplessSDK', '1.1.6'
```

- In your project root folder run the command.
```
pod repo update
pod install
```

2. Configure **info.plist**

- Add the following block to your info. plist file.

```xml
<key>CFBundleURLTypes</key>
<array>
	<dict>
	<key>CFBundleURLSchemes</key> 
	<array>
		<string>$(PRODUCT_BUNDLE_IDENTIFIER).otpless</string> 
	</array>
	<key>CFBundleTypeRole</key>
	<string>Editor</string>
	<key>CFBundleURLName</key>
	<string>otpless</string> 
	</dict>
</array> 
<key>LSApplicationQueriesSchemes</key> 
<array>
	<string>whatsapp</string>
	<string>otpless</string> 
	<string>gootpless</string>
	<string>com.otpless.ios.app.otpless</string> 
	<string>googlegmail</string>
</array>
```

- **Handle Redirection**
- Add the code to your App Delegate or Scene Delegate to handle redirection.
- `App Delegate`

    ```swift
      func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool { 
       if Otpless.sharedInstance.isOtplessDeeplink(url: url){
       Otpless.sharedInstance.processOtplessDeeplink(url: url) }
       return true 
     }
    ```
- `Scene Delegate`

    ```swift
      func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
       for context in URLContexts {
        if Otpless.sharedInstance.isOtplessDeeplink(url: context.url.absoluteURL) {
         Otpless.sharedInstance.processOtplessDeeplink(url: context.url.absoluteURL)
        }
        break
       }
      }
    ```

3. **Configure Sign up/Sign in**

- Import the OTPLESS SDK in your file.

```swift
import OtplessSDK
```

- Add the following code in your viewDidLoad() function.

```swift
Otpless.sharedInstance.delegate = self
var initialParams = [String:Any]()
initialParams["cid"] = "HRIRBIIKXMKEOTDDA8VV4HP2V24454X8" // Add your cid value (to get the cid value go to otpless.com/platforms/ios
initialParams["uxmode"] = "anf" // Add this code to enable autoclick mode
var params =  [String:Any]()
params["method"] = "get"
params["params"] = initialParams
Otpless.sharedInstance.showOtplessLoginPageWithParams(vc: self, params: params)
```


# Thank You

# [Visit OTPless](https://otpless.com/platforms/ios)
