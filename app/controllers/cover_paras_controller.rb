class CoverParasController < ApplicationController
  def create
    @application = Application.find params[:application_id]
    paras = [
      { order: 1, text: params['1'].strip},
      { order: 2, text: params['2'].strip},
      { order: 3, text: params['3'].strip},
      { order: 4, text: params['4'].strip},
      { order: 5, text: params['5'].strip},
      { order: 6, text: params['6'].strip},
    ]
    paras.reject! { |p| p[:text].nil? || p[:text].empty? }
    paras.each do |para|
      if cover_para = CoverPara.find_by_text(para[:text])
        AppCoverPara.create(application: @application, cover_para: cover_para, order: para[:order]) unless @application.cover_paras.include? cover_para
      else
        CoverPara.create(text: para[:text])
        AppCoverPara.create(application: @application, cover_para: CoverPara.last, order: para[:order])
      end
    end
    redirect_to edit_application_path(@application)
  end

  def destroy
    acp = AppCoverPara.find(params[:id])
    if acp.cover_para.app_cover_paras.size == 1
      cp = acp.cover_para
      acp.destroy
      cp.destroy
    else
      acp.destroy
    end
    redirect_to edit_application_path(params[:application_id])
  end
end
