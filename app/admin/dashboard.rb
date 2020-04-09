ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc {("Admin Board") }

  content title: proc { ("Admin Board") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span ("Admin Board")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end


    # columns do
    #   column do
    #     panel "Recent Incoming Trip" do
    #       ul do
    #         LoadIn.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
