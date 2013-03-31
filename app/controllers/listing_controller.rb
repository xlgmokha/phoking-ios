class ListingController < UIViewController

  def viewDidLoad
    super
    self.view.backgroundColor = UIColor.whiteColor
    self.title = "Latest Reviews"

    rightButton = UIBarButtonItem.alloc.initWithTitle("Share", style: UIBarButtonItemStyleBordered, target: self, action: 'push')
    self.navigationItem.rightBarButtonItem = rightButton
  end

  def push
    new_controller = RestaurantController.alloc.initWithNibName(nil, bundle: nil)
    self.navigationController.pushViewController(new_controller, animated: true)
  end
end
