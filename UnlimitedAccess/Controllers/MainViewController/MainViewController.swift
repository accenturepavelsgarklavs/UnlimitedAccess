//
//  MainViewController.swift
//  UnlimitedAccess
//
//  Created by pavels.garklavs on 03/03/2022.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    private var mainViewModel: MainViewModel?

    private let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    private let continueButton = ParallelogramButton()
    private let footerStack = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupFooterStack()
        setupContinueButton()
    }

    func configure(mainViewModel: MainViewModel) {
            self.mainViewModel = mainViewModel
        }
}

private extension MainViewController {
    func setupBackground() {
        backgroundImage.image = UIImage(named: "bgImage")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        view.addSubview(backgroundImage)
    }

    func setupContinueButton() {
        view.addSubview(continueButton)
        continueButton.configure(offset: 10, fillColor: .blue)

        continueButton.setTitle("Continue", for: .normal)
        continueButton.titleLabel?.font = UIFont(name: "BebasNeue", size: 32)
        
        continueButton.setTitleColor(.gray, for: .highlighted)

        continueButton.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.bottom.equalTo(footerStack.snp.top).offset(-25)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
    }

    func setupFooterStack() {
        view.addSubview(footerStack)

        // Usage only to fill in stack view and not writing three separate labels.
        for data in TaskManager.shared.footerData {
            let dataLabel = UILabel()
            dataLabel.text = data
            dataLabel.font = .systemFont(ofSize: 12)
            dataLabel.textColor = .lightGray
            footerStack.addArrangedSubview(dataLabel)
        }

        footerStack.distribution = .equalSpacing
        footerStack.axis = .horizontal

        footerStack.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
}