module Edicy
  class API
    module Nodes

      # List nodes
      def nodes(params = {})
        get 'nodes', {query: params}
      end

      # Get a single node
      def node(id, params = {})
        get "nodes/#{id}", {query: params}
      end

      # Update a node
      def update_node(id, data)
        put "nodes/#{id}", data
      end

      # Reorder a node
      def move_node(node_id, params)
        put "nodes/#{node_id}/move", nil, {query: params}
      end
    end
  end
end
