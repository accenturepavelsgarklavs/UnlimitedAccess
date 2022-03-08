//
// Created by pavels.garklavs on 07/03/2022.
//

import UIKit

class PlanTopView: UIView {

    struct Model {
        var durationText: String
        var pricePereWeekText: String
        var durationUnitText: String
        var discountText: String?
        
        init(durationText: String, pricePerWeekText: String, durationUnitText: String, discountText: String? = nil) {
            self.durationText = durationText
            self.discountText = discountText
            self.pricePereWeekText = pricePerWeekText
            self.durationUnitText = durationUnitText
        }
    }

    private let planDurationLabel = UILabel()
    private let durationUnitLabel = UILabel()
    private let pricePerWeekLabel = UILabel()
    private let stackView = UIStackView()
    private let discountView = UIView()
    private let discountLabel = UILabel()
    private let textStackView = UIStackView()
    
    var discountIsSet = false
    
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
        discountLabel.text = model.discountText
        
        discountView.backgroundColor = model.discountText == nil ? .clear : setDiscountViewVisible()
        
    }
    
    func setBackroundColorForStack(color: UIColor) {
        textStackView.backgroundColor = color
    }
    
    func setBackgroundColorForDiscount(color: UIColor) {
        discountView.backgroundColor = color
    }
    
    func getStackBackgroundColor() -> UIColor {
        guard let color = textStackView.backgroundColor else { return .init()}
        return color
    }
}

private extension PlanTopView {
    func setDiscountViewVisible() -> UIColor {
        discountIsSet = true
        return .gray
    }
    
    func setupView() {
        addSubview(stackView)
        layer.cornerRadius = 2
        
        setupStackView()
    }
    
    func setupStackView() {
        stackView.addArrangedSubview(discountView)
        stackView.addArrangedSubview(textStackView)
        
        stackView.axis = .vertical
        textStackView.backgroundColor = .gray
        textStackView.axis = .vertical
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        setupDiscountView()
        setupDiscountLabel()
    }
    
    func setupDiscountView() {
        discountView.snp.makeConstraints { make in
            make.height.equalTo(25)
        }
    }
    
    func setupDiscountLabel() {
        discountView.addSubview(discountLabel)
        
        discountLabel.font = UIFont(name: "BebasNeue", size: 16)
        discountLabel.textColor = .yellow
        discountLabel.textAlignment = .center
        
        discountLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    func setupPlanDurationLabel() {
        textStackView.addArrangedSubview(planDurationLabel)

        planDurationLabel.font = UIFont(name: "BebasNeue", size: 32)
        planDurationLabel.textColor = .white
        planDurationLabel.textAlignment = .center
    }

    func setupDurationUnitLabel() {
        textStackView.addArrangedSubview(durationUnitLabel)

        durationUnitLabel.font = UIFont(name: "BebasNeue", size: 28)
        durationUnitLabel.textColor = .white
        durationUnitLabel.textAlignment = .center
    }

    func setupPricePerWeekLabel() {
        textStackView.addArrangedSubview(pricePerWeekLabel)

        pricePerWeekLabel.font = UIFont(name: "BebasNeue", size: 18)
        pricePerWeekLabel.textColor = .white
        pricePerWeekLabel.textAlignment = .center
    }
}
