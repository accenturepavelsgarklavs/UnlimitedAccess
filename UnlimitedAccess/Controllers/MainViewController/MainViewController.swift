//
//  MainViewController.swift
//  UnlimitedAccess
//
//  Created by pavels.garklavs on 03/03/2022.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {

    private var mainViewModel: MainViewModel?

    private let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    private let continueButton = ParallelogramButton()
    private let footerStack = UIStackView()
    private let planStack = UIStackView()
    private let oneMonthView = PlanView()
    private let oneYearView = PlanView()
    private let threeMonthView = PlanView()
    private let titleDescriptionLabel = UILabel()
    private let titleLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupFooterStack()
        setupContinueButton()
        setupPlanStack()
        setupOneMonthView()
        setupOneYearView()
        setupThreeMonthView()
        setupTitleDescriptionLabel()
        setupTitleLabel()
    }

    func configure(mainViewModel: MainViewModel) {
        self.mainViewModel = mainViewModel
    }
}

private extension MainViewController {
    func setupBackground() {
        backgroundImage.image = UIImage(named: "bgImage")
        backgroundImage.contentMode = .scaleAspectFill
        view.addSubview(backgroundImage)
    }

    func setupContinueButton() {
        view.addSubview(continueButton)
        continueButton.configure(offset: 10, fillColor: .blue)

        continueButton.setTitle("Continue", for: .normal)
        continueButton.titleLabel?.font = UIFont(name: "BebasNeue", size: 32)

        continueButton.setTitleColor(.gray, for: .highlighted)

        continueButton.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.bottom.equalTo(footerStack.snp.top).offset(-25)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
    }

    func setupFooterStack() {
        view.addSubview(footerStack)

        // Usage only to fill in stack view and not writing three separate labels.
        for data in DummyData.shared.footerData {
            let dataLabel = UILabel()
            dataLabel.text = data
            dataLabel.font = .systemFont(ofSize: 12)
            dataLabel.textColor = .lightGray
            footerStack.addArrangedSubview(dataLabel)
        }

        footerStack.distribution = .equalSpacing
        footerStack.axis = .horizontal

        footerStack.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }

    func setupPlanStack() {
        view.addSubview(planStack)

        planStack.axis = .horizontal
        planStack.distribution = .fillEqually
        planStack.spacing = 5

        planStack.snp.makeConstraints { make in
            make.bottom.equalTo(continueButton.snp.top).inset(-40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
    }

    func setupOneMonthView() {
        planStack.addArrangedSubview(oneMonthView)
        oneMonthView.configure()

        var oneMonthTopPlanInfo = PlanTopView.Model()
        oneMonthTopPlanInfo.durationUnitText = "Month"
        oneMonthTopPlanInfo.durationText = "1"
        oneMonthTopPlanInfo.pricePereWeekText = "15$ / week"

        var oneMonthBottomPlanInfo = PlanBottomView.Model()
        oneMonthBottomPlanInfo.priceLabelText = "15$"
        oneMonthBottomPlanInfo.unitLabelText = "Month"

        oneMonthView.setPlansInfo(topModel: oneMonthTopPlanInfo, bottomModel: oneMonthBottomPlanInfo)

        let gesture = UITapGestureRecognizer(target: self, action: #selector(oneMonthViewClickAction))
        oneMonthView.addGestureRecognizer(gesture)
    }

    func setupOneYearView() {
        planStack.addArrangedSubview(oneYearView)
        oneYearView.configure()

        var oneYearTopPlanInfo = PlanTopView.Model()
        oneYearTopPlanInfo.durationUnitText = "Year"
        oneYearTopPlanInfo.durationText = "1"
        oneYearTopPlanInfo.pricePereWeekText = "25$ / week"

        var oneYearBottomPlanInfo = PlanBottomView.Model()
        oneYearBottomPlanInfo.priceLabelText = "45$"
        oneYearBottomPlanInfo.unitLabelText = "Year"

        oneYearView.setPlansInfo(topModel: oneYearTopPlanInfo, bottomModel: oneYearBottomPlanInfo)

        let gesture = UITapGestureRecognizer(target: self, action: #selector(oneYearViewClickAction))
        oneYearView.addGestureRecognizer(gesture)
    }

    func setupThreeMonthView() {
        planStack.addArrangedSubview(threeMonthView)
        threeMonthView.configure()

        var threeMonthTopPlanInfo = PlanTopView.Model()
        threeMonthTopPlanInfo.durationUnitText = "Months"
        threeMonthTopPlanInfo.durationText = "3"
        threeMonthTopPlanInfo.pricePereWeekText = "20$ / week"

        var threeMonthBottomPlanInfo = PlanBottomView.Model()
        threeMonthBottomPlanInfo.priceLabelText = "35$"
        threeMonthBottomPlanInfo.unitLabelText = "3 Months"

        threeMonthView.setPlansInfo(topModel: threeMonthTopPlanInfo, bottomModel: threeMonthBottomPlanInfo)

        let gesture = UITapGestureRecognizer(target: self, action: #selector(threeMonthViewClickAction))
        threeMonthView.addGestureRecognizer(gesture)
    }

    func setupTitleDescriptionLabel() {
        view.addSubview(titleDescriptionLabel)

        titleDescriptionLabel.text = "Your new guide on the way to healthy living"
        titleDescriptionLabel.numberOfLines = 0
        titleDescriptionLabel.textAlignment = .center
        titleDescriptionLabel.textColor = .white
        titleDescriptionLabel.font = UIFont(name: "Roboto", size: 18)

        titleDescriptionLabel.snp.makeConstraints { make in
            make.bottom.equalTo(planStack.snp.top).offset(-25)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(60)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(60)
        }
    }

    func setupTitleLabel() {
        view.addSubview(titleLabel)

        titleLabel.text = "Unlimited access"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "BebasNeue", size: 48)

        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(titleDescriptionLabel.snp.top)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }

    @objc func oneMonthViewClickAction() {
        oneMonthView.viewModel.onPlanClicked?()
        oneYearView.viewModel.onPlanClickedUncheckPrevious?()
        threeMonthView.viewModel.onPlanClickedUncheckPrevious?()
    }

    @objc func oneYearViewClickAction() {
        oneYearView.viewModel.onPlanClicked?()
        oneMonthView.viewModel.onPlanClickedUncheckPrevious?()
        threeMonthView.viewModel.onPlanClickedUncheckPrevious?()
    }

    @objc func threeMonthViewClickAction() {
        threeMonthView.viewModel.onPlanClicked?()
        oneMonthView.viewModel.onPlanClickedUncheckPrevious?()
        oneYearView.viewModel.onPlanClickedUncheckPrevious?()
    }
}
