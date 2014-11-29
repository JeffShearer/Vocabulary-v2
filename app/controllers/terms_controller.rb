class TermsController < ApplicationController
  before_action :set_term, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy] 
  
  def index
    @terms = Term.all.paginate(:page => params[:page], :per_page => 4)
  end

  def show
  end

  def new
    @term = current_user.terms.build
  end

  def edit
  end

  def create
    @term = current_user.terms.build(term_params)
    if @term.save
      redirect_to @term, notice: 'Term was successfully created.'
    else
     render action: 'new'
    end
  end

  def update
    if @term.update(term_params)
      redirect_to @term, notice: 'Term was successfully updated.' 
    else
      render action: 'edit' 
    end
  end

  def destroy
    @term.destroy
    redirect_to terms_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_term
      @term = Term.find(params[:id])
    end

    def correct_user
      @term = current_user.terms.find_by(id: params[:id])
      redirect_to terms_path, notice: "You can't edit someone else's term" if @term.nil?
    end 
    # Never trust parameters from the scary internet, only allow the white list through.
    def term_params
      params.require(:term).permit(:description, :term_name, :term_part_of_speech, :term_language, :term_definition, :term_gender)
    end
end
