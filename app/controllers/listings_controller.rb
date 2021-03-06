class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:create]


  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.all
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create

    @listing = Listing.new(listing_params)
    @project = @listing.project
    @tenant = @project.tenant
    @user = User.last
    respond_to do |format|
      if @listing.save
        #UserNotifier.status_email(@tenant, @project).deliver

        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def send_email
    #binding.pry
    @listing = Listing.new
    @user = current_user
    
    @tenant = Tenant.find(params[:tenant_id])
    @project = Project.find(params[:project_id])
    
    UserNotifier.status_email(@tenant, @project, @user).deliver
    redirect_to :back, notice: 'Mail was successfully sent.'
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def set_user
      @user = User.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:q1, :q2, :q3, :user_id, :project_id)
    end
end
