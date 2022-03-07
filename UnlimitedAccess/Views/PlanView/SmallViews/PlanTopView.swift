//
// Created by pavels.garklavs on 07/03/2022.
//

import UIKit

class PlanTopView: UIView {

    struct Model {
        var durationText: String?
        var pricePereWeekText: String?
        var durationUnitText: String?
    }

    private let planDurationLabel = UILabel()
    private let durationUnitLabel = UILabel()
    private let pricePerWeekLabel = UILabel()

    func configure() {
        setupView()
        setupPlanDurationLabel()
        setupDurationUnitLabel()
        setupPricePerWeekLabel()
    }

    func setTopPlanInfo(model: Model) {
        planDurationLabel.text = model.durationText
        durationUnitLabel.text = model.durationUnitText
        pricePerWeekLabel.text = model.pricePereWeekText
    }
}

private extension PlanTopView {
    func setupView() {
        backgroundColor = .gray
        layer.cornerRadius = 2
    }

    func setupPlanDurationLabel() {
        addSubview(planDurationLabel)

        planDurationLabel.font = UIFont(name: "BebasNeue", size: 32)
        planDurationLabel.textColor = .white
        planDurationLabel.textAlignment = .center

        planDurationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
        }
    }

    func setupDurationUnitLabel() {
        addSubview(durationUnitLabel)

        durationUnitLabel.font = UIFont(name: "BebasNeue", size: 28)
        durationUnitLabel.textColor = .white
        durationUnitLabel.textAlignment = .center

        durationUnitLabel.snp.makeConstraints { make in
            make.top.equalTo(planDurationLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }

    func setupPricePerWeekLabel() {
        addSubview(pricePerWeekLabel)

        pricePerWeekLabel.font = UIFont(name: "BebasNeue", size: 18)
        pricePerWeekLabel.textColor = .white
        pricePerWeekLabel.textAlignment = .center

        pricePerWeekLabel.snp.makeConstraints { make in
            make.top.equalTo(durationUnitLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }
}
