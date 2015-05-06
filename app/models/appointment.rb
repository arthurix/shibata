class Appointment < ActiveRecord::Base
	belongs_to :patient

	attr_accessor :patient_name
end
