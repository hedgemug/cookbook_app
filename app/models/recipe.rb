class Recipe < ApplicationRecord

  belongs_to :user

  def friendly_prep_time
    hours = prep_time / 60
    minutes = prep_time % 60
    result = ""
    result += "#{hours} hours " if hours > 0
    result += "#{minutes} minutes " if minutes > 0
    result
  end

  def ingredients_list
    ingredients.split(", ")
  end

  def directions_list
    directions.split(", ")
  end

  def friendly_created_at
    created_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def as_json
    {
      id: id,
      title: title,
      ingredients: ingredients_list,
      directions: directions_list,
      created_at: friendly_created_at,
      prep_time: friendly_prep_time
    }
  end

end 