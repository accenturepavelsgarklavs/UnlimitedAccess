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
    private let scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupFooterStack()
        setupScrollView()
        setupTitleLabel()
        setupTitleDescriptionLabel()
        setupPlanStack()
        setupOneYearView()
        setupThreeMonthView()
        setupOneMonthView()
        setupContinueButton()
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
        scrollView.addSubview(continueButton)
        continueButton.configure(offset: 10, fillColor: .blue)

        continueButton.setTitle("Continue", for: .normal)
        continueButton.titleLabel?.font = UIFont(name: "BebasNeue", size: 32)

        continueButton.setTitleColor(.gray, for: .highlighted)

        continueButton.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.top.equalTo(planStack.snp.bottom).offset(35)
            make.bottom.equalTo(scrollView.snp.bottom)
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
        scrollView.addSubview(planStack)
        
        planStack.axis = .horizontal
        planStack.distribution = .fillEqually
        planStack.spacing = 5

        planStack.snp.makeConstraints { make in
            make.top.equalTo(titleDescriptionLabel.snp.bottom).offset(15)
            make.width.equalTo(scrollView.snp.width)
        }
    }

    func setupOneMonthView() {
        planStack.addArrangedSubview(oneMonthView)
        oneMonthView.configure()

        let oneMonthTopPlanInfo = PlanTopView.Model(durationText: "1", pricePerWeekText: "15$ / week", durationUnitText: "Month")
        let oneMonthBottomPlanInfo = PlanBottomView.Model(priceLabelText: "15$", unitLabelText: "Month")

        oneMonthView.setPlansInfo(topModel: oneMonthTopPlanInfo, bottomModel: oneMonthBottomPlanInfo)

        let gesture = UITapGestureRecognizer(target: self, action: #selector(oneMonthViewClickAction))
        oneMonthView.addGestureRecognizer(gesture)
    }

    func setupOneYearView() {
        planStack.addArrangedSubview(oneYearView)
        oneYearView.configure()

        let oneYearTopPlanInfo = PlanTopView.Model(durationText: "1", pricePerWeekText: "35$ / week", durationUnitText: "Year", discountText: "Save 50%")
        let oneYearBottomPlanInfo = PlanBottomView.Model(priceLabelText: "45$", unitLabelText: "Year")

        oneYearView.setPlansInfo(topModel: oneYearTopPlanInfo, bottomModel: oneYearBottomPlanInfo)

        let gesture = UITapGestureRecognizer(target: self, action: #selector(oneYearViewClickAction))
        oneYearView.addGestureRecognizer(gesture)
    }

    func setupThreeMonthView() {
        planStack.addArrangedSubview(threeMonthView)
        threeMonthView.configure()

        let threeMonthTopPlanInfo = PlanTopView.Model(durationText: "3", pricePerWeekText: "20$ / week", durationUnitText: "Months")
        let threeMonthBottomPlanInfo = PlanBottomView.Model(priceLabelText: "35$", unitLabelText: "3 Months")

        threeMonthView.setPlansInfo(topModel: threeMonthTopPlanInfo, bottomModel: threeMonthBottomPlanInfo)

        let gesture = UITapGestureRecognizer(target: self, action: #selector(threeMonthViewClickAction))
        threeMonthView.addGestureRecognizer(gesture)
    }

    func setupTitleDescriptionLabel() {
        scrollView.addSubview(titleDescriptionLabel)

        titleDescriptionLabel.text = "Your new guide on the way to healthy living"
        titleDescriptionLabel.numberOfLines = 0
        titleDescriptionLabel.textAlignment = .center
        titleDescriptionLabel.textColor = .white
        titleDescriptionLabel.font = UIFont(name: "Roboto", size: 18)

        titleDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(5)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(60)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(60)
        }
    }

    func setupTitleLabel() {
        scrollView.addSubview(titleLabel)

        titleLabel.text = "Unlimited access"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "BebasNeue", size: 48)

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top).offset(15)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }

    func setupScrollView() {
        view.addSubview(scrollView)
        
        scrollView.showsVerticalScrollIndicator = false

        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.centerY).offset(-70)
            make.bottom.equalTo(footerStack.snp.top).offset(-10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
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
