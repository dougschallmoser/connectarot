module ApplicationHelper

    def my_requests_path 
        "#{root_path}requests?name=#{current_user.name.gsub(" ", "+")}&commit=Search"
    end

end

