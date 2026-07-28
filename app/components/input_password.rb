class Components::InputPassword < Components::Base
  extend Phlex::Rails::HelperMacros
  register_output_helper :lucide_icon, mark_safe: true

  include Phlex::Rails::Helpers::ButtonTag

  def initialize(name:, id: nil, autocomplete: "current-password", placeholder: nil, required: false)
    @name = name
    @id = id
    @autocomplete = autocomplete
    @placeholder = placeholder
    @required = required
  end

  def view_template
    div(class: "relative", data: { controller: "password-visibility" }) do
      Input(
        type: :password,
        name: @name,
        id: @id,
        required: @required,
        autocomplete: @autocomplete,
        placeholder: @placeholder,
        maxlength: 72,
        class: "pr-10",
        data: { password_visibility_target: "input" }
      )

      button_tag(
        type: "button",
        tabindex: "-1",
        class: "absolute inset-y-0 right-0 flex items-center px-3 text-gray-400 hover:text-gray-600",
        data: { action: "click->password-visibility#toggle" }
      ) do
        lucide_icon "eye", class: "size-4 hidden", data: { password_visibility_target: "showIcon" }
        lucide_icon "eye-off", class: "size-4", data: { password_visibility_target: "hideIcon" }
      end
    end
  end
end
