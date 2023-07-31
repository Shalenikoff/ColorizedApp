//
//  MainViewController.swift
//  ColorizedApp
//
//  Created by Кирилл Шалеников on 30.07.2023.
//

import UIKit

protocol ColorSettingsViewControllerDelegate {
    func setColor(_ color: UIColor)
}

class MainViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorSettingsVC = segue.destination as? ColorSettingsViewController else { return }
        colorSettingsVC.delegate = self
        colorSettingsVC.viewColor = view.backgroundColor
    }
}

// MARK: ColorDelegate
extension MainViewController: ColorSettingsViewControllerDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
