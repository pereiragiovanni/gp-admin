class SettingsController < ApplicationController
  def edit
    @breadcrumb = :profile
    @user = Current.user
  end

  def update
    if Current.user.update(user_params)
      redirect_to edit_settings_path, notice: t("flash.settings.updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def remove_avatar
    Current.user.avatar.purge
    redirect_to edit_settings_path, notice: t("flash.settings.avatar_removed")
  end

  private
    def user_params
      params.expect(user: [ :name, :email_address, :phone, :password, :avatar ]).compact_blank
    end
end
