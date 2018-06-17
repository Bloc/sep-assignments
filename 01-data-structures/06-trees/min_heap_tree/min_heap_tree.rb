require_relative 'node'

class MinHeapTree

    attr_accessor :items
    attr_accessor :item_map

    def initialize
        @items = [nil]
        @item_map = Hash.new
    end

    def insert(node)
        @items << node
        @item_map[node.title] = @items.size - 1
        shift_up(@items.size - 1)
    end

    def delete(data)
        item_position = @item_map[data]
        unless item_position.nil?
            exchange(item_position, @items.size - 1)
            item_to_remove = @items.pop
            @item_map.delete(item_to_remove.title)
            shift_down(item_position)
            return item_to_remove
        end
    end

    def find(data)
        item_position = @item_map[data]
        return unless item_position
        @items[item_position]
    end

    def print_heap
        @items.each do |item|
            next unless item
            puts "#{item.title}: #{item.rating}"
        end
    end

    private

    def shift_up(index)
        parent_index = (index / 2)
        return if index <= 1
        return if @items[index].rating >= @items[parent_index].rating
        exchange(index, parent_index)
        shift_up(parent_index)
    end

    def shift_down(index)
        child_index = (index * 2)
        return if child_index > @items.size - 1
        not_the_last_item = child_index < @items.size - 1
        left_item = @items[child_index].rating
        right_item = @items[child_index + 1].rating
        child_index += 1 if not_the_last_item && right_item < left_item
        return if @items[index].rating <= @items[child_index].rating
        exchange(index, child_index)
        shift_down(child_index)
    end

    def exchange(source, target)
        tmp_source = @items[source]
        tmp_target = @items[target]
        source_map = @item_map[tmp_source.title]
        target_map = @item_map[tmp_target.title]

        @items[source] = tmp_target
        @items[target] = tmp_source
        @item_map[tmp_source.title] = target_map
        @item_map[tmp_target.title] = source_map
    end
end