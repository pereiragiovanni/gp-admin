class UsersController < ApplicationController
  PER_PAGE = 10

  before_action :require_admin!

  def index
    @breadcrumb = :users
    @page = [ params[:page].to_i, 1 ].max
    @total_count = User.count

    @users = User.order(:name).limit(PER_PAGE).offset((@page - 1) * PER_PAGE)
  end

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      flash.now[:notice] = t("flash.users.updated")
    else
      flash.now[:alert] = user.errors.full_messages.to_sentence
    end

    @page = [ params[:page].to_i, 1 ].max
    @total_count = User.count
    @users = User.order(:name).limit(PER_PAGE).offset((@page - 1) * PER_PAGE)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to users_path(page: @page) }
    end
  end

  private
    def user_params
      params.expect(user: [ :name, :email_address, :phone, :role, :active ])
    end
end
