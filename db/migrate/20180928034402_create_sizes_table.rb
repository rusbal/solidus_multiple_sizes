class CreateSizesTable < ActiveRecord::Migration[5.2]
  def up
    create_table :sizes do |t|
      t.string :name
      t.string :description, null: true
      t.integer :min
      t.integer :max
      t.string :video, null: true
      t.string :image, null: true
      t.timestamps
    end

    seeder
  end

  def down
    drop_table :sizes
  end

  def seeder
    create('Above Bust')
    create('Ankle')
    create('Around Arms')
    create('Around Bust')
    create('Around the Armholes')
    create('Back Neck Depth')
    create('Below Bust')
    create('Blouse length')
    create('Bust')
    create('Calf')
    create('Chest (Lehnga Choli)')
    create('Collar')
    create('Dress Length')
    create('Front Neck Depth')
    create('Front Neck Depth Salwar')
    create('Full Body Length')
    create('Full Body Length Salwar')
    create('Hip')
    create('Hip Bottom')
    create('Knee')
    create('Neck to Shoulder')
    create('Shoulder')
    create('Sleeve Length')
    create('Thigh')
    create('Upper Waist')
    create('Waist')
    create('Waist Bottom')
    create('Waist to ankle length')
  end

  def create(name, min = 10, max = 200)
    description = name.capitalize + " description"
    SolidusMultipleSizes::Size.create(name: name, description: description, min: min, max: max)
    puts " . size: #{name}"
  end
end
