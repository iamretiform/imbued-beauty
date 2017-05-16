ActiveAdmin.register Photo do
  permit_params :image, :image_filename

  config.filters = false

  index do
    column :image_filename

  end

  form do |f|
    f.inputs "Photo" do
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :image_filename
    end
  end

  controller do

    def create
      attrs = params[:image]
      @photo = Photo.new 
      @photo[:image_filename] = attrs[:image].original_filename
      @photo[:image] = attrs[:image].read

      if @photo.save
        redirect_to admin_photo_path(@photo)
      else 
        render :new
      end
    end

    def update
      attrs = permitted_params[:image]

      @photo = Photo.where(id: params[:id]).first!

      @photo[:image_filename] = attrs[:image].original_filename
      @photo[:image] = attrs[:image].read

      if @photo.save
        redirect_to admin_photo_path(@photo)
      else
        render :edit
      end
    end
  end
end