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
            guard let self = self else {
                return
            }

            if self.topView.backgroundColor == .gray && self.bottomView.backgroundColor == .gray {
                self.topView.backgroundColor = .blue
                self.bottomView.backgroundColor = .blue
            } else {
                self.topView.backgroundColor = .gray
                self.bottomView.backgroundColor = .gray
            }
        }

        viewModel.onPlanClickedUncheckPrevious = { [weak self] in
            guard let self = self else {
                return
            }

            if self.topView.backgroundColor == .blue && self.bottomView.backgroundColor == .blue {
                self.topView.backgroundColor = .gray
                self.bottomView.backgroundColor = .gray
            }
        }
    }

    func setPlansInfo(topModel: PlanTopView.Model, bottomModel: PlanBottomView.Model) {
        topView.setTopPlanInfo(model: topModel)
        bottomView.setBottomPlanInfo(model: bottomModel)
    }
}

private extension PlanView {

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
