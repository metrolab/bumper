//
//  BumperViewController.swift
//  Pods
//
//  Created by Eli Kohen on 21/09/16.
//  Copyright © 2016 Letgo. All rights reserved.
//

import UIKit

public class BumperViewController: UIViewController {

    private let tableView = UITableView()
    private let enableBumperContainer = UIView()
    private let enableBumperSwitch = UISwitch()

    private let viewModel: BumperViewModel

    public convenience init() {
        self.init(viewModel: BumperViewModel())
    }

    init(viewModel: BumperViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        initTableView()
        initSwitch()
    }
}


// MARK: - UI

private extension BumperViewController {
    func setupUI() {
        if let viewControllers = navigationController?.viewControllers, viewControllers.count == 1 {
            let leftItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(dismiss))
            navigationItem.leftBarButtonItem = leftItem
        }
        title = "Bumper"
        view.backgroundColor = UIColor.white
        setupEnableHeader()
        setupTableView()
    }

    func setupEnableHeader() {
        enableBumperContainer.translatesAutoresizingMaskIntoConstraints = false
        enableBumperContainer.backgroundColor = UIColor.lightGray
        view.addSubview(enableBumperContainer)

        let enableLabel = UILabel()
        enableLabel.text = "Bumper Enabled:"
        enableLabel.translatesAutoresizingMaskIntoConstraints = false
        enableBumperContainer.addSubview(enableLabel)

        enableBumperSwitch.translatesAutoresizingMaskIntoConstraints = false
        enableBumperContainer.addSubview(enableBumperSwitch)

        var views = [String: AnyObject]()
        views["container"] = enableBumperContainer
        views["label"] = enableLabel
        views["switch"] = enableBumperSwitch

        var metrics = [String: AnyObject]()
        metrics["viewsMargin"] = CGFloat(10) as AnyObject?

        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[container]|",
            options: [], metrics: nil, views: views))
        enableBumperContainer.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-viewsMargin-[label]-[switch]-viewsMargin-|",
            options:  .alignAllCenterY, metrics: metrics, views: views))
        enableBumperContainer.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label]|",
            options: [], metrics: nil, views: views))
    }

    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        var views = [String: AnyObject]()
        views["topLayoutGuide"] = topLayoutGuide
        views["container"] = enableBumperContainer
        views["table"] = tableView

        var metrics = [String: AnyObject]()
        metrics["containerH"] = CGFloat(40) as AnyObject?

        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[topLayoutGuide]-0-[container(containerH)]-0-[table]|",
            options: [], metrics: metrics, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[table]|",
            options: [], metrics: metrics, views: views))
    }

    func initSwitch() {
        enableBumperSwitch.onTintColor = UIColor.darkGray
        enableBumperSwitch.setOn(viewModel.enabled, animated: false)
        enableBumperSwitch.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
    }

    dynamic func switchValueChanged() {
        viewModel.setEnabled(enableBumperSwitch.isOn)
    }

    dynamic func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
}


// MARK: TableView

extension BumperViewController: UITableViewDelegate, UITableViewDataSource {
    private static let cellReuseIdentifier = "bumperCell"

    private func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.featuresCount
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: BumperViewController.cellReuseIdentifier) {
            cell = dequeuedCell
        } else {
            cell = UITableViewCell(style: .value1, reuseIdentifier: BumperViewController.cellReuseIdentifier)
        }
        cell.textLabel?.text = viewModel.featureNameAtIndex(indexPath.row)
        cell.detailTextLabel?.text = viewModel.featureValueAtIndex(indexPath.row)
        return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.featureSelectedAtIndex(indexPath.row)
    }
}


// MARK: - BumperViewModelDelegate

extension BumperViewController: BumperViewModelDelegate {
    func featuresUpdated() {
        tableView.reloadData()
    }

    func showFeature(_ feature: Int, itemsSelection items: [String]) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        for item in items {
            let action = UIAlertAction(title: item, style: .default) { [weak self] _ in
                self?.viewModel.selectedFeature(feature, item: item)
            }
            alert.addAction(action)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}
