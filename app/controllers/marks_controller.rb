class MarksController < ApplicationController

  def create
    @post = Post.find params[:post_id]

    mark = Mark.new marks_params
    mark.letter =
      if mark.points > 85
        'A'
      elsif mark.points > 65
        'B'
      elsif mark.points > 40
        'C'
      elsif mark.points > 20
        'D'
      else
        'F'
      end
    @post.marks.create({ points: mark.points, letter: mark.letter })
    redirect_to post_path @post
  end

  private def marks_params
    params.require(:mark).permit(:points)
  end
end
