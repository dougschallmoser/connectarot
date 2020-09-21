class ThoughtsController < ApplicationController

  before_action :require_login, only: [:create, :destroy]

  def create
    entry = Entry.find_by(id: params[:entry_id])
    require_authorization(entry.user)
    thought = entry.thoughts.build(thought_params)
    if !thought.save
      flash[:message] = thought.errors.full_messages.to_sentence
    else
      flash[:message] = "Thought saved"
    end
    redirect_to entry_path(entry.id)
  end

  def destroy
    thought = Thought.find_by(id: params[:id])
    entry = thought.entry
    require_authorization(entry.user)
    thought.destroy
    redirect_to entry_path(entry.id)
  end

  private

  def thought_params
    params.require(:thought).permit(:content)
  end

end