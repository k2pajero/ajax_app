class PostsController < ApplicationController
  def index  # indexアクションを定義した
    @posts = Post.all.order(id: "DESC")
    #全てのレコードを取得して＠postsに代入
    # @post = Post.find(1)
    #1番目のレコードを＠postに代入
    #"これはコントローラーで定義したインスタンス変数を確認するための文字列です"

  end

  def create
    # 既読や未読の情報を追加したため「メモ作成時に未読の情報を保存するようにした
    post = Post.create(content: params[:content],checked: false)
    # redirect_to action: :index Ajaxを実現するため「レスポンスをJSONに変更した
    render json:{ post: post }
  end

  def checked

    post = Post.find(params[:id])
    if post.checked then
      post.update(checked: false)
    else
      post.update(checked: true)
    end

    item = Post.find(params[:id])
    render json: { post: item }
  end
end
