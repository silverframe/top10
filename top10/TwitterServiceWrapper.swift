//
//  TwitterServiceWrapper.swift
//  top10
//
//  Created by Stefanie Seah on 30/8/16.
//  Copyright © 2016 Stefanie Seah. All rights reserved.
//

import Foundation
import Alamofire
import OAuthSwift


public class TwitterServiceWrapper:NSObject {
    let consumerKey: String = ""
    let consumerSecret: String = ""
    let authURL: String = "https://api.twitter.com/oauth2/token"
    
//    let oauthswift = OAuth1Swift(
//        consumerKey:    "dkXuJsgk4AWHHYvHi3Cpw8NDO",
//        consumerSecret: "ZcIC5zdA92HjtBtvliR1MF0EsXUHXT92lhKGYI8EqiRp1qEJiR",
//        requestTokenUrl: "https://api.twitter.com/oauth/request_token",
//        authorizeUrl:    "https://api.twitter.com/oauth/authorize",
//        accessTokenUrl:  "https://api.twitter.com/oauth/access_token"
//    )
//    
//    oauthswift.authorizeWithCallbackURL(
//    NSURL(string: "oauth-swift://oauth-callback/twitter")!,
//    success: { credential, response, parameters in
//    print(credential.oauth_token)
//    print(credential.oauth_token_secret)},
//    failure: { error in
//    print(error.localizedDescription)
//    
//    })
    
//    func getBase64EncodeString() -> String {
//        
//        let consumerKeyRFC1738 = consumerKey.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())
//        
//        let consumerSecretRFC1738 = consumerSecret.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())
//        
//        let concatenateKeyAndSecret = "\(consumerKeyRFC1738) : \(consumerSecretRFC1738)"
//        
//        let secretAndKeyData = concatenateKeyAndSecret.dataUsingEncoding(NSASCIIStringEncoding, allowLossyConversion: true)
//        
//        let base64EncodeKeyAndSecret =  secretAndKeyData?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions())
//        
//        return base64EncodeKeyAndSecret!
//    }
//    
//    func getBearerToken(completion:(bearerToken: String) -> Void) {
//        var request = NSMutableURLRequest(URL: NSURL(string: authURL)!)
//        request.HTTPMethod = "POST"
//        request.addValue("Basic" + getBase64EncodeString(), forHTTPHeaderField: "Authorization")
//        request.addValue("application/x-www-form-urlencoded;charset=UTF-8", forHTTPHeaderField:"Content-Type")
//        var grantType = "grant_type=client_credentials"
//        request.HTTPBody = grantType.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion:  true)
//        
//        NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: {(data: NSData!,response:NSURLResponse!, error: NSError!) -> Void in
//            var errorPointer : NSErrorPointer = nil
//            if let results: NSDictionary = NSJSONSerialization .JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments , error: errorPointer) as? NSDictionary {
//                if let token = results["access_token"] as? String {
//                    completion(bearerToken: token)
//                } else {
//                    println(results["errors"])
//                }
//            }
//        }).resume()
//    }
//    
//    func getBearerToken1(completion:(bearerToken: String) -> Void){
//        let grantType = "grant_type=client_credentials"
//        
//        Alamofire.request(.POST, authURL, parameters: grantType.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true) , headers: ["Authorization" : "Basic \(getBase64EncodeString())", "Content-Type" : "application/x-www-form-urlencoded;charset=UTF-8"] )
//        
//    }
}



