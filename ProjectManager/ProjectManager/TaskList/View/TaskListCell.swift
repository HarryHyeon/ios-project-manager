//
//  TaskListCell.swift
//  ProjectManager
//
//  Created by Harry, KokkiLE on 2023/05/17.
//

import UIKit

class TaskListCell: UICollectionViewCell {    
    private let titleLabel = {
        let label = UILabel()
        
        label.font = .preferredFont(forTextStyle: .title2)
        label.numberOfLines = 1
        
        return label
    }()
    
    private let bodyLabel = {
        let label = UILabel()
        
        label.font = .preferredFont(forTextStyle: .caption1)
        label.numberOfLines = 3
        
        return label
    }()
    
    private let deadlineLabel = {
        let label = UILabel()
        
        label.font = .preferredFont(forTextStyle: .body)
        
        return label
    }()
    
    private let stackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setupConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(bodyLabel)
        stackView.addArrangedSubview(deadlineLabel)
        contentView.addSubview(stackView)
    }
    
    private func setupConstraints() {
        let safe = contentView.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safe.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: safe.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: safe.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: safe.bottomAnchor)
        ])
    }
    
    func configure(_ task: Task) {
        titleLabel.text = task.title
        bodyLabel.text = task.body
        deadlineLabel.text = DateFormatter().string(from: task.deadline)        
    }
}
