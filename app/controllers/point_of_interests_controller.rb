class PointOfInterestsController < ApplicationController
  # GET /point_of_interests
  # GET /point_of_interests.json
  def index
    @point_of_interests = PointOfInterest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @point_of_interests }
    end
  end

  # GET /point_of_interests/1
  # GET /point_of_interests/1.json
  def show
    @point_of_interest = PointOfInterest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @point_of_interest }
    end
  end

  # GET /point_of_interests/new
  # GET /point_of_interests/new.json
  def new
    @point_of_interest = PointOfInterest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @point_of_interest }
    end
  end

  # GET /point_of_interests/1/edit
  def edit
    @point_of_interest = PointOfInterest.find(params[:id])
  end

  # POST /point_of_interests
  # POST /point_of_interests.json
  def create
    @point_of_interest = PointOfInterest.new(params[:point_of_interest])

    respond_to do |format|
      if @point_of_interest.save
        format.html { redirect_to @point_of_interest, notice: 'Point of interest was successfully created.' }
        format.json { render json: @point_of_interest, status: :created, location: @point_of_interest }
      else
        format.html { render action: "new" }
        format.json { render json: @point_of_interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /point_of_interests/1
  # PUT /point_of_interests/1.json
  def update
    @point_of_interest = PointOfInterest.find(params[:id])

    respond_to do |format|
      if @point_of_interest.update_attributes(params[:point_of_interest])
        format.html { redirect_to @point_of_interest, notice: 'Point of interest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @point_of_interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /point_of_interests/1
  # DELETE /point_of_interests/1.json
  def destroy
    @point_of_interest = PointOfInterest.find(params[:id])
    @point_of_interest.destroy

    respond_to do |format|
      format.html { redirect_to point_of_interests_url }
      format.json { head :no_content }
    end
  end
end
