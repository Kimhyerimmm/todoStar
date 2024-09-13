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

    var onText: String
    var offText: String

    init(viewModel: ViewModel, onText: String, offText: String) {
        self.viewModel = viewModel
        self.onText = onText
        self.offText = offText

        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup View
    func setupView() {
        barView.backgroundColor = .natural80
        barView.layer.cornerRadius = 30

        selectView.backgroundColor = .primary100
        selectView.layer.cornerRadius = 30

        textViewSetup()

        addSubview(barView)
        addSubview(selectView)
        addSubview(textView)

        barView.translatesAutoresizingMaskIntoConstraints = false
        selectView.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false

        // 오토레이아웃(barView)
        NSLayoutConstraint.activate([
            barView.topAnchor.constraint(equalTo: self.topAnchor),
            barView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            barView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            barView.heightAnchor.constraint(equalToConstant: 60)
        ])

        // 오토레이아웃(selectView)
        NSLayoutConstraint.activate([
            selectView.topAnchor.constraint(equalTo: self.topAnchor),
            selectView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            selectView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            selectView.widthAnchor.constraint(equalTo: barView.widthAnchor, multiplier: 0.5),
            selectView.heightAnchor.constraint(equalToConstant: 60)
        ])

        // 오토레이아웃(textView)
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: self.topAnchor),
            textView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }

    func updateSwitchStatus() {

    }

    private func textViewSetup() {
        let onLabel = UILabel()
        onLabel.text = onText
        onLabel.textAlignment = .center
        onLabel.translatesAutoresizingMaskIntoConstraints = false
        if viewModel.isOn {
            onLabel.font = .boldSystemFont(ofSize: 16)
            onLabel.textColor = .white
        } else {
            onLabel.font = .systemFont(ofSize: 16)
            onLabel.textColor = .gray
        }

        let offLabel = UILabel()
        offLabel.text = offText
        offLabel.textAlignment = .center
        offLabel.translatesAutoresizingMaskIntoConstraints = false
        if viewModel.isOn {
            offLabel.font = .systemFont(ofSize: 16)
            offLabel.textColor = .gray
        } else {
            offLabel.font = .boldSystemFont(ofSize: 16)
            offLabel.textColor = .white
        }

        textView.addArrangedSubview(onLabel)
        textView.addArrangedSubview(offLabel)

        textView.axis = .horizontal
        textView.distribution = .fillEqually
    }
}
