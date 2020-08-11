//
//  ViewController.swift
//  Raymond_L_Save2TextFile_Exercise
//
//  Created by Raymond Lo on 8/11/20.
//  Copyright © 2020 Raymond. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBAction func writeText(_ sender: Any) {
		let fm = FileManager.default
		let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
		let url = urls.last?.appendingPathComponent("file.text")
		do{
			try typeText.text.write(to: url!, atomically: true, encoding: String.Encoding.utf8)
		}catch{
			print("Error writing file")
		}
	}
	
	@IBAction func readText(_ sender: Any) {
		let fm = FileManager.default
		let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
		let url = urls.last?.appendingPathComponent("file.text")
		do{
			let fileContent = try String(contentsOf: url!, encoding: String.Encoding.utf8)
			displayText.text = fileContent
		}catch{
			print("Error reading file")
		}
	}

	@IBOutlet weak var typeText: UITextView!
	
	@IBOutlet weak var displayText: UITextView!
	
		override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		typeText.text = "Type your text here"
		displayText.text = ""
	}
}

