//
//  OSCAddress.swift
//  SwiftOSC
//
//  Created by Devin Roth on 6/26/16.
//  Copyright © 2016 Devin Roth Music. All rights reserved.
//

import Foundation





/**
The address of the message.
   
*This struct validates the OSC address you pass into it. Invalid characters are: space * , ? [ ] { } OR two or more / in a row AND must start with / AND no empty strings*
*/
public struct OSCAddress {
    
    //MARK: Properties
    public var string: String {
        didSet {
            if !valid(self.string) {
                NSLog("\"\(self.string)\" is an invalid address")
                self.string = oldValue
            }
        }
    }
    
    //MARK: initializers
    public init() {
        self.string = "/"
    }
    
    
    public init(_ address: String) {
        self.string = "/"
        if valid(address) {
            self.string = address
        } else {
            NSLog("\"\(address)\" is an invalid address")
        }
    }
    
    
    //MARK: methods
    func valid(_ address: String) ->Bool {
        
        var isValid = true
        
        autoreleasepool {
            
            //invalid characters: space * , ? [ ] { } OR two or more / in a row AND must start with / AND no empty strings
            if address.range(of: "[\\s\\*,?\\[\\]\\{\\}]|/{2,}|^[^/]|^$", options: .regularExpression) != nil {
                //returns false if there are any matches
                isValid = false
            }
        }
        
        return isValid
    }
}
