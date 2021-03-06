class CreateProductsProducts < ActiveRecord::Migration

  def up
    create_table :refinery_products do |t|
      t.string :name
      t.integer :prod_image_id
      t.integer :prod_pdf_id
      t.text :prod_description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-products"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/products/products"})
    end

    drop_table :refinery_products

  end

end
