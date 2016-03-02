//
//  ViewController.swift
//  DND Test
//
//  Created by Tilman Schlenker on 19/02/16.
//  Copyright © 2016 Tilman Schlenker. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var drop: DropView!
    @IBOutlet var text: NSTextView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        drop.text = text
        drop.registerForDraggedTypes([kUTTypeUTF8PlainText as String,"application/x-avid.entity+json"])
        
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

