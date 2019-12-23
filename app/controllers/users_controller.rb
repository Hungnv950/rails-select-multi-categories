# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
    load_users_categories
  end

  def create
    @user = User.new user_params

    if @user.save
      redirect_to edit_user_path(@user)
    else
      load_users_categories
      render :new
    end
  end

  def show
    @user = User.find params[:id]
    @categories = @user.users_categories.map{|c| c.category_name}.join(", ")
  end

  def edit
    @user = User.find params[:id]
    load_users_categories
    render :edit
  end

  def update
    @user = User.find params[:id]

    if @user.update user_params
      redirect_to user_path @user
    else
      load_selected_ids
      load_users_categories
      render :edit
    end
  end

  private
  def load_users_categories
    @category_options =
      Category.all.map do |category|
        UsersCategory.new(category: category, user: @user)
      end
  end

  def user_params
    params.require(:user).permit(
      :id,
      :name,
      users_categories_attributes: [:id, :category_id, :other_content, :_destroy]
    )
  end

  def users_categories_attributes
    user_params[:users_categories_attributes]
  end

  def load_selected_ids
    # Lấy ra tất cả các categories đã được select
    # Bởi vì params có `_destroy = 0` là những categories đã được chọn nên sẽ dùng select
    # để lấy những params này
    @selected_ids = users_categories_attributes.values.map {|c| c[:category_id] if c[:_destroy] == "0"}.compact
  end
end
