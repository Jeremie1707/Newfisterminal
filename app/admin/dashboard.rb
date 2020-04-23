ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc {("Admin Board") }


  content title: proc { ("Admin Board") } do
    div class: "recent_container row", id: "recent-container" do
      div style:'max-width: 50vw' do
        event_users = PaperTrail::Version.all.order('id DESC') #by_customer is scope
        panel 'Last Modifications' do
          paginated_collection(event_users.page(params[:event_users_page]).per(15), param_name: 'event_users_page') do
            table_for(collection) do |v|
              column("item") { |v| "#{v.item_type}-##{v.item_id}" }
              column ("Type") { |v| v.item_type.underscore.humanize }
              column ("Event") { |v| v.event }
              column ("Modified at") { |v| v.created_at.to_s :long }
              column ("User name") { |v| if v.whodunnit
               "#{User.find(v.whodunnit).first_name} #{User.find(v.whodunnit).last_name}"
               end }
              column ("User email") { |v| if v.whodunnit
               link_to User.find(v.whodunnit).email, [:admin, User.find(v.whodunnit)]
               end }

            end
          end
        end
      end
    end

    div class: "recent_container row", id: "recent-container" do
      div style:'max-width: 50vw' do
        panel 'Load In and Load Out Net Weight Evolution' do
         render 'shared/load_in_line'
        end
      end
      div style:'max-width: 50vw' do
        panel 'Load In and Load Out Number of Trucks per day' do
         render 'shared/load_in_out_trucks'
        end
      end
    end

    div class: "recent_container row", id: "recent-container" do
      div style:'max-width: 50vw' do
        panel 'Load in Split by Status' do
         render 'shared/load_in_out_chart'
        end
      end
    end




   # controller do
   #  def show
   #    @users = User.all
   #  end

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
