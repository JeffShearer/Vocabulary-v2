class TermsController < ApplicationController
  before_action :set_term, only: [:show, :edit, :update, :destroy]

  def index
    @terms = Term.all
  end

  def show
  end

  def new
    @term = Term.new
  end

  def edit
  end

  def create
    @term = Term.new(term_params)
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def term_params
      params.require(:term).permit(:description)
    end
end
