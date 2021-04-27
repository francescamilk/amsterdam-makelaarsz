class AdminController < ApplicationController
  before_action :can_access?

  def accounts
    @accounts = Account.where(admin: false)
  end

  def posts_index
    @posts = Post.all
  end
end