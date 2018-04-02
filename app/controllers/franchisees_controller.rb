class FranchiseesController < ApplicationController
  before_action :set_franchisee, only: [:show, :edit, :update, :destroy, :print_franchisee]
  #skip_before_action :set_franchisee, :except => [:show, :edit, :update, :destroy]

  # GET /franchisees
  # GET /franchisees.json
  def index
    @franchisees = Franchisee.order(created_at: :desc)
    #@country_list = Franchisee.country_list
  end

  # GET /franchisees/1
  # GET /franchisees/1.json
  def show
  end

  def print_franchisee
    respond_to do |format|
      format.html
      format.pdf do
      render  :pdf => "Franchisee_Agreement",disposition: 'inline', :template=> "franchisees/_print_franchisee.html.erb"
      end
    end
  end



  # def print_franchisee
  #   respond_to do |format|
  #     format.html
  #     format.pdf do
  #     #render  :pdf => "Franchisee_Agreement", disposition: 'inline', :template=> "franchisees/_print_franchisee.html.erb"
  #     pdf = render_to_string pdf: "Test", template: "franchisees/_print_franchisee.html.erb", encoding: "UTF-8"
  #     save_path = Rails.root.join('pdfs','test.pdf')
  #     File.open(save_path, 'wb') do |file|
  #       file << pdf
  #     end
  #      system("lpr", "pdfs/test.pdf")
  #     end    
  #   end
  # end


  # GET /franchisees/new
  def new

    @franchisee = Franchisee.new
    @franchisee.build_franchisee_agreement
    @franchisee.build_user
    @franchisee.franchisee_owners.build   
    @franchisee.build_franchisee_royalty 
    @franchisee.installment_details.build
    @franchisee.build_company_royalty
    @franchisee.build_franchisee_document
    @franchisees = []
    current_franchisee_type = current_user.franchisee ? current_user.franchisee.franchisee_type_before_type_cast : 0
    @franchisee_types = Franchisee.franchisee_types.select{|k,v|v > current_franchisee_type}
    @franchisees_selection = franchisee_selection("National Franchisee(NF)")
    
  end
  # GET /franchisees/1/edit
  def edit
    @franchisees = []
    @franchisee.build_franchisee_document
    current_franchisee_type = current_user.franchisee ? current_user.franchisee.franchisee_type_before_type_cast : 0
    @franchisee_types = Franchisee.franchisee_types.select{|k,v|v > current_franchisee_type}
    @franchisees_selection = franchisee_selection(@franchisee.franchisee_type)
  end

  # POST /franchisees
  # POST /franchisees.json
  def create

    @franchisee = Franchisee.new(franchisee_params)
  
    @franchisee.parent = params[:parent] if params[:parent] 
    respond_to do |format|
      if @franchisee.save
  
        UserRole.create(user_id: @franchisee.user.id, role_id: Role.find_by(:role_name=>"Admin").id)
        @franchisee.update(no_of_owners: FranchiseeOwner.where(franchisee_id: @franchisee.id).count, latest_renewal: @franchisee.franchisee_agreement.renewal_date)
        InstallmentDetail.advance_amount_entry(@franchisee)

      # To send onetime password creation mail
        PasswordResetMailer.password_reset_email(@franchisee.user_id, request.base_url, true).deliver_now!  

        #FranchiseeRoyalty.franchisee_royalty(@franchisee)
        
        format.html { redirect_to franchisees_url, notice: 'Franchisee was successfully created.' }
        format.json { render :show, status: :created, location: @franchisee }
      else
        format.html { render :new }
        format.json { render json: @franchisee.errors, status: :unprocessable_entity }
      end
    end
  end

  def franchisee_dashboard
   
 date_period = Date.today..Date.today+10
     #@installment = InstallmentDetail.where(installment_date: date_period).where.not(paid_status: true)
    @installment = InstallmentDetail.where(installment_date: date_period).where(paid_status: [nil, false])
     #anounceid1 = AnnouncementFor.where(franchisee_id: current_user.franchisee.id, created_at: Date.today..Date.today+10).pluck(:announcement_id)
     #anounceid2 = Announcement.where(created_at: Date.today..Date.today+10, is_for_all: true).pluck(:id)
     #@announcement = anounceid1 + anounceid2
