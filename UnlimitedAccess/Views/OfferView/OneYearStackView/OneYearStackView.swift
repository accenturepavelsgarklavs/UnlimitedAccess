//
//  OneYearStackView.swift
//  UnlimitedAccess
//
//  Created by pavels.garklavs on 04/03/2022.
//

import UIKit

class OneYearStackView: UIStackView {

    private let bottomStack = OneYearBottomStackView()
    private let topStack = OneYearTopStackView()


    func configure() {
        setupStack()
        setupTopStack()
        setupBottomStack()
    }
}

private extension OneYearStackView {
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
