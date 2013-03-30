BlogdiggityOrg::Application.routes.draw do
  resources :widgets
  
  Rails.application.routes.draw do
    mount Blogdiggity::Engine => "/blog", as: "blog"
  end

  root :to => "widgets#index"
end
