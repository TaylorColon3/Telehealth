class VitalsController < ApplicationController
  def index
    matching_vitals = Vital.all

    @list_of_vitals = matching_vitals.order({ :created_at => :desc })

    render({ :template => "vitals/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_vitals = Vital.where({ :id => the_id })

    @the_vital = matching_vitals.at(0)

    render({ :template => "vitals/show.html.erb" })
  end

  def create
    the_vital = Vital.new
    the_vital.user_id = params.fetch("query_user_id")
    the_vital.health_conditions = params.fetch("query_health_conditions")

    if the_vital.valid?
      the_vital.save
      redirect_to("/vitals", { :notice => "Vital created successfully." })
    else
      redirect_to("/vitals", { :alert => the_vital.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_vital = Vital.where({ :id => the_id }).at(0)

    the_vital.user_id = params.fetch("query_user_id")
    the_vital.health_conditions = params.fetch("query_health_conditions")

    if the_vital.valid?
      the_vital.save
      redirect_to("/vitals/#{the_vital.id}", { :notice => "Vital updated successfully."} )
    else
      redirect_to("/vitals/#{the_vital.id}", { :alert => the_vital.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_vital = Vital.where({ :id => the_id }).at(0)

    the_vital.destroy

    redirect_to("/vitals", { :notice => "Vital deleted successfully."} )
  end
end
