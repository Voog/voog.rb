module Edicy
  class API

    class Layout
      attr_accessor :id, :site_id, :parent_id, :title, :layout_name, :content_type, 
        :body, :component, :url, :created_by, :created_at, :updated_by, :updated_at
      
      def initialize(attributes)
        attributes.each {|name,value| send("#{name}=",value) if respond_to?("#{name}=")}
      end

    end

    module Layouts
      
      def layouts
        JSON.parse(get 'layouts').map{ |layout| Layout.new(layout) }
      end

      def layout(id)
        Layout.new(JSON.parse(get "layouts/#{id}"))
      end

    end

  end
end
