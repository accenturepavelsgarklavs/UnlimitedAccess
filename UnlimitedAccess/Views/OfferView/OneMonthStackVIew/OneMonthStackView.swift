//
//  OneMonthStackView.swift
//  UnlimitedAccess
//
//  Created by pavels.garklavs on 04/03/2022.
//

import UIKit

class OneMonthStackView: UIStackView {

    private let bottomStack = OneMonthBottomStackView()
    private let topStack = OneMonthTopStackView()


    func configure() {
        setupStack()
        setupTopStack()
        setupBottomStack()
    }
}

private extension OneMonthStackView {
    func setupStack() {
        spacing = 5
        axis = .vertical
    }

    func setupBottomStack() {
        addArrangedSubview(bottomStack)
        bottomStack.configure()
    }

    func setupTopStack() {
        addArrangedSubview(topStack)
        topStack.configure()
    }
}
