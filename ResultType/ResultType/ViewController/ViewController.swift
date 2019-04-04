//
//  ViewController.swift
//  ResultType
//
//  Created by Pratik Bhaliya on 4/4/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var courseTableView: UITableView!
    var courses:[Courses] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCourses()
    }
    
    fileprivate func fetchCourses() {
        Network.sharedInstance.fetchCourseJSON { (res) in
            switch res {
            case .success(let courses):
                courses.forEach({ (course) in
                    self.courses.append(course)
                })
                DispatchQueue.main.async {
                    self.courseTableView.reloadData()
                }
            case .failure(let err):
                print("Failed to fetch course:",err)
                
            }
        }
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CourseTableViewCell
        
       Network.sharedInstance.fetchCourseImage(courses[indexPath.row].imageUrl) { (image) in
            switch image {
            case .success(let image):
                DispatchQueue.main.async {
                    cell.courseImage.image = image
                }
            case .failure(let err):
                print("Failed to fetch course:",err)
            }
        }
        
        cell.courseName.text = courses[indexPath.row].name
        cell.numberOfLesson.text = "\(courses[indexPath.row].number_of_lessons)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
