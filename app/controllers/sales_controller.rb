class SalesController < ApplicationController
  def new
    @sale = Sale.new
    #code
  end

  def create
    @sale = Sale.new(sales_params)
    if @sale.save
      redirect_to sales_done_path
    end
  end

  def sales_params
    sanitize_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount, :tax, :total)
  end

  def sanitize_params
    @value = params["sale"]["value"].to_i
    @tax = params["sale"]["tax"].to_i
    @dsct = params["sale"]["discount"].to_i
    @total = 0
    @value = @value - ((@dsct*@value)/100)

    if @tax == 1
      @tax = 0
    else
      @tax = 19
    end

    @total = @value - ((@tax*@value)/100)
    params["sale"]["value"] = @value
    params["sale"]["tax"] = @tax
    params["sale"]["total"] = @total
  end

  def done
    @sales = Sale.all
  end
end
