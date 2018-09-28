Spree::Product.class_eval do
  has_and_belongs_to_many :sizes,
    class_name: 'SolidusMultipleSizes::Size',
    foreign_key: 'spree_product_id',
    association_foreign_key: 'size_id'
end