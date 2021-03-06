//
//  ViewController.swift
//  UI_DetailListTableview
//
//  Created by Noel on 2019/1/22.
//  Copyright © 2019 Noel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 5
        } else {
            return 3
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NLSubTitleCell", for: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NLSubItemCell", for: indexPath)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cornerRadius: CGFloat = 10.0
        cell.backgroundColor = UIColor.clear
        let layer = CAShapeLayer()
        var bezier: UIBezierPath!
        if indexPath.row == 0 && indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            let bounds = cell.bounds.insetBy(dx: 10, dy: 2)
            bezier = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        } else if indexPath.row == 0 {
            let bounds = CGRect(x: cell.bounds.origin.x + 10, y: cell.bounds.origin.y + 2, width: cell.bounds.width - 20, height: cell.bounds.height - 2)
            bezier = UIBezierPath()
            bezier.move(to: CGPoint(x: bounds.minX, y: bounds.maxY))
            bezier.addArc(withCenter: CGPoint(x: bounds.minX + cornerRadius, y: bounds.minY + cornerRadius), radius: cornerRadius, startAngle: CGFloat.pi, endAngle: CGFloat.pi * 1.5, clockwise: true)
            bezier.addArc(withCenter: CGPoint(x: bounds.maxX - cornerRadius, y: bounds.minY + cornerRadius), radius: cornerRadius, startAngle: CGFloat.pi * 1.5, endAngle: 0, clockwise: true)
            bezier.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
        } else if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            let bounds = CGRect(x: cell.bounds.origin.x + 10, y: cell.bounds.origin.y, width: cell.bounds.width - 20, height: cell.bounds.height - 2)
            bezier = UIBezierPath()
            bezier.move(to: CGPoint(x: bounds.minX, y: bounds.minY))
            bezier.addArc(withCenter: CGPoint(x: bounds.minX + cornerRadius, y: bounds.maxY - cornerRadius), radius: cornerRadius, startAngle: CGFloat.pi, endAngle: CGFloat.pi * 0.5, clockwise: false)
            bezier.addArc(withCenter: CGPoint(x: bounds.maxX - cornerRadius, y: bounds.maxY - cornerRadius), radius: cornerRadius, startAngle: CGFloat.pi * 0.5, endAngle: 0, clockwise: false)
            bezier.addLine(to: CGPoint(x: bounds.maxX, y: bounds.minY))
        } else {
            let bounds = cell.bounds.insetBy(dx: 10, dy: 0)
            bezier = UIBezierPath()
            bezier.move(to: CGPoint(x: bounds.minX, y: bounds.minY))
            bezier.addLine(to: CGPoint(x: bounds.minX, y: bounds.maxY))
            bezier.move(to: CGPoint(x: bounds.maxX, y: bounds.minY))
            bezier.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
        }
        layer.path = bezier.cgPath
        layer.strokeColor = UIColor.lightGray.cgColor
        layer.fillColor = UIColor.white.cgColor
        layer.lineWidth = 2
        let borderView = UIView(frame: cell.bounds)
        borderView.layer.insertSublayer(layer, at: 0)
        borderView.backgroundColor = UIColor.clear
        cell.backgroundView = borderView
    }
}
