class NotesController < ApplicationController
  
  def index
    @notes = Note.all
  end
   
  def new
    @note = Note.new
  end
   
  def create
    @note = Note.new(note_params)
      
    if @note.save
      redirect_to notes_path, notice: "The note #{@note.name} has been uploaded."
    else
      render "new"
    end
      
  end
   
  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to notes_path, notice:  "The note #{@note.name} has been deleted."
  end
  
  def show
    @list ,@file_info = ReadNote.list_file_content(params[:id])
  end
  
  def show_file_data
   render :xml => 'abc'
  end
   
  private
  def note_params
    params.require(:note).permit(:name, :attachment)
  end
   
end
 
