class MedicalInquiriesController < ApplicationController
  def index
    matching_medical_inquiries = MedicalInquiry.all

    @list_of_medical_inquiries = matching_medical_inquiries.order({ :created_at => :desc })

    render({ :template => "medical_inquiries/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_medical_inquiries = MedicalInquiry.where({ :id => the_id })

    @the_medical_inquiry = matching_medical_inquiries.at(0)

    render({ :template => "medical_inquiries/show.html.erb" })
  end

  def create
    the_medical_inquiry = MedicalInquiry.new
    the_medical_inquiry.user_id = params.fetch("query_user_id")
    the_medical_inquiry.patient_message = params.fetch("query_patient_message")
    the_medical_inquiry.ai_recommendation = params.fetch("query_ai_recommendation")

    if the_medical_inquiry.valid?
      the_medical_inquiry.save
      redirect_to("/medical_inquiries", { :notice => "Medical inquiry created successfully." })
    else
      redirect_to("/medical_inquiries", { :alert => the_medical_inquiry.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_medical_inquiry = MedicalInquiry.where({ :id => the_id }).at(0)

    the_medical_inquiry.user_id = params.fetch("query_user_id")
    the_medical_inquiry.patient_message = params.fetch("query_patient_message")
    the_medical_inquiry.ai_recommendation = params.fetch("query_ai_recommendation")

    if the_medical_inquiry.valid?
      the_medical_inquiry.save
      redirect_to("/medical_inquiries/#{the_medical_inquiry.id}", { :notice => "Medical inquiry updated successfully."} )
    else
      redirect_to("/medical_inquiries/#{the_medical_inquiry.id}", { :alert => the_medical_inquiry.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_medical_inquiry = MedicalInquiry.where({ :id => the_id }).at(0)

    the_medical_inquiry.destroy

    redirect_to("/medical_inquiries", { :notice => "Medical inquiry deleted successfully."} )
  end
end
