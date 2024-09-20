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

class CustomSwitchButton<ViewModel: CustomSwitchButtonProtocol>: UIView {
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
    var onLabel: UILabel
    var offLabel: UILabel

    var parentView: UIView


    init(viewModel: ViewModel, onText: String, offText: String, parentView: UIView) {
        self.viewModel = viewModel
        self.onText = onText
        self.offText = offText
        self.onLabel = UILabel()
        self.offLabel = UILabel()
        self.parentView = parentView

        super.init(frame: .zero)
        setupView()
        setupGesture()
        updateSwitchStatus()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup View
    func setupView() {
        isUserInteractionEnabled = true

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

    private func textViewSetup() {
        onLabel.text = onText
        onLabel.textAlignment = .center

        offLabel.text = offText
        offLabel.textAlignment = .center

        onLabel.translatesAutoresizingMaskIntoConstraints = false
        offLabel.translatesAutoresizingMaskIntoConstraints = false

        textView.addArrangedSubview(onLabel)
        textView.addArrangedSubview(offLabel)

        textView.axis = .horizontal
        textView.distribution = .fillEqually
    }

    private func updateSwitchStatus() {
        if viewModel.isOn {
            // textView Change
            onLabel.font = .boldSystemFont(ofSize: 16)
            onLabel.textColor = .white

            offLabel.font = .systemFont(ofSize: 16)
            offLabel.textColor = .gray

            // selectView
            selectView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                selectView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
            ])
        } else {
            // textView Change
            onLabel.font = .systemFont(ofSize: 16)
            onLabel.textColor = .gray

            offLabel.font = .boldSystemFont(ofSize: 16)
            offLabel.textColor = .white

            // selectView
            selectView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                selectView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
        }
    }

    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleSwitch))
        parentView.addGestureRecognizer(tapGesture)
        print("Gesture Recognizer Set Up")
    }

    @objc private func toggleSwitch() {
        viewModel.isOn.toggle()
        updateSwitchStatus()
        print("Tap Recognized")
    }
}
