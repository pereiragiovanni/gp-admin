module NavigationHelper
  def sidebar_menu
    menu = [
      { label: t("shared.navigation.dashboard"), path: root_path, icon: "layout-dashboard" }
    ]

    if Current.user.admin?
      menu << { label: t("shared.navigation.account"), icon: "user", children: [
          { label: t("shared.navigation.users"), path: users_path }
        ] }
    end

    menu
  end
end
