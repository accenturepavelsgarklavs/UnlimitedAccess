//
// Created by pavels.garklavs on 04/03/2022.
//

import UIKit

class OneMonthTopStackView: UIStackView {
    private let priceLabel = UILabel()
    private let numberLabel = UILabel()
    private let descriptionLabel = UILabel()

    func configure() {
        setupStack()
        setupNumberLabel()
        setupDescriptionLabel()
        setupPriceLabel()
    }
}

private extension OneMonthTopStackView {
    func setupStack() {
        backgroundColor = .darkGray
        axis = .vertical
        alignment = .center
        layer.cornerRadius = 2

        self.snp.makeConstraints { make in
            make.width.equalTo(Constants.offerContentWidth)
        }
    }

    func setupPriceLabel() {
        addArrangedSubview(priceLabel)

        priceLabel.text = "5$ / week"
        priceLabel.textColor = .lightGray
        priceLabel.font = UIFont(name: "BebasNeue", size: 18)
    }

    func setupDescriptionLabel() {
        addArrangedSubview(descriptionLabel)

        descriptionLabel.text = "Month"
        descriptionLabel.textColor = Constants.offerGrayColor
        descriptionLabel.font = UIFont(name: "BebasNeue", size: 24)
    }

    func setupNumberLabel() {
        addArrangedSubview(numberLabel)

        numberLabel.text = "1"
        numberLabel.textColor = Constants.offerGrayColor
        numberLabel.font = UIFont(name: "BebasNeue", size: 32)

        numberLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
        }
    }
}
