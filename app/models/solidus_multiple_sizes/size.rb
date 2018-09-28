module SolidusMultipleSizes
  class Size < Spree::Base
    has_and_belongs_to_many :spree_products,
      class_name: 'Spree::Product',
      foreign_key: 'size_id',
      association_foreign_key: 'spree_product_id'
  end
end