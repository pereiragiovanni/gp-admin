module BreadcrumbHelper
  TREE = {
    dashboard: { label: -> { t("shared.navigation.dashboard") }, path: -> { root_path }, parent: nil },
    users: { label: -> { t("shared.navigation.users") }, path: -> { users_path }, parent: :dashboard },
    profile: { label: -> { t("shared.navigation.profile") }, path: -> { edit_settings_path }, parent: :dashboard }
  }.freeze

  def breadcrumbs_for(key)
    trail = []
    while key
      node = TREE.fetch(key)
      trail.unshift(label: instance_exec(&node[:label]), path: instance_exec(&node[:path]))
      key = node[:parent]
    end
    trail.last[:path] = nil
    trail
  end
end
