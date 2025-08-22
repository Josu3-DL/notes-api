class Api::V1::NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]

  def index
    notes = Note.order(created_at: :desc).page(params[:page]).per(params[:per_page])
    render_with_pagination(notes)
  end

  def create
    note = Note.new(note_params)
    if note.save
      render json: note
    else
      render json: { errors: note.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show 
    render json: @note 
  end

  def update
    if @note.update(note_params)
      render json: @note
    else
      render json: { error: @note.errors.full_messages, status: :unprocesable_entit }
    end
  end

  def destroy
    if @note.destroy
      render json: {message: "Deleted succesfully"}
     else
      render json: { error: @note.errors.full_messages, status: :unprocesable_entit }
    end
  end

  def by_title 
    notes = Note.by_title(params[:title]).page(params[:page]).per(params[:per_page])
    render_with_pagination(notes)
  end

  def by_status
    notes = Note.by_status(params[:status]).page(params[:page]).per(params[:per_page])
    render_with_pagination(notes)
  end

  def by_priority
    notes = Note.by_priority(params[:priority]).page(params[:page]).per(params[:per_page])
    render_with_pagination(notes)
  end

  private
  def note_params
    params.permit(:title, :content, :status, :priority)
  end

  def set_note
    @note = Note.find(params[:id])
  end

  def render_with_pagination(collection)
    render json: {
      collection: collection,
      meta: {
        current_page: collection.current_page,
        next_page: collection.next_page,
        prev_page: collection.prev_page,
        total_pages: collection.total_pages,
        total_collection: collection.total_count
      }
    }
  end
end
