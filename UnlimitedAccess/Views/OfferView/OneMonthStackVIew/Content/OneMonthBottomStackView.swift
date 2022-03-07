//
// Created by pavels.garklavs on 04/03/2022.
//

import UIKit

class OneMonthBottomStackView: UIStackView {
    private let priceLabel = UILabel()
    private let descriptionLabel = UILabel()

    func configure() {
        setupStack()
        setupPriceLabel()
        setupDescriptionLabel()

    }
}

private extension OneMonthBottomStackView {
    func setupStack() {
        backgroundColor = .darkGray
        axis = .vertical
        alignment = .center
        distribution = .fillEqually
        layer.cornerRadius = 2

        self.snp.makeConstraints { make in
            make.width.equalTo(Constants.offerContentWidth)
        }
    }

    func setupPriceLabel() {
        addArrangedSubview(priceLabel)

        priceLabel.text = "15$"
        priceLabel.textColor = Constants.offerGrayColor
        priceLabel.font = UIFont(name: "BebasNeue", size: 16)
    }

    func setupDescriptionLabel() {
        addArrangedSubview(descriptionLabel)

        descriptionLabel.text = "Month"
        descriptionLabel.textColor = Constants.offerGrayColor
        descriptionLabel.font = UIFont(name: "BebasNeue", size: 16)
    }
}
