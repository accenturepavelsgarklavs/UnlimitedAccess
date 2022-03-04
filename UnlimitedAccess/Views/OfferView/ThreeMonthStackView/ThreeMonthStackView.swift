//
//  ThreeMonthStackView.swift
//  UnlimitedAccess
//
//  Created by pavels.garklavs on 04/03/2022.
//

import UIKit

class ThreeMonthStackView: UIStackView {

    private let bottomStack = ThreeMonthBottomStackView()
    private let topStack = ThreeMonthTopStackView()


    func configure() {
        setupStack()
        setupTopStack()
        setupBottomStack()
    }
}

private extension ThreeMonthStackView {
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
