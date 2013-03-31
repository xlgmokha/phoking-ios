class SearchController < UIViewController
  def viewDidLoad
    super
    self.view.backgroundColor = UIColor.whiteColor
    self.title = "Latest Reviews"
    self.navigationItem.rightBarButtonItem = UIBarButtonItem.alloc.initWithTitle("Share", style: UIBarButtonItemStyleBordered, target: self, action: 'push')
  end

  def push
    self.navigationController.pushViewController(RestaurantController.alloc.initWithNibName(nil, bundle: nil), animated: true)
  end
end
