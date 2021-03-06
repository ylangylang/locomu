class UserPhotosController < ApplicationAuthController
  before_action :set_user_photo, only: [:show, :show_modal, :edit, :update, :add_point, :destroy]

  # GET /user_photos
  # GET /user_photos.json
  def index
   # @user_photos = UserPhoto.order(:created_at).page params[:page]
    @user_photos = UserPhoto.page(params[:page]).order('created_at DESC')
    @current_user = current_user
  end

  def search
#    @members = UserPhoto.search(params[:q]).page(params[:page]).order('created_at DESC')
    @user_photos = UserPhoto.search(params[:q]).page(params[:page]).order('created_at DESC')
    render action: 'index'
  end

  # GET /user_photos/1
  # GET /user_photos/1.json
  def show
  end

  def show_modal
    respond_to do |format|
      format.js
    end
  end

  def add_point
    point = @user_photo.points.find_by(user_id: current_user.id)

    if point.nil?
      @user_photo.points.build(user_id: current_user.id, user_photo_id: @user_photo.id, value: 1)
      @user_photo.save
    else
      if point.add_point
        point.save
      end
    end

    respond_to do |format|
      format.js
    end
  end

  # GET /user_photos/new
  def new
    @user_photo = UserPhoto.new
    @user_photo.build_photo_image
  end

  # GET /user_photos/1/edit
  def edit
  end

  # POST /user_photos
  # POST /user_photos.json
  def create
    @user_photo = UserPhoto.new(user_photo_params)
    @user_photo.user_id = current_user.id

    @user_photo.build_photo_image

    if @user_photo.content_type.present?
      @user_photo.photo_image.uploaded_image = @user_photo.temp_image
      @user_photo.total_size = @user_photo.photo_image.total_size
    end

    respond_to do |format|
      if @user_photo.save
        #format.html { redirect_to @user_photo, notice: 'User photo was successfully created.' }
        format.html { redirect_to action: 'index' }
        format.json { render action: 'index', status: :created, location: @user_photo }
        flash.notice = 'User photo was successfully created.'
      else
        format.html { render action: 'new' }
        format.json { render json: @user_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_photos/1
  # PATCH/PUT /user_photos/1.json
  def update
    respond_to do |format|
      if @user_photo.update(user_photo_params)
        format.html { redirect_to action: 'index' }
        format.json { head :no_content }
        flash.notice = 'User photo was successfully updated.'
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_photos/1
  # DELETE /user_photos/1.json
  def destroy
    @user_photo.destroy
    respond_to do |format|
      format.html { redirect_to user_photos_url }
      format.json { head :no_content }
    end
  end
  
  def get_image
    @user_photo = UserPhoto.find params[:id]
    send_data(@user_photo.photo_image.image, type:@user_photo.content_type, disposition: "inline")
  end

  def download_image
    @user_photo = UserPhoto.find params[:id]
    send_data(@user_photo.photo_image.image, type:@user_photo.content_type, disposition: "attachment")
  end

  def get_thumb
    @user_photo = UserPhoto.find params[:id]
    send_data(@user_photo.photo_image.thumb, type:@user_photo.content_type, disposition: "inline")
  end

  def get_icon
    @user_photo = UserPhoto.find params[:id]
    send_data(@user_photo.photo_image.icon, type:@user_photo.content_type, disposition: "inline")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_photo
      @user_photo = UserPhoto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_photo_params
      params.require(:user_photo).permit(:user_id, :file_name, :title, :content_type, :comment, :uploaded_image, :total_size,
                                         photo_image_attributes: [:uploaded_image])
    end
end