#FranchiseeRoyalty.company_franchisee_royalty(@franchisee)


    #anounceid1 = AnnouncementFor.where(franchisee_id: current_user.franchisee.id).map{|i| i.announcement.deactivated == false ? i : nil}.compact.map{|j| (Date.today-10..Date.today).include?(j.announcement.created_at.to_date) ? j.announcement_id : 0}.uniq.compact
     #ann = AnnouncementFor.all.map{|i| i.announcement.deactivated == false ? i : nil}.compact
      # anounceid1 = ann.where(created_at: Date.today..Date.today+10).pluck(:announcement_id).uniq
     #anounceid1 = AnnouncementFor.where(created_at: Date.today..Date.today+10).pluck(:announcement_id).uniq
     #byebug
     anounceid1 = AnnouncementFor.where(franchisee_id: current_user.franchisee.id).map{|i| i.announcement.is_for_all == false  ? i : nil}.compact.map{|j| (Date.today-10..Date.today).include?(j.created_at.to_date) ? j : 0}.compact.map{|o| o.announcement.deactivated == false ? o.announcement.id : nil}.compact.uniq
     #anounceid1 =  AnnouncementFor.where(franchisee_id: current_user.franchisee.id).map{|i| i.announcement.is_for_all == false  ? i : nil}.compact.map{|j| (Date.today-10..Date.today).include?(j.created_at.to_date) ? j.announcement.id : 0}.uniq.compact
     #anounceid2 = Announcement.where(created_at: (Date.today-10..Date.today), is_for_all: true, deactivated: false).pluck(:id).uniq
     anounceid2 = Announcement.where(created_at: Date.today..Date.today+10, is_for_all: true, deactivated: false).pluck(:id).uniq
     @announcement = anounceid1 + anounceid2



  end  

  def franchisee_tree

    @franchisees =  Franchisee.all
   
    
  end




  # PATCH/PUT /franchisees/1
  # PATCH/PUT /franchisees/1.json
  def update
    respond_to do |format|
      if @franchisee.update(franchisee_params)
        @franchisee.parent = params[:parent] if params[:parent] 
        @franchisee.update(parent: @franchisee.parent)
        @franchisee.update(no_of_owners: FranchiseeOwner.where(franchisee_id: @franchisee.id).count, latest_renewal: @franchisee.franchisee_agreement.renewal_date)
        @franchisee.franchisee_agreement.update(no_of_installment: InstallmentDetail.where(franchisee_id: @franchisee.id).count.to_i)
        format.html { redirect_to franchisees_url, notice: 'Franchisee was successfully updated.' }
        format.json { render :show, status: :ok, location: @franchisee }
      else
        format.html { render :edit }
        format.json { render json: @franchisee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /franchisees/1
  # DELETE /franchisees/1.json
  def destroy
    @franchisee.destroy
    session[:user_id] = nil if @franchisee.user_id == current_user.id
    respond_to do |format|
      format.html { redirect_to franchisees_url, notice: 'Franchisee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def franchisee_agreement
       render :layout => false
  end

  def dashboard
  
    date_period = Date.today..Date.today+10
    
    @installment = InstallmentDetail.where(installment_date: date_period).where(paid_status: [nil, false])

    @renewals = Franchisee.where(latest_renewal: (Date.today..Date.today+30))
   
    anounceid1 = AnnouncementFor.all.map{|i| i.announcement.deactivated == false ? i : nil}.compact.map{|j| (Date.today-10..Date.today).include?(j.announcement.created_at.to_date) ? j.announcement_id : 0}.uniq.compact
    
     anounceid2 = Announcement.where(created_at: Date.today..Date.today+10, is_for_all: true, deactivated: false).pluck(:id).uniq
     @announcement = anounceid1 + anounceid2

  end

  def franchisee_level
  
    franchisee_parent = params[:franchisee_parent]
    franchisee_type = params[:franchisee_type]
    @franchisee = Franchisee.new
    #franchisee_type = Franchisee.find_by(location: params[:franchisee_parent]).franchisee_type

    parents_list = []

    case franchisee_type
    when "National Franchisee(NF)"
        render json: {"enable"=>1}
    when "Master Franchisee(MF)"
        if franchisee_parent ==  "BrainCarve"
          render json: {"enable"=>1}
        else 
              parent1  = Franchisee.find_by(location: params[:franchisee_parent]).parent
              parent1_id = Franchisee.find_by(location: params[:franchisee_parent]).id
              render json: {"enable"=>2, "id1" => parent1_id}
        end
    else
        if franchisee_parent ==  "BrainCarve"
            render json: {"enable"=>1}       
        else
            until franchisee_parent ==  "BrainCarve"
              parent1  = Franchisee.find_by(location: franchisee_parent).parent
              parents_list << Franchisee.find_by(location: franchisee_parent)
              franchisee_parent = parent1
            end
        
              array = parents_list.pluck(:franchisee_type, :id)
              render json: {"enable"=>array.to_h}
        end
    end

  end

        # if franchisee_parent ==  "BrainCarve"
        #     render json: {"enable"=>1}
        # else
        #     parent1  = Franchisee.find_by(location: params[:franchisee_parent]).parent
        #     parent1_id = Franchisee.find_by(location: params[:franchisee_parent]).id
        #       if parent1 == "BrainCarve"
        #       render json: {"enable"=>3, "id1" => parent1_id}
        #       else
        #         parent2  = Franchisee.find_by(location: parent1).parent
        #         parent2_id = Franchisee.find_by(location: parent1).id
        #         render json: {"enable"=>4, "id1" => parent1_id, "id2" => parent2_id}
        #       end
        # end
  

    # if franchisee_type == "National Franchisee(NF)"
    #    render json: {"enable"=>1}
    
    # elsif franchisee_type == "Master Franchisee(MF)"
      
    #     if franchisee_parent ==  "BrainCarve"
    #       render json: {"enable"=>1}
    #     else 
    #           parent1  = Franchisee.find_by(location: params[:franchisee_parent]).parent
    #           parent1_id = Franchisee.find_by(location: params[:franchisee_parent]).id
    #           render json: {"enable"=>2, "id1" => parent1_id}
    #     end

    # elsif franchisee_type == "District Franchisee(DF)"

    #      if franchisee_parent ==  "BrainCarve"
    #         render json: {"enable"=>1}
    #      else

    #         parent1  = Franchisee.find_by(location: params[:franchisee_parent]).parent
    #         parent1_id = Franchisee.find_by(location: params[:franchisee_parent]).id
    #           if parent1 == "BrainCarve"
    #           render json: {"enable"=>3, "id1" => parent1_id}
    #           else
    #             parent2  = Franchisee.find_by(location: parent1).parent
    #             parent2_id = Franchisee.find_by(location: parent1).id
    #             render json: {"enable"=>4, "id1" => parent1_id, "id2" => parent2_id}
    #           end
    #      end
           
    # elsif franchisee_type  == "Unit Franchisee(UF)"

    #    if franchisee_parent ==  "BrainCarve"
    #     render json: {"enable"=>1}
    #    else
    #         parent1  = Franchisee.find_by(location: params[:franchisee_parent]).parent
    #         parent1_id = Franchisee.find_by(location: params[:franchisee_parent]).id
    #           if parent1 == "BrainCarve"
    #           render json: {"enable"=>5, "id1" => parent1_id}
    #           else
    #             parent2  = Franchisee.find_by(location: parent1).parent
    #             parent2_id = Franchisee.find_by(location: parent1).id
    #                if parent2 == "BrainCarve"
    #                render json: {"enable"=>6, "id1" => parent1_id, "id2" => parent2_id}
    #                else
    #                 parent3  = Franchisee.find_by(location: parent2).parent
    #                 parent3_id = Franchisee.find_by(location: parent2).id
    #                 render json: {"enable"=>7, "id1" => parent1_id, "id2" => parent2_id, "id3" => parent3_id}
    #                end
    #           end
    #    end




  def get_type
    @franchisee = Franchisee.find(params[:id]) unless params[:id] == ""
    @franchisees_selection = franchisee_selection(params[:franchisee_type_id])
  end
  
  def emailcheck
    @user = User.find_by(email_id: params[:email])
    if @user.present?
      render json: {"result"=>true} 
    else
      render json: {"result"=>false} 
    end
end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_franchisee
      @franchisee = Franchisee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def franchisee_params
      params.require(:franchisee).permit!#(:franchisee_type_id, :location, :parent_id, :franchisee_personal=>[:id, :first_name, :middle_name, :last_name, :dob, :age, :occupation, :experience, :no_of_owners], :franchisee_contact=>[:id, :address, :city, :state, :country, :email_id, :contact_no, :land_line], :franchisee_agreement=>[:id, :agreement_date, :duration, :renewal_date, :location, :no_of_centers, :advance_amount_gst, :balance_amount_gst, :no_of_installment, :center_address, :city, :state, :pincode])
    end

    def franchisee_selection(franchisee_type)
      braincarve = Franchisee.new
      braincarve.id = 0
      braincarve.location = "BrainCarve"
      braincarve.parent = "BrainCarve"
      case franchisee_type
        when "National Franchisee(NF)"
          @franchisees_selection = [braincarve]#Franchisee.franchisee_selection(params[:franchisee_type_id])
        when "Master Franchisee(MF)"
          @franchisees_selection = Franchisee.franchisee_selection("National Franchisee(NF)")
          @franchisees_selection = [braincarve ,@franchisees_selection].flatten
        when "District Franchisee(DF)"
          @franchisees_selection = Franchisee.franchisee_selection(["National Franchisee(NF)", "Master Franchisee(MF)"])
          @franchisees_selection = [braincarve ,@franchisees_selection].flatten
        when "Unit Franchisee(UF)"
          @franchisees_selection = Franchisee.franchisee_selection(["National Franchisee(NF)", "Master Franchisee(MF)", "District Franchisee(DF)"])
          @franchisees_selection = [braincarve ,@franchisees_selection].flatten
        end
        return @franchisees_selection
    end
end
















   
=begin
    if franchisee_parent ==  "BrainCarve"
    result = 1

    #msg = "Your Username and Email does not match."
    render json: {"message"=>result, "parent" => "BrainCarve"}
    #@result.times { @franchisee.franchisee_royalties.build }
    #byebug
    else
      parent1 = Franchisee.find_by(location: params[:franchisee_parent]).parent
       #enable1 = Franchisee.find_by(location: params[:franchisee_parent]).franchisee_type
          id1 = Franchisee.find_by(location: params[:franchisee_parent]).id
       if parent1 == "BrainCarve"
        result = 2
        render json: {"message"=>result, "parent" => "BrainCarve","parent1" => id1}#, "tag1" => enable1}
        #@result.times { @franchisee.franchisee_royalties.build }
        #byebug
       else
          parent2 = Franchisee.find_by(location: parent1).parent
             id2  = Franchisee.find_by(location: parent1).id  
          if parent2 == "BrainCarve"
           result = 3
           render json: {"message"=>result,"parent" => "BrainCarve","parent1" => id2,"parent2" => id1}
           #@result.times { @franchisee.franchisee_royalties.build }
           #byebug 
          else

            parent3 = Franchisee.find_by(location: parent2).parent
                id3 = Franchisee.find_by(location: parent2).id
             result = 4
             render json: {"message"=>result, "parent" => "BrainCarve","parent1" => id3,"parent2" => id2, "parent3" => id1}
             #@result.times { @franchisee.franchisee_royalties.build }
             #byebug
          end
        end
=end

 
 
