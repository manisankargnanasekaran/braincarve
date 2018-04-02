class FranchiseeContactsController < ApplicationController
  before_action :set_franchisee_contact, only: [:show, :edit, :update, :destroy]

  # GET /franchisee_contacts
  # GET /franchisee_contacts.json
  def index
    @franchisee_contacts = FranchiseeContact.all
  end

  # GET /franchisee_contacts/1
  # GET /franchisee_contacts/1.json
  def show
  end

  # GET /franchisee_contacts/new
  def new
    @franchisee_contact = FranchiseeContact.new
  end

  # GET /franchisee_contacts/1/edit
  def edit
  end

  # POST /franchisee_contacts
  # POST /franchisee_contacts.json
  def create
    @franchisee_contact = FranchiseeContact.new(franchisee_contact_params)

    respond_to do |format|
      if @franchisee_contact.save
        format.html { redirect_to @franchisee_contact, notice: 'Franchisee contact was successfully created.' }
        format.json { render :show, status: :created, location: @franchisee_contact }
      else
        format.html { render :new }
        format.json { render json: @franchisee_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /franchisee_contacts/1
  # PATCH/PUT /franchisee_contacts/1.json
  def update
    respond_to do |format|
      if @franchisee_contact.update(franchisee_contact_params)
        format.html { redirect_to @franchisee_contact, notice: 'Franchisee contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @franchisee_contact }
      else
        format.html { render :edit }
        format.json { render json: @franchisee_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /franchisee_contacts/1
  # DELETE /franchisee_contacts/1.json
  def destroy
    @franchisee_contact.destroy
    respond_to do |format|
      format.html { redirect_to franchisee_contacts_url, notice: 'Franchisee contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_franchisee_contact
      @franchisee_contact = FranchiseeContact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def franchisee_contact_params
      params.require(:franchisee_contact).permit(:franchisee_id, :address, :city, :state, :country, :email_id, :contact_no, :land_line)
    end
end
