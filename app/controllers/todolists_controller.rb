class TodolistsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @list = List.new
  end

  def create
    # １. データを新規登録するためのインスタンス作成
    @list = List.new(list_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    if @list.save
    # ３. トップ画面へリダイレクト
    # redirect_to '/top'
    # 3.詳細画面へリダイレクト
      redirect_to todolist_path(@list.id)
    else
      render :new
      # redirect_to todolists_new_path
    end
  end
  

  def index
    @lists = List.all
    # 全てのデータを取り出すので＠lists（複数系）
  end

  def show
    @list =List.find(params[:id])
    # 1件のデータを取り出すので＠list（単数系）
  end

  def edit
    @list =List.find(params[:id])
  end

  def update
    # 1.編集対象のデータを取得
    list = List.find(params[:id])
    # ２. データをアップデート
    list.update(list_params)
    # 3.詳細画面へリダイレクト
    redirect_to todolist_path(list.id)
  end
  
  def destroy
    list=List.find(params[:id]) # データ（レコード）を1件取得
    list.destroy # データ（レコード）を削除
    redirect_to todolists_path # 投稿一覧画面へリダイレクト
  end

  private
  # ストロングパラメータ 「ここから下はcontrollerの中でしか呼び出せません」という意味
  def list_params
    params.require(:list).permit(:title,:body,:image)
  end
  
end