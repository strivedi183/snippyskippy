class MediaController < ApplicationController
  layout :resolve_layout

  def index
  end
  def create
    @stylist = Stylist.find(params[:stylist_id])
    @medium = Medium.create(:stylist_id => @stylist.id)
    @medium.update_attributes(params[:medium])
    params[:medium_tag_ids].split(',').each do |tag_id|
      tag = Tag.find(tag_id)
      @medium.tags << tag
    end
    @medium = Medium.new
    gflash :success => { :title => "Upload Successful", :value => @auth.name.split(" ")[0] + ",You are now logged in.", :time => 3000, :sticky => false }
  end

  def show
    @medium = Medium.find(params[:id])
  end

  private
  def resolve_layout
    case action_name
    when "show"
      "medium_layout"
    else
      "application"
    end
  end
end

