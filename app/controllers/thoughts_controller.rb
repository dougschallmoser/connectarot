class ThoughtsController < ApplicationController
  before_action :require_login, only: [:create, :destroy]

  def create
    entry = Entry.find_by(id: params[:entry_id])
    set_user(entry)
    require_authorization
    thought = entry.thoughts.build(thought_params)
    if thought.save
      flash[:message] = "Thought saved"
    else
      flash[:message] = thought.errors.full_messages.to_sentence
    end
    redirect_to entry_path(entry.id)
  end

  def destroy
    thought = Thought.find_by(id: params[:id])
    if thought 
      set_user(thought.entry)
      require_authorization
      thought.destroy
      flash[:message] = "Thought deleted."
    else
      flash[:message] = "Thought not found"
    end
    redirect_to entry_path(thought.entry.id)
  end

  private

  def thought_params
    params.require(:thought).permit(:content)
  end

  def set_user(entry)
    @user = entry.user
  end
end