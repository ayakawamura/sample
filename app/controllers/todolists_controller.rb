class TodolistsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @list = List.new
  end
  
  def create
    # １. データを新規登録するためのインスタンス作成
    list = List.new(list_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    list.save
    # ３. トップ画面へリダイレクト
    redirect_to '/top'
  end


  private
  # ストロングパラメータ 「ここから下はcontrollerの中でしか呼び出せません」という意味
  def list_params
    params.require(:list).permit(:title, :body)
  end
  
end
