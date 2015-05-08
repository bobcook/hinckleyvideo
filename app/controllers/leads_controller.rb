class LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :update, :destroy]

  # GET /leads
  # GET /leads.json
  def index
    @leads = Lead.all

    new_record = Lead.new
    # &
    # name=12+123&
    # lastname=112312&
    # Address=123&
    # Ciby=123123123123&
    # Zip=2134&
    # Country=Canada&
    # Phone=9844444444&
    # email%5B%5D=1234%4021341234&
    # typecode=Oli&
    # list=FD2WkGL763E2W3RKGbIsqP9A
    new_record.first_name = params[:name]
    new_record.last_name = params[:lastname]
    new_record.address = params[:Address]
    new_record.city = params[:Ciby]
    new_record.state = params[:State]
    new_record.zip = params[:Zip]
    new_record.country = params[:Country]
    new_record.phone = params[:Phone]
    new_record.email = params[:email]

    new_record.save

    # if new_record.save
    #   redirect_to '/pages/thanks'
    # else 
    #   redirect_to '/'
    # end

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
      params.require(:lead).permit(:first_name, :last_name, :address, :city, :state, :zip, :country, :phone, :email)
    end
end
