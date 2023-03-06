//
//  TaskCell.swift
//  To Do
//
//  Created by João Pedro on 26/02/23.
//

import UIKit

class TaskCell: UITableViewCell {
  var taskName = UILabel();
  var taskDescription = UILabel();
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier);
    addSubview(taskName);
    addSubview(taskDescription);
    
    configureTaskNameCell();
    configureTaskDescriptionCell();
  };
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  };
  
  func set(task: Task) {
    taskName.text = task.taskName;
    taskDescription.text = task.taskDescription;
  };
  
  func configureTaskNameCell() {
    taskName.translatesAutoresizingMaskIntoConstraints = false;
    taskName.font = .systemFont(ofSize: 20);
    taskName.textColor = .black;
    
    NSLayoutConstraint.activate([
      taskName.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      taskName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      taskName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
    ]);
  };
  
  func configureTaskDescriptionCell() {
    taskDescription.translatesAutoresizingMaskIntoConstraints = false;
    taskDescription.font = .systemFont(ofSize: 16);
    taskDescription.textColor = .black;
    taskDescription.lineBreakMode = .byWordWrapping;
    taskDescription.numberOfLines = 2;
    
    
    
    NSLayoutConstraint.activate([
      taskDescription.topAnchor.constraint(equalTo: taskName.bottomAnchor, constant: 5),
      taskDescription.leadingAnchor.constraint(equalTo: taskName.leadingAnchor),
      taskDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      taskDescription.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
    ]);
  };
};
