module Edicy
  class API
    module Layouts
      
      def layouts
        @layouts = JSON.parse(get('layouts'))["layouts"]
        @layouts.map{ |layout| hash2openstruct(layout) }
      rescue RestClient::Exception
        return false
      end

      def layout(id)
        @layout = JSON.parse(get("layouts/#{id}"))["layout"]
        hash2openstruct(@layout)
      rescue RestClient::Exception
        return false
      end

      def delete_layout(id)
        delete("layouts/#{id}").code == 200
      rescue RestClient::Exception
        return false
      end

      def update_layout(id, data)
        @layout = JSON.parse(
          put("layouts/#{id}", 
          JSON.dump({ "layout" => data }))
        )["layout"]
        hash2openstruct(@layout)
      rescue RestClient::Exception
        return false
      end

      def create_layout(data)
        @layout = JSON.parse(post("layouts", { "layout" => data }))["layout"]
        hash2openstruct(@layout)
      rescue RestClient::Exception
        return false
      end

    end
  end
end
