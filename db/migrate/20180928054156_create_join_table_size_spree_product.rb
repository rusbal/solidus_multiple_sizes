class CreateJoinTableSizeSpreeProduct < ActiveRecord::Migration[5.2]
  def up
    create_join_table :sizes, :spree_products do |t|
      t.index :spree_product_id
      t.index :size_id
    end

    seeder
  end

  def down
    drop_join_table :sizes, :spree_products
  end

  def seeder
    attach_products size_with_name_sizes
    copy_media
  end

  def copy_media
    return if sample_media_row.nil?

    SolidusMultipleSizes::Size.all.each do |size|
      size.video = sample_media_row.video if size.video.nil?
      size.image = sample_media_row.image if size.image.nil?
      size.save
      puts " . saved media to #{product.name}"
    end
  end

  def attach_products(sizes)
    Spree::Product.all.each do |product|
      next if product.sizes.count > 0

      count = [rand(5), 2].max

      sizes.sample(count).each do |size|
        product.sizes << size
      end
      puts " . attached size to #{product.name}"
    end
  end

  def sample_media_row
    @sample_media_row ||= SolidusMultipleSizes::Size::order('name').where.not(video: [nil, ""]).first
  end

  def size_with_name_sizes
    [
      size_with_name('Above Bust'),
      size_with_name('Ankle'),
      size_with_name('Around Arms'),
      size_with_name('Around Bust'),
      size_with_name('Around the Armholes'),
      size_with_name('Back Neck Depth'),
      size_with_name('Below Bust'),
      size_with_name('Blouse length'),
      size_with_name('Bust'),
      size_with_name('Calf'),
      size_with_name('Chest (Lehnga Choli)'),
      size_with_name('Collar'),
      size_with_name('Dress Length'),
      size_with_name('Front Neck Depth'),
      size_with_name('Front Neck Depth Salwar'),
      size_with_name('Full Body Length'),
      size_with_name('Full Body Length Salwar'),
      size_with_name('Hip'),
      size_with_name('Hip Bottom'),
      size_with_name('Knee'),
      size_with_name('Neck to Shoulder'),
      size_with_name('Shoulder'),
      size_with_name('Sleeve Length'),
      size_with_name('Thigh'),
      size_with_name('Upper Waist'),
      size_with_name('Waist'),
      size_with_name('Waist Bottom'),
      size_with_name('Waist to ankle length')
    ]
  end

  def size_with_name(name)
    SolidusMultipleSizes::Size.where(name: name).first
  end
end
