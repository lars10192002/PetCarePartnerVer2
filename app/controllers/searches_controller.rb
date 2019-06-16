class SearchesController < ApplicationController
  skip_before_action :verify_authenticity_token
  layout 'search'
  require 'date'
  before_action :authenticate_user!, except: [:index, :show, :update]
  def show
    @result = Sitter.where("pet_limit >= ?",pet_count).where(address: location_code).page(params[:page]).per(10)
  end
  def update
    # if(params[:Drop_Off]=="") && (params[:Pick_Up]=="")
    
      @result = Sitter.where("pet_limit >= ?",pet_count).where("address LIKE ?",location_code).page(params[:page]).per(10) 
    # else 
    #   @result = Sitter.joins(:booking_dates).where(date: date_change(params[:Drop_Off])..date_change(params[:Pick_Up])).page(params[:page]).per(10)
      @date_count = BookingDate.where(date: date_change(params[:Drop_Off])..date_change(params[:Pick_Up])).pluck(:sitter_id)
      
      # 總天數
      # 決定and多少次
    # end  
  end

  private 
  def location_code
    if (params[:city_id]=="縣市" || params[:township_id] == "")
      city = TaiwanCity.get("")
      township = TaiwanCity.get("")
    else
      city = TaiwanCity.get(params[:city_id])
      township = TaiwanCity.get(params[:township_id])
    end
    @location = city + township + "%"
  end

  def pet_count
    params[:xs_count].to_i + params[:s_count].to_i + params[:m_count].to_i + params[:l_count].to_i
  end

  def date_change(day)
      if (day == "")
        return ""
      else
        daysplit = day.split("/")
        "#{daysplit[2]}-#{daysplit[0]}-#{daysplit[1]}"
      end
  end
end
