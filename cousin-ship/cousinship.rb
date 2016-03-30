class Integer
    # add th, st, nd, or rd to integer
    # This code is copied from ActiveSupport's ordinal and modified for my use
    def ordinal
        abs_number = self.to_i.abs

        if (11..13).include?(abs_number % 100)
            "#{self}th"
        else
            case abs_number % 10
                when 1; "#{self}st"
                when 2; "#{self}nd"
                when 3; "#{self}rd"
            else    "#{self}th"
            end
        end
    end

    # output once if number is 1, otherwise call ordinal
    def ordinal_special
        return 'once' if self == 1
        self.ordinal
    end
end


class Person
    attr_reader :id, :ancestor

    def initialize(id, ancestor)
        @id = id
        @ancestor = ancestor
    end
end


class FamilyTree
    
    def initialize
        @tree = Array.new
    end

    # Create enumerable over the array
    def each_with_index(&block)
        @tree.each_with_index(&block)
    end

    # Get the length of the array
    def length
        @tree.length
    end

    # Get index of the array
    def [](index)
        @tree[index]
    end

    # Add a Person to an array
    def add(person)
        @tree.push(person)
        @sorted = false
    end

    # Sort the array
    def sort()
        @tree.sort! { |x,y| x.id <=> y.id }
        @sorted = true
    end

    # Get the depth of the given Person
    def depth(person)
        count = 0
        
        until person.ancestor == nil do
            person = person.ancestor
            count += 1
        end

        count
    end

    # Find a Person by their id
    def find(id)
        sort() unless @sorted
        @tree.bsearch { |x| x.id == id }
    end

    # Find the common ancestor between two People
    def cousinShip(person1, person2)
        person1 = find(person1) || person1 unless person1.is_a? Person
        return "Couldn't find person: #{person1}" unless person1.is_a? Person

        person2 = find(person2) || person2 unless person2.is_a? Person
        return "Couldn't find person: #{person2}" unless person2.is_a? Person

        # Traversal pointers
        p1 = person1
        p2 = person2

        # Hop counters
        hops1 = 0
        hops2 = 0

        # Get initial depth of each node
        depth_p1 = depth(p1)
        depth_p2 = depth(p2)

        # Walk up the tree until they are at the same depth
        until depth_p1 == depth_p2 do
            if (depth_p1 > depth_p2)
                p1 = p1.ancestor
                depth_p1 -= 1
                hops1 += 1
            else
                p2 = p2.ancestor
                depth_p2 -= 1
                hops2 += 1
            end
        end

        # Walk up the tree until a common node is found
        until p1 == p2 do
            p1 = p1.ancestor
            hops1 += 1

            p2 = p2.ancestor
            hops2 += 1
        end

        # 1) The minimum number of hops to the common ancestor, minus 1
        minHops = hops1 < hops2 ? hops1 - 1 : hops2 - 1

        # 2) The absolute value of the difference in hops to the common ancestor
        diff = (hops1 - hops2).abs

        # return cousinShip
        "#{person1.id} and #{person2.id} are #{minHops.ordinal} cousins, #{diff.ordinal_special} removed"
    end
end


###################
# CREATE TREE
###################
a = Person.new('A', nil)
b = Person.new('B', a)
c = Person.new('C', a)
d = Person.new('D', b)
e = Person.new('E', b)
f = Person.new('F', c)
g = Person.new('G', d)

tree = FamilyTree.new
tree.add(a)
tree.add(b)
tree.add(c)
tree.add(d)
tree.add(e)
tree.add(f)
tree.add(g)

############################################
# Print the relationship amongst each node
############################################
tree.each_with_index do |n, index|
    (index+1...tree.length).each do |m|
        puts tree.cousinShip(n, tree[m])
    end
end
