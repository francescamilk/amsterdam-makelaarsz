class PropertiesController < ApplicationController
  before_action :authenticate_account!, only: %i[ new create edit update destroy ]
  before_action :set_property, only: %i[ show edit update destroy ]

  # GET /properties or /properties.json
  def index
    @properties = Property.all

    if params[:name_query].present?
      @properties = @properties.search_by_name(params[:name_query])
    end

    if params[:neighborhood_query].present?
      @properties = @properties.search_by_neighborhood(params[:neighborhood_query])
    end
    
    if params[:min_rooms].present? || params[:max_rooms].present?
      min_rooms = params[:min_rooms].present? ? params[:min_rooms] : 0
      max_rooms = params[:max_rooms].present? ? params[:max_rooms] : 100000
      @properties = @properties.filter_by_rooms(min_rooms, max_rooms)
    end

    if params[:min_price].present? || params[:max_price].present?
      min_price = params[:min_price].present? ? params[:min_price] : 0
      max_price = params[:max_price].present? ? params[:max_price] : 100000
      @properties = @properties.filter_by_price(min_price, max_price)
    end

    @markers = @properties.geocoded.map do |p|
      {
        lat: p.latitude,
        lng: p.longitude
        # info_window: render_to_string(partial: "info_window", locals: { flat: flat })
      }
    end
  end

  # GET /properties/1 or /properties/1.json
  def show
    @agent = @property.account
    @agent_properties = Property.where(account_id: @agent).limit(4)
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties or /properties.json
  def create
    @property = Property.new(property_params)
    @property.account_id = current_account.id

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: "Property was successfully created." }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: "Property was successfully updated." }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: "Property was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  def for_sale
    @for_sale = Property.where(for_sale: true)
  end
  
  def for_rent
    @for_rent = Property.where(for_sale: false)
  end
  
  def email_agent
    # trigger email send
    agent_id = params[:agent_id]
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    message = params[:message]

    ContactMailer.email_agent( agent_id, first_name, last_name, email, message ).deliver_now

    # response to script
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:name, :address, :price, :rooms, :bedrooms, :bathrooms, :description, :neighborhood, :neighborhood_text, :for_sale, :available_date, photos: [])
    end
end
