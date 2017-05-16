require_relative "../views/view"
# WE DIDN'T HAVE TIME TO COVER THIS PART :P
# BUT IS THE SAME AS ALWAYS
class Controller
  def initialize(repo)
    @repo = repo
    @view = View.new
  end
end
