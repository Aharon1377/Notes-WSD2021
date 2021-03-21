class NotesController < ApplicationController
  
    def index
        @notes = Note.all
    end

    def show
        @note = Note.find(params[:_id])
    end
  
    def new
      @note = Note.new
    end
  
    def create
      @note = Note.new(note_params)
  
      respond_to do |format|
        if @note.save
          format.html { redirect_to action: "index", notice: "Note was successfully created." }
        else
          format.html { redirect_to action: "index", notice: "Note was not created." }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @note.update(note_params)
            format.html { redirect_to action: "index", notice: "Note was successfully created." }
        else
          format.html { redirect_to action: "index", notice: "Note was not created." }
        end
      end
    end
  
    def destroy
        @note = Note.find(params[:_id])
        @note.destroy
        respond_to do |format|
            format.html { redirect_to action: "index", notice: "Note was successfully created." }
        end
    end

    private
        # Only allow a list of trusted parameters through.
        def note_params
            params.require(:note).permit(:_id, :title, :text, :image)
        end
  
  end
  