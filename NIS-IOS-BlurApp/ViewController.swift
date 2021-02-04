//
//  ViewController.swift
//  NIS-IOS-BlurApp
//
//  Created by Ярослав Карпунькин on 04.02.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    //MARK: - Variables
    private let imageSet: [UIImage] = [#imageLiteral(resourceName: "WBC_7095"), #imageLiteral(resourceName: "pexels-photo-2114014"), #imageLiteral(resourceName: "190612_banan1"), #imageLiteral(resourceName: "171026-better-coffee-boost-se-329p_67dfb6820f7d3898b5486975903c2e51.fit-760w"), #imageLiteral(resourceName: "italy")]
    //MARK: - Controls
    private lazy var backgroundImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var blurEffectView: UIVisualEffectView = {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var squareView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var label: UILabel = {
       let label = UILabel()
        label.text = "Вьюху авторизации нам не дали:("
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .red
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var gg: UIImageView = {
       let imageView = UIImageView(image: #imageLiteral(resourceName: "image0"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        let selectedImageIndex = Int(arc4random_uniform(5))
        backgroundImageView.image = imageSet[selectedImageIndex]
        setupConstraints()
        
    }
}

//MARK: - Constraints
extension ViewController {
    private func setupConstraints() {
        view.addSubview(backgroundImageView)
        backgroundImageView.addSubview(blurEffectView)
        
        backgroundImageView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
        
        blurEffectView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
        
        blurEffectView.contentView.addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(blurEffectView.contentView.safeAreaLayoutGuide.snp.top)
        }
        
        blurEffectView.contentView.addSubview(gg)

        gg.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
        }
        gg.topAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
    }
}

