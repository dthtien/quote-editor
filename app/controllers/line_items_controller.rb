class LineItemsController < ApplicationController
  before_action :set_quote
  before_action :set_line_item_date
  before_action :set_line_item, only: [:edit, :update, :destroy]

  def new
    @line_item = @line_item_date.line_items.build
  end

  def create
    @line_item = @line_item_date.line_items.build(line_item_params)

    if @line_item.save
      respond_to do |format|
        message = 'Item was successfully added.'
        format.html do
          redirect_to quote_path(@quote), notice: message
        end

        format.turbo_stream { flash.now[:notice] = message }
      end

    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @line_item.update(line_item_params)
      respond_to do |format|
        message = 'Item was successfully updated.'
        format.html { redirect_to quote_path(@quote), notice: message }
        format.turbo_stream { flash.now[:notice] = message }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @line_item.destroy

    respond_to do |format|
      message = 'Item was successfully removed.'

      format.html do
        redirect_to quote_path(@quote), notice: message
      end

      format.turbo_stream { flash.now[:notice] = message }
    end
  end

  private

  def line_item_params
    params.require(:line_item).permit(:description, :quantity, :unit_price, :name)
  end

  def set_quote
    @quote = current_company.quotes.find(params[:quote_id])
  end

  def set_line_item_date
    @line_item_date = @quote.line_item_dates.find(params[:line_item_date_id])
  end

  def set_line_item
    @line_item = @line_item_date.line_items.find(params[:id])
  end
end
