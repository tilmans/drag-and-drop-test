//
//  DropView.swift
//  DND Test
//
//  Created by Tilman Schlenker on 19/02/16.
//  Copyright © 2016 Tilman Schlenker. All rights reserved.
//

import Cocoa

class DropView: NSView {

    var text:NSTextView?
    
    func log(content:String) {
        Swift.print(content)
        if let textexists = text {
            let attribString = NSAttributedString(string:content+"\n")
            textexists.textStorage?.appendAttributedString(attribString)
            textexists.scrollToEndOfDocument(nil)
        }
    }
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
    }
    
    override func draggingEntered(sender: NSDraggingInfo) -> NSDragOperation {
        let pboard = sender.draggingPasteboard()
        let data = pboard.dataForType("application/x-avid.entity+json")
        if let dataexists = data {
            let string = NSString(data: dataexists, encoding: NSUTF8StringEncoding)
            if let stringexists = string {
                log("Data is: \(stringexists)")
                return NSDragOperation.Copy
            }
        }
        if let textdata = pboard.dataForType(kUTTypeUTF8PlainText as String) {
            if let string = NSString(data: textdata, encoding: NSUTF8StringEncoding) {
                log("Data is: \(string)")
                return NSDragOperation.Copy
            }
        }
        return NSDragOperation.None
    }
    
}
