class Api::V1::NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]

  def index
    notes = Note.order(created_at: :desc).page(params[:page]).per(params[:per_page])
    render json: { 
      notes: notes,
      meta: {
        current_page: notes.current_page,
        next_page: notes.next_page,
        prev_page: notes.prev_page,
        total_pages: notes.total_pages,
        total_notes: notes.total_count
      }
    }
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

  private
  def note_params
    params.permit(:title, :content)
  end

  def set_note
    @note = Note.find(params[:id])
  end
end
