//
// Created by pavels.garklavs on 07/03/2022.
//

import UIKit

final class PlanBottomView: UIView {

    struct Model {
        var priceLabelText: String?
        var unitLabelText: String?
    }

    private let priceLabel = UILabel()
    private let unitLabel = UILabel()

    func configure() {
        setupView()
        setupPriceLabel()
        setupUnitLabel()
    }

    func setBottomPlanInfo(model: Model) {
        priceLabel.text = model.priceLabelText
        unitLabel.text = model.unitLabelText
    }

}

private extension PlanBottomView {
    func setupView() {
        backgroundColor = .gray
        layer.cornerRadius = 2
    }

    func setupPriceLabel() {
        addSubview(priceLabel)

        priceLabel.font = UIFont(name: "BebasNeue", size: 16)
        priceLabel.textColor = .white
        priceLabel.textAlignment = .center

        priceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.centerX.equalToSuperview()
        }
    }

    func setupUnitLabel() {
        addSubview(unitLabel)

        unitLabel.font = UIFont(name: "BebasNeue", size: 16)
        unitLabel.textColor = .white
        unitLabel.textAlignment = .center

        unitLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
    }
}
