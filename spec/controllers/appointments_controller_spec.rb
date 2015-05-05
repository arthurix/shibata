require 'spec_helper'

describe AppointmentsController do
  render_views
  describe "index" do
    before do
      Patient.create(name: 'Raoni Boaventura', email: 'raoni@gmail.com', phone: '(09)8765-4321', sex: 'Male', birth: Date.new(1987, 11, 10), birthplace: "Brazilian", civilstate: "Maried", skin: "White", special_patient: false, address: "Rua Prof Dionísio P. de Alcantara, #30, Monte-serrat; Salvador")
      Appointment.create(visit_type: "Evaluation", obs: "Just some text to illustrate", date: Date.new(2015, 6, 5), time: Time.new(2015, 6, 6,  10,  0,  0), duration: 2, patient_id: 1)
      Appointment.create(visit_type: "Evaluation", obs: "Just some text to illustrate", date: Date.new(2015, 6, 6), time: Time.new(2015, 6, 6,  11,  0,  0), duration: 2, patient_id: 1)
      login_with create( :user )
      xhr :get, :index, format: :json
    end

    subject(:results) { JSON.parse(response.body) }

    def extract_obs
      ->(object) { object["obs"] }
    end

    context "when the list is requested" do
	  it "returns http success" do
	    expect(response.status).to eq(200)
	  end
	  it "returns the appointment list" do
	  	expect(results.map(&extract_obs)).to include('Just some text to illustrate')
	  end
	end
  end

end
