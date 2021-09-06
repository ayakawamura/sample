Rails.application.routes.draw do
  get 'todolists/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "top" => "homes#top"
  # 新規投稿
  post "todolists"=>"todolists#create"  
  get "todolists"=>"todolists#index"
  # .../todolists/1 や .../todolists/3 に該当する
  get "todolists/:id" => "todolists#show",as:"todolist"
  get "todolists/:id/edit"=>"todolists#edit",as:"edit_todolist"
  # 投稿内容の更新
  patch "todolists/:id" =>"todolists#update",as:"update_todolist"
  # 投稿内容の削除
  delete "todolists/:id" =>"todolists#destroy",as:"destroy_todolist"

end
