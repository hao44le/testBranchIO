//
//  ViewController.swift
//  testBranchIO
//
//  Created by Gelei Chen on 31/12/2015.
//  Copyright © 2015 geleichen. All rights reserved.
//

import UIKit

class ViewController: UIViewController,BranchDeepLinkingController{

    override func viewDidLoad() {
        super.viewDidLoad()
        let branchUniversalObject: BranchUniversalObject = BranchUniversalObject(canonicalIdentifier: "item/12345")
        branchUniversalObject.title = "My Content Title"
        branchUniversalObject.contentDescription = "My Content Description"
        branchUniversalObject.imageUrl = "https://example.com/mycontent-12345.png"
        branchUniversalObject.addMetadataKey("property1", value: "blue")
        branchUniversalObject.addMetadataKey("property2", value: "red")
        
        let linkProperties: BranchLinkProperties = BranchLinkProperties()
        linkProperties.feature = "sharing"
        linkProperties.channel = "facebook"
        linkProperties.addControlParam("$desktop_url", withValue: "http://example.com/home")
        linkProperties.addControlParam("$ios_url", withValue: "http://example.com/ios")
        
        branchUniversalObject.getShortUrlWithLinkProperties(linkProperties,  andCallback: { (url: String?, error: NSError?) -> Void in
            if error == nil {
                NSLog("got my Branch link to share: %@", url!)
            }
        })
                // Do any additional setup after loading the view, typically from a nib.
    }
    
    func configureControlWithData(data: [NSObject : AnyObject]!) {
        var pictureUrl = data["product_picture"]
        print(pictureUrl)
        
    }
    var deepLinkingCompletionDelegate: BranchDeepLinkingControllerCompletionDelegate?
    func closePressed() {
        self.deepLinkingCompletionDelegate!.deepLinkingControllerCompleted()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

