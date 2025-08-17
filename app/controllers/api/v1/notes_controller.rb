class Api::V1::NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]

  def index
    notes = Note.all
    render json: { notes: notes }
  end

  def create
    note = Note.new(note_params)
    if note.save
      render json: @note
    else
      render json: { errors: @note.errors.full_messages }, status: :unprocessable_entity
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
