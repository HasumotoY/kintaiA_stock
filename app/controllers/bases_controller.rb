class BasesController < ApplicationController
  
  before_action :set_base, only: [:edit,:update,:destroy]
  
  def new
    @base = Base.new
  end
  
  def create
    @base = Base.new(base_params)
    if @base.save
      flash[:success]="拠点情報を追加しました。"
      redirect_to bases_path
    else
      flash[:danger]="情報追加に失敗しました。<br>" + @base.errors.full_messages('<br>')
      redirect_to bases_url
    end
  end
  
  def index
    @bases = Base.all

  end
  
  def edit
  end
  
  def update
    if @base.update_attributes(base_params)
      flash[:success] ="拠点情報を更新しました。"
      redirect_to bases_path
    else
      flash[:danger]="情報更新に失敗しました。<br>" + @base.errors.full_messages('<br')
      redirect_to bases_url
    end
  end
  
  def destroy
    @base.destroy
    flash[:success]="#{@base.name}を削除しました。"
    redirect_to bases_path
  end
  
    private
    
      def base_params
        params.require(:base).permit(:base_number,:base_name,:base_status)
      end
      
      def set_base
        @base = Base.find(params[:id])
      end
end
