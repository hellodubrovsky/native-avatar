import UIKit

final class ViewController: UIViewController {
    
    private lazy var avatar: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemGray
        imageView.image = .init(systemName: "person.crop.circle.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var scroll: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 800)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation bar
        self.title = "Avatar"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barTintColor = .systemGray5
        
        // View
        self.view.backgroundColor = .white
        self.view.addSubview(scroll)
        
        // Constraints
        self.scroll.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setAvatar()
    }
    
    private func setAvatar() {
        guard let titleView = navigationController?.navigationBar.subviews.first(where: { $0.description.contains("UINavigationBarLargeTitleView") }) else { return }
        
        titleView.addSubview(self.avatar)
        self.avatar.widthAnchor.constraint(equalToConstant: 36).isActive = true
        self.avatar.heightAnchor.constraint(equalToConstant: 36).isActive = true
        self.avatar.trailingAnchor.constraint(equalTo: titleView.trailingAnchor, constant: -10).isActive = true
        self.avatar.bottomAnchor.constraint(equalTo: titleView.bottomAnchor, constant: -10).isActive = true
    }
}
