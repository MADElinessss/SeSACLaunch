//
//  ViewController.swift
//  SeSACLaunch
//
//  Created by Madeline on 2/29/24.
//

import UIKit

// MARK: 프로토콜로 값 전달
// Any: 어떤거든 다 들어가
// AnyObject: 참조타입(클래스)만 들어가
protocol PassDataProtocol: AnyObject {
    // 프로토콜의 목적: 채택받는 애가 얘를 사용해야됨
    // 어떤 기능이 들어갈지는 모르겠는데 받는애가 해야됨
    func didSelectRowAT(indexPath: IndexPath)
}

protocol SeSAC {
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        class Pet: SeSAC {
            let name = "강아지"
        }
        
        class Dog: Pet {
            
        }
        
        struct user: SeSAC {
            let name = "Maddy"
        }
        
        class Fruit: SeSAC {
        }
        
        var cat: SeSAC = Pet() // 인스턴스 만들어서 담음
        
        cat = Pet()
        
        cat = Dog()
        
        cat = user()
        
        cat = Fruit()
        
        print(cat)
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        // 검색화면으로 전환
        let vc = SearchViewController()
        present(vc, animated: true)
    }
}
