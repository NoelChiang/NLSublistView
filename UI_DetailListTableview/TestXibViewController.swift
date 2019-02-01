//
//  TestXibViewController.swift
//  UI_DetailListTableview
//
//  Created by Noel on 2019/2/1.
//  Copyright © 2019 Noel. All rights reserved.
//

import UIKit

class TestXibViewController: UIViewController {

    @IBOutlet weak var listView: NLSubListView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let listData = [NLSubListData(title: NSAttributedString(string: "3690"),
                                      subTitle: NSAttributedString(string: "2/01 (FRI)"),
                                      items: [NSAttributedString(string: "Resident evil RE2  1790"),
                                              NSAttributedString(string: "Kindom hearts 3  1990")]),
                        NLSubListData(title: NSAttributedString(string: "22480"),
                                      subTitle: NSAttributedString(string: "2/02 (SAT)"),
                                      items: [NSAttributedString(string: "Magic stone  1500"),
                                              NSAttributedString(string: "PS4 pro  10990"),
                                              NSAttributedString(string: "Switch  9990")]),
                        NLSubListData(title: NSAttributedString(string: "500"),
                                      subTitle: NSAttributedString(string: "2/01 (FRI)"),
                                      items: [NSAttributedString(string: "Hot pot  1790")])]
        listView.setupListData(list: listData)
    }
}
