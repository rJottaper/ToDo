//
//  AboutTask.swift
//  To Do
//
//  Created by João Pedro on 01/03/23.
//

import UIKit

class AboutTask: UIViewController {
  let IconTaskName = UIImageView();
  var TaskName = UILabel();
  let Underline = UIView();
  var TaskDescription = UILabel();
  
  override func viewDidLoad() {
    super.viewDidLoad();
    view.backgroundColor = .systemBackground
    
    configureIconTaskName();
    configureTaskName();
    configureUnderline();
    configureTaskDescription();
  };
  
  func configureIconTaskName() {
    view.addSubview(IconTaskName);
    
    IconTaskName.translatesAutoresizingMaskIntoConstraints = false;
    IconTaskName.tintColor = .black;
    IconTaskName.image = UIImage(systemName: "note");
    
    NSLayoutConstraint.activate([
      IconTaskName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      IconTaskName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
      IconTaskName.widthAnchor.constraint(equalToConstant: 50),
      IconTaskName.heightAnchor.constraint(equalToConstant: 50)
    ]);
  };
  
  func configureTaskName() {
    view.addSubview(TaskName);
    
    TaskName.translatesAutoresizingMaskIntoConstraints = false;
    TaskName.font = .systemFont(ofSize: 26);
    TaskName.textColor = .lightGray;
    TaskName.textAlignment = .center;
    TaskName.lineBreakMode = .byWordWrapping;
    TaskName.numberOfLines = 0;

    NSLayoutConstraint.activate([
      TaskName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      TaskName.topAnchor.constraint(equalTo: IconTaskName.bottomAnchor, constant: 10),
      TaskName.widthAnchor.constraint(equalToConstant: 300)
    ]);
  };
  
  func configureUnderline() {
    view.addSubview(Underline);
    
    Underline.translatesAutoresizingMaskIntoConstraints = false;
    Underline.backgroundColor = .lightGray;
    Underline.layer.opacity = 0.6;
    
    NSLayoutConstraint.activate([
      Underline.topAnchor.constraint(equalTo: TaskName.bottomAnchor, constant: 20),
      Underline.heightAnchor.constraint(equalToConstant: 5),
      Underline.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      Underline.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
    ]);
  };
  
  func configureTaskDescription() {
    view.addSubview(TaskDescription);
    
    TaskDescription.translatesAutoresizingMaskIntoConstraints = false;
    TaskDescription.font = .systemFont(ofSize: 18);
    TaskDescription.textColor = .lightGray;
    TaskDescription.lineBreakMode = .byWordWrapping;
    TaskDescription.numberOfLines = 0;
    
    NSLayoutConstraint.activate([
      TaskDescription.topAnchor.constraint(equalTo: Underline.bottomAnchor, constant: 20),
      TaskDescription.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      TaskDescription.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
    ]);
  };
};
