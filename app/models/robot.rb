require 'open-uri'

class Robot

  def initialize
    @link = "http://10.10.130.100:1238"
    @id = "1"
  end

  def lock
    open("#{@link}/#{@id}/lock").read
  end

  def proximity
    open("#{@link}/proximity").read
  end

  def forward
    open("#{@link}/#{@id}/forward").read
  end

  def backward
    open("#{@link}/#{@id}/backward").read
  end

  def slow_forward
    open("#{@link}/#{@id}/slow_forward").read
  end

  def slow_backward
    open("#{@link}/#{@id}/slow_backward").read
  end

  def left
    open("#{@link}/#{@id}/left").read
  end

  def right
    open("#{@link}/#{@id}/right").read
  end

  def run
    open("#{@link}/#{@id}/run").read
  end

  def attack
    open("#{@link}/#{@id}/attack").read
  end

end
