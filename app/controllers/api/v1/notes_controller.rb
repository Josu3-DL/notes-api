class Api::V1::NotesController < ApplicationController
  def index
    notes = Note.all
    render json: { notes: notes }
  end

  def create
    note = Note.new(note_params)
    if note.save
      render json: { note: note, status: :created, message: "Note created succesfully" }
    else
      render json: { error: note.errors, status: :unprocesable_entity }
    end
  end

  private
  def note_params
    params.permit(:title, :content)
  end
end
