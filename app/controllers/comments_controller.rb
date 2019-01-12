class CommentsController < ApplicationController

  before_action :authenticate_user!, except: :index
  before_action only: [:edit, :update] do
    user_can_edit? set_comment_and_event
  end

  def index
    @event = Event.find(user_params[:event_id])
  end

  def create
    comment_params = user_params
    # add the user id if we've got one
    comment_params.merge!(user_id: current_user.id) if user_signed_in?

    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to event_path(comment_params[:event_id]), notice: I18n.t('comments.created_message')}
        format.json { render json: @comment, status: :created }
      else
        format.html { redirect_to root_path, notice: "Comment was not created: #{@comment.errors.full_messages.join(". ")}" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end


  def update
    respond_to do |format|
      if @comment.update(user_params.except(:comment_id))
        format.html { redirect_to event_path(@comment.event_id), notice: I18n.t('comments.updated_message')}
        format.json { render json: @comment }
      else
        format.html { redirect_to event_path(user_params[:event_id]), notice: 'Comment could not be updated'}
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Little bit hacky - since we need params from both the nested
  # comments hash and the upper level we need to go through an
  # extra layer of processing, e.g. given this:
  # {"comment"=>{"content"=>"first comment!"}, "event_id"=>"989132030"}
  # we want this:
  # {"event_id"=>"989132030", "content"=>"first comment!"}
  def user_params
    params.permit(:id, :event_id, comment: [:content, :event_id, :comment_id]).tap do |list|
      list.merge!(list.delete(:comment)) if list[:comment]
    end
  end

  # Set up the params. Note that the order is important here
  # as it is returning the comment object for the can_edit method.
  def set_comment_and_event
      @event = Event.find(user_params[:event_id]) if user_params[:event_id]
      @comment = Comment.find(user_params[:id])
  end

end
