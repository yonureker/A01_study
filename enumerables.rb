
require 'byebug'
class Array
  def my_each(&prc)
    i = 0
    while i < self.size
      prc.call(self[i])
    end
    self
  end

  def my_select(&prc)
    selected = []
    self.each do |el|
      selected << el if prc.call(el)
    end
    selected
  end

  def my_reject(&prc)
    selected = []
    self.each do |el|
      selected << el unless prc.call(el)
    end
    selected
  end

  def my_any?(&prc)
    self.each do |el|
      return true if prc.call(el)
    end
    false
  end

  def my_all?(&prc)
    self.each do |el|
      return false unless prc.call(el)
    end
    true
  end

  def my_flatten
    flat = []

    self.each do |el|
      if el.is_a? Array
        flat += el.my_flatten
      else
        flat += [el]
      end
    end
    flat
  end

  def my_zip(*args)
    my_array = []

    (0...self.size).each do |i|
      sub_array = [self[0]]

      args.each do |arg|
        sub_array << arg[i]
      end

      my_array << sub_array
    end
    my_array
  end

  #def my_rotate
  #end

  def my_join(str)
    my_string = ''
    (0...self.size-1).each do |i|
      my_string += self[i] + str + self[i+1]
    end
    my_string
  end

  def my_reverse
    reversed = []
    (self.size - 1).downto(0).each do |i|
      reversed << self[i]
    end
    reversed
  end
end

p [1].my_reverse



