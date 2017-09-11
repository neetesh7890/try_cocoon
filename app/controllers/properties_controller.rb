class PropertiesController < ApplicationController

  def new 
    @property = Property.new
    @property.attachments.build()
  end

  def create
    debugger
  end

  private
    def property_params
      params
        .require(:property)
          .permit(:name, :description, properties_attributes: [:id, :avatar, :_destroy])
    end
end
