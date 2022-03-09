//
// Created by pavels.garklavs on 07/03/2022.
//

import UIKit

class PlanView: UIView {

    private let topView = PlanTopView()
    private let bottomView = PlanBottomView()
    private let stackView = UIStackView()

    let viewModel = PlanViewModel()

    func configure() {
        setupStack()
        setupTopView()
        setupBottomView()

        viewModel.onPlanClicked = { [weak self] in
            guard let self = self else { return }
            self.setupAfterClicked()
        }

        viewModel.onPlanClickedUncheckPrevious = { [weak self] in
            guard let self = self else { return }
            self.setupOtherPlansAfterClickedNewPlan()
        }
    }

    func setPlansInfo(topModel: PlanTopView.Model, bottomModel: PlanBottomView.Model) {
        topView.setTopPlanInfo(model: topModel)
        bottomView.setBottomPlanInfo(model: bottomModel)
    }
}

private extension PlanView {
    func setupAfterClicked() {
        if topView.discountIsSet == false {
            if topView.getStackBackgroundColor() == .blue {
                UIView.animate(withDuration: 0.5, delay: 0, options: .beginFromCurrentState, animations: {
                    self.transform = .init(scaleX: 1, y: 1)
                    self.topView.setBackroundColorForStack(color: .gray)
                    self.bottomView.backgroundColor = .gray
                })
            } else {
                UIView.animate(withDuration: 0.5, delay: 0, options: .beginFromCurrentState, animations: {
                    self.transform = .init(scaleX: 1, y: 1.1)
                    self.topView.setBackroundColorForStack(color: .blue)
                    self.bottomView.backgroundColor = .blue
                })}
        } else {
            if topView.getStackBackgroundColor() == .blue {
                UIView.animate(withDuration: 0.5, delay: 0, options: .beginFromCurrentState, animations: {
                    self.transform = .init(scaleX: 1, y: 1)
                    self.topView.setBackroundColorForStack(color: .gray)
                    self.topView.setBackgroundColorForDiscount(color: .gray)
                    self.bottomView.backgroundColor = .gray
                })
            } else {
                UIView.animate(withDuration: 0.5, delay: 0, options: .beginFromCurrentState, animations: {
                    self.transform = .init(scaleX: 1, y: 1.1)
                    self.topView.setBackroundColorForStack(color: .blue)
                    self.topView.setBackgroundColorForDiscount(color: .blue)
                    self.bottomView.backgroundColor = .blue
                })}
        }
    }
    
    func setupOtherPlansAfterClickedNewPlan() {
        if topView.discountIsSet == false {
            UIView.animate(withDuration: 0.5, delay: 0, options: .beginFromCurrentState, animations: {
                self.transform = .init(scaleX: 1, y: 1)
                self.topView.setBackroundColorForStack(color: .gray)
                self.bottomView.backgroundColor = .gray
            })
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, options: .beginFromCurrentState, animations: {
                self.transform = .init(scaleX: 1, y: 1)
                self.topView.setBackroundColorForStack(color: .gray)
                self.topView.setBackgroundColorForDiscount(color: .gray)
                self.bottomView.backgroundColor = .gray
            })
        }
    }
    
    func setupStack() {
        addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 5

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func setupTopView() {
        stackView.addArrangedSubview(topView)
        topView.configure()

        topView.snp.makeConstraints { make in
            make.height.equalTo(Constants.topPlanHeight)
        }
    }

    func setupBottomView() {
        stackView.addArrangedSubview(bottomView)
        bottomView.configure()

        bottomView.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
}
