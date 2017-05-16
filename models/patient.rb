class Patient
  attr_accessor :where_are_you,:id
  def initialize(attr = {})
    @id = attr[:id] || nil
    @name = attr[:name]
    @cured = attr[:cured] || false
    @where_are_you = ""
  end

  def cured?
    @cured
  end
  def cured
    @cured = true
  end
end
