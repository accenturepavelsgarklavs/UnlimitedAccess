//
// Created by pavels.garklavs on 04/03/2022.
//

import UIKit

class OneYearTopStackView: UIStackView {
    private let priceLabel = UILabel()
    private let numberLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let discountLabel = UILabel()

    func configure() {
        setupStack()
        setupDiscountLabel()
        setupNumberLabel()
        setupDescriptionLabel()
        setupPriceLabel()
    }
}

private extension OneYearTopStackView {
    func setupStack() {
        backgroundColor = .blue
        axis = .vertical
        alignment = .center
        layer.cornerRadius = 2

        self.snp.makeConstraints { make in
            make.width.equalTo(Constants.offerContentWidth)
        }
    }

    func setupPriceLabel() {
        addArrangedSubview(priceLabel)

        priceLabel.text = "15$ / week"
        priceLabel.textColor = .lightGray
        priceLabel.font = UIFont(name: "BebasNeue", size: 18)
    }

    func setupDescriptionLabel() {
        addArrangedSubview(descriptionLabel)

        descriptionLabel.text = "Year"
        descriptionLabel.textColor = .white
        descriptionLabel.font = UIFont(name: "BebasNeue", size: 24)
    }

    func setupNumberLabel() {
        addArrangedSubview(numberLabel)

        numberLabel.text = "1"
        numberLabel.textColor = .white
        numberLabel.font = UIFont(name: "BebasNeue", size: 32)
    }

    func setupDiscountLabel() {
        addArrangedSubview(discountLabel)

        discountLabel.text = "Save 50%"
        discountLabel.textColor = .black
        discountLabel.font = UIFont(name: "BebasNeue", size: 16)
        
        discountLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
        }
    }
}
