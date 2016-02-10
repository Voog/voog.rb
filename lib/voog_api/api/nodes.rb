module Voog
  class API

    # Voog Nodes API methods.
    #
    # @see http://www.voog.com/developers/api/resources/nodes
    module Nodes

      # List nodes
      #
      # @see http://www.voog.com/developers/api/resources/nodes#get_nodes
      def nodes(params = {})
        paginate 'nodes', {query: params}
      end

      # Get a single node
      #
      # @see http://www.voog.com/developers/api/resources/nodes#get_node
      def node(id, params = {})
        get "nodes/#{id}", {query: params}
      end

      # Update a node
      #
      # @see http://www.voog.com/developers/api/resources/nodes#update_node
      def update_node(id, data)
        put "nodes/#{id}", data
      end

      # Reorder a node
      #
      # @see http://www.voog.com/developers/api/resources/nodes#relocate_node
      def move_node(node_id, params)
        put "nodes/#{node_id}/move", nil, {query: params}
      end
    end
  end
end
