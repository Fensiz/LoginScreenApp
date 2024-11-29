//
//  ViewController.swift
//  LoginScreenApp
//
//  Created by Симонов Иван Дмитриевич on 28.11.2024.
//

import UIKit

class ViewController: UIViewController {
	// MARK: - IB Outlets
	@IBOutlet weak var button: UIButton!
	@IBOutlet weak var memSwitch: UISwitch!
	@IBOutlet weak var userNameTextField: UITextField!
	
	// MARK: - View Life Cycles
	override func viewDidLoad() {
		super.viewDidLoad()

		setupHeaderAppearance()
		setupButton()
		view.backgroundColor = .secondarySystemBackground
	}
	override func viewWillAppear(_ animated: Bool) {
		userNameTextField.text = UserDefaults.standard.string(forKey: "userName")
		memSwitch.isOn = UserDefaults.standard.bool(forKey: "rememberMe")
		setupTitle()
	}
	override func viewDidDisappear(_ animated: Bool) {
		UserDefaults.standard.set(memSwitch.isOn ? userNameTextField.text : nil, forKey: "userName")
		UserDefaults.standard.set(memSwitch.isOn, forKey: "rememberMe")
	}
	
	// MARK: - IBActions
	@IBAction func logInAction(_ sender: UIButton) {
		//TO DO
	}
	
	// MARK: - Private Methods
	private func setupTitle() {
		if let name = userNameTextField.text, !name.isEmpty {
			title = "Welcome, \(name)"
		} else {
			title = "Welcome, Guest!"
		}
	}
	private func setupButton() {
		button.backgroundColor = .init(red: 76.0/255, green: 117.0/255, blue: 249.0/255, alpha: 1)
		button.clipsToBounds = true
		button.layer.cornerRadius = 16
		button.tintColor = .white
		
	}
	private func setupHeaderAppearance() {
		// Включаем стандартный маленький заголовок
		navigationController?.navigationBar.prefersLargeTitles = false
		
		// Настройка внешнего вида панели навигации с белым фоном
		let appearance = UINavigationBarAppearance()
		appearance.configureWithOpaqueBackground() // С непрозрачным фоном
		appearance.backgroundColor = .systemBackground
		
		// Цвет текста заголовка
		appearance.titleTextAttributes = [
			.foregroundColor: UIColor.label,
			.font: UIFont.systemFont(ofSize: 17) // Размер шрифта для маленького заголовка
		]
		
		// Добавление разделителя между панелью и контентом
		appearance.shadowColor = .lightGray // Цвет тени для разделителя (по умолчанию lightGray)
		
		// Применение настроек для панели навигации
		navigationController?.navigationBar.standardAppearance = appearance
		navigationController?.navigationBar.scrollEdgeAppearance = appearance
	}
}
