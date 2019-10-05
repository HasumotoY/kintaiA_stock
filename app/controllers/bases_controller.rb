class BasesController < ApplicationController

  def index
    @bases = Base.all
  end
  
  def new
    Base.new
  end
  
  def create
    @base = Base.new(base_params)
    if @base.save
      flash[:success] = "拠点情報を追加しました。"
      redirect_to bases_url
    else
      flash[:danger]="拠点情報追加に失敗しました。"
      redirect_to bases_url
    end
  end
  
  def edit
  end
  
  def update
    @base = Base.find(params[:id])
    if @base.update_attributes(base_params)
      flash[:success]="拠点情報を修正しました。"
      redirect_to bases_url
    else
      flash[:danger]="拠点情報修正に失敗しました。"
      render bases_url
    end
  end
  
  def destroy
    @base = Base.find(params[:id])
    if @base.destroy
      flash[:success]="#{@base.name}の情報を削除しました。"
      redirect_to bases_url
    else
      flash[:danger]="情報の削除に失敗しました。"
      render bases_url
    end
  end
  
  private
    def base_params
      params.require(:base).permit(:base_number,:name,:bases_status)
    end
end
