ActiveAdmin.register Product do

  permit_params :title, :description, :image, :price, :category_id

end
