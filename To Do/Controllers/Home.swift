//
//  ViewController.swift
//  To Do
//
//  Created by João Pedro on 19/02/23.
//

import UIKit

class Home: UIViewController {
  let TaskName = UITextField();
  let TaskDescription = UITextView();
  let ButtonAddTask = UIButton();
  let TableView = UITableView();
  
  var Tasks = [Task]();
  
  override func viewDidLoad() {
    super.viewDidLoad();
    view.backgroundColor = .systemBackground;
    configureTaskNameInput();
    configureTaskDescriptionInput();
    configureButtonAddTask();
    configureTableView();
    
    TaskName.delegate = self;
    TaskDescription.delegate = self;
    TableView.delegate = self;
    TableView.dataSource = self;
  };
  
  func configureTaskNameInput() {
    view.addSubview(TaskName);
    
    TaskName.translatesAutoresizingMaskIntoConstraints = false;
    TaskName.keyboardType = .default;
    TaskName.placeholder = "Task Name";
    TaskName.font = .systemFont(ofSize: 18);
    TaskName.layer.borderWidth = 1;
    TaskName.layer.cornerRadius = 10;
    TaskName.layer.borderColor = UIColor.black.cgColor;
    
    let leftImage = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 30));
    leftImage.tintColor = .black;
    leftImage.image = UIImage(systemName: "note");

    let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50));
    leftView.addSubview(leftImage);
    
    TaskName.leftViewMode = .always;
    TaskName.leftView = leftView
    
    NSLayoutConstraint.activate([
      TaskName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      TaskName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
      TaskName.heightAnchor.constraint(equalToConstant: 50),
      TaskName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      TaskName.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
    ]);
  };
  
  func configureTaskDescriptionInput() {
    view.addSubview(TaskDescription);
    
    TaskDescription.translatesAutoresizingMaskIntoConstraints = false;
    TaskDescription.font = .systemFont(ofSize: 16);
    TaskDescription.layer.borderWidth = 1;
    TaskDescription.layer.cornerRadius = 10;
    TaskDescription.layer.borderColor = UIColor.black.cgColor;
    TaskDescription.textColor = .lightGray;
    TaskDescription.text = "Describe Your Task";
    
    NSLayoutConstraint.activate([
      TaskDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      TaskDescription.centerYAnchor.constraint(equalTo: TaskName.bottomAnchor, constant: 60),
      TaskDescription.heightAnchor.constraint(equalToConstant: 100),
      TaskDescription.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      TaskDescription.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
    ]);
  };
  
  func configureButtonAddTask() {
    view.addSubview(ButtonAddTask);
    
    ButtonAddTask.translatesAutoresizingMaskIntoConstraints = false;
    ButtonAddTask.backgroundColor = .lightGray;
    ButtonAddTask.setTitle("Add New Task", for: .normal);
    ButtonAddTask.layer.cornerRadius = 10;
    
    NSLayoutConstraint.activate([
      ButtonAddTask.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      ButtonAddTask.centerYAnchor.constraint(equalTo: TaskDescription.bottomAnchor, constant: 40),
      ButtonAddTask.heightAnchor.constraint(equalToConstant: 50),
      ButtonAddTask.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      ButtonAddTask.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
    ]);
    
    ButtonAddTask.addTarget(self, action: #selector(addTask(sender:)), for: .touchUpInside);
  };
  
  @objc func addTask(sender: UIButton) {
    if TaskName.text == "" || TaskName.text == nil {
      print("TaskName must be a value");
    } else {
      if TaskDescription.text == "Describe Your Task" {
        Tasks.append(Task(taskName: TaskName.text!, taskDescription: ""));
      } else {
        Tasks.append(Task(taskName: TaskName.text!, taskDescription: TaskDescription.text));
      };
      TableView.reloadData();
    }
    animatedButton(sender);
  };
  
  func animatedButton(_ viewToAnimated: UIView) {
    UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {viewToAnimated.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)}) { (_) in
      UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn, animations: {viewToAnimated.transform = CGAffineTransform(scaleX: 1, y: 1)}, completion: nil);
    };
  };
  
  func configureTableView() {
    view.addSubview(TableView);
    
    TableView.translatesAutoresizingMaskIntoConstraints = false;
    TableView.rowHeight = UITableView.automaticDimension;
    TableView.estimatedRowHeight = UITableView.automaticDimension;
    TableView.register(TaskCell.self, forCellReuseIdentifier: "cellid");
    
    NSLayoutConstraint.activate([
      TableView.topAnchor.constraint(equalTo: ButtonAddTask.topAnchor, constant: 60),
      TableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      TableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      TableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ]);
  };
};

extension Home: UITextFieldDelegate, UITextViewDelegate, UITableViewDelegate, UITableViewDataSource {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if TaskName.text != "" {
      print(TaskName.text!);
    };
    return true;
  };
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let maxLength = 35;
    let currentString = (textField.text ?? "") as NSString
    let newString = currentString.replacingCharacters(in: range, with: string) as NSString
    
    return newString.length <= maxLength;
  };
  
  func textViewDidBeginEditing(_ textView: UITextView) {
    if TaskDescription.textColor == .lightGray {
      TaskDescription.text = nil;
      TaskDescription.textColor = .black;
    };
  };
  
  func textViewDidEndEditing(_ textView: UITextView) {
    if TaskDescription.text.isEmpty || TaskDescription.text == "" {
      TaskDescription.textColor = .lightGray;
      TaskDescription.text = "Describe Your Task";
    };
  };
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Tasks.count;
  };
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = TableView.dequeueReusableCell(withIdentifier: "cellid") as! TaskCell;
    let task = Tasks[indexPath.row];
    cell.set(task: task);
      
    return cell;
  };
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(Tasks[indexPath.row]);
    let aboutTask = AboutTask();
    aboutTask.TaskName.text = Tasks[indexPath.row].taskName;
    aboutTask.TaskDescription.text = Tasks[indexPath.row].taskDescription;
    self.present(aboutTask, animated: true);
  };
  
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  };

  func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    let deleteAction = UIContextualAction(style: .destructive, title: nil) { (_, _, completionHandler) in
      self.Tasks.remove(at: indexPath.row);
      self.TableView.deleteRows(at: [indexPath], with: .fade);
      self.TableView.reloadData();
    };
    deleteAction.image = UIImage(systemName: "trash");
    deleteAction.backgroundColor = .systemRed;
    
    return UISwipeActionsConfiguration(actions: [deleteAction]);
  };
};

