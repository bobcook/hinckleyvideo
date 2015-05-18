require 'rest-client'

class LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :update, :destroy]

  # GET /leads
  # GET /leads.json
  def index
    @leads = Lead.all

    if !params.nil?
      redirect_to '/pages/thanks'
    else
      redirect_to '/'
    end

    Lead.delay.send_data(params)

    # if response == 200
      # send_url = "https://sendy.livingscriptures.com/subscribe?&name="
      # send_url += new_record.first_name
      # send_url += "&email=" + new_record.email
      # send_url += "&Address=" + new_record.address
      # send_url += "&City=" + new_record.city
      # send_url += "&State=" + new_record.state
      # send_url += "&Zip=" + new_record.zip
      # send_url += "&Phone=" + new_record.phone
      # send_url += "&lastname=" + new_record.last_name
      # send_url += "&typecode=" + "234"
      # send_url += "&Country=" + new_record.country
      # send_url += "&date=" + "20150505"
      # send_url += "&listname=" + "234"enping
      # send_url += "&list=WAa1ZexLmHWH9L6YaKXO2A"

      # response2 = RestClient.get send_url

      # if response2 == 200
        # if new_record.save
        #   redirect_to '/pages/thanks'
        # else
        #   redirect_to '/'
        # end
      # end
    # end
    #response = RestClient.post 'https://localhost:7000', new_record.to_json, :content_type => :json, :accept => :json

  end

  # GET /leads/1
  # GET /leads/1.json
  def show
  end

  # GET /leads/new
  def new
    @lead = Lead.new
  end

  # GET /leads/1/edit
  def edit
  end

  # POST /leads
  # POST /leads.json
  def create
    @lead = Lead.new(lead_params)

    respond_to do |format|
      if @lead.save
        format.html { redirect_to @lead, notice: 'Lead was successfully created.' }
        format.json { render :show, status: :created, location: @lead }
      else
        format.html { render :new }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leads/1
  # PATCH/PUT /leads/1.json
  def update
    respond_to do |format|
      if @lead.update(lead_params)
        format.html { redirect_to @lead, notice: 'Lead was successfully updated.' }
        format.json { render :show, status: :ok, location: @lead }
      else
        format.html { render :edit }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1
  # DELETE /leads/1.json
  def destroy
    @lead.destroy
    respond_to do |format|
      format.html { redirect_to leads_url, notice: 'Lead was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lead_params
      #params.require(:lead).permit(:first_name, :last_name, :address, :city, :state, :zip, :country, :phone, :email)
    end
end
