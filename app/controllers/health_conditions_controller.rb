class HealthConditionsController < ApplicationController
  def index
    matching_health_conditions = HealthCondition.all

    @list_of_health_conditions = matching_health_conditions.order({ :created_at => :desc })

    render({ :template => "health_conditions/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_health_conditions = HealthCondition.where({ :id => the_id })

    @the_health_condition = matching_health_conditions.at(0)

    render({ :template => "health_conditions/show.html.erb" })
  end

  def create
    the_health_condition = HealthCondition.new
    the_health_condition.user_id = params.fetch("query_user_id")
    the_health_condition.medical_id = params.fetch("query_medical_id")

    if the_health_condition.valid?
      the_health_condition.save
      redirect_to("/health_conditions", { :notice => "Health condition created successfully." })
    else
      redirect_to("/health_conditions", { :alert => the_health_condition.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_health_condition = HealthCondition.where({ :id => the_id }).at(0)

    the_health_condition.user_id = params.fetch("query_user_id")
    the_health_condition.medical_id = params.fetch("query_medical_id")

    if the_health_condition.valid?
      the_health_condition.save
      redirect_to("/health_conditions/#{the_health_condition.id}", { :notice => "Health condition updated successfully."} )
    else
      redirect_to("/health_conditions/#{the_health_condition.id}", { :alert => the_health_condition.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_health_condition = HealthCondition.where({ :id => the_id }).at(0)

    the_health_condition.destroy

    redirect_to("/health_conditions", { :notice => "Health condition deleted successfully."} )
  end
end
