//
//  SwitchButton.swift
//  todoStar
//
//  Created by 김혜림 on 9/12/24.
//

import UIKit

protocol CustomSwitchButtonProtocol {
    var isOn: Bool { get set }
}

class CustomSwitchButton<ViewModel: CustomSwitchButtonProtocol>: UIControl {
    // MARK: - Property
    var viewModel: ViewModel {
        didSet {
            updateSwitchStatus()
        }
    }

    var barView = UIView()
    var selectView = UIView()
    var textView = UIStackView()

    init(viewModel: ViewModel) {
        self.viewModel = viewModel

        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup View
    func setupView() {
        barView.backgroundColor = .red

        addSubview(barView)

        barView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            barView.topAnchor.constraint(equalTo: self.topAnchor),
            barView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            barView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            barView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }

    func updateSwitchStatus() {

    }
}
