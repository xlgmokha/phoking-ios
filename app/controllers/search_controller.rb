class SearchController < UIViewController
  def viewDidLoad
    super
    self.view.backgroundColor = UIColor.whiteColor
    self.title = "Latest Reviews"
    self.navigationItem.rightBarButtonItem = UIBarButtonItem.alloc.initWithTitle("Share", style: UIBarButtonItemStyleBordered, target: self, action: 'push')
  end

  def push
    controller = @controller_factory.create(RestaurantController)
    self.navigationController.pushViewController(controller, animated: true)
  end

  def bind_to(controller_factory)
    @controller_factory = controller_factory
  end
end

class ControllerFactory
  def create(controller)
    instance = controller.alloc
    instance.bind_to(self)
    instance.initWithNibName(nil, bundle: nil)
  end
end
