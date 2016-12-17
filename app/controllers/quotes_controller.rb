class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").first
  end

  # def create
  #  @quote = Quote.create(quote_params)
   # if @quote.invalid?
    #  flash [:error] = '<strong>Could not save</strong> the data you entered is invalid'
    # end
    # redirect_to root_path
  # end
  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = "<strong>Could not save</strong> #{@quote.errors.full_messages.join(", ")}."
    end
    redirect_to root_path
  end

  def edit
    @quote = Quote.find(params[:id])
  end

  def update
    @quote = Quote.find(params[:id])

    if @quote.update_attributes(quote_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def about
  end

  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end
end
