class FavoriteThingsController < ApplicationController
  def index
    matching_favorite_things = FavoriteThing.all

    @list_of_favorite_things = matching_favorite_things.order({ :created_at => :desc })

    render({ :template => "favorite_things/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_favorite_things = FavoriteThing.where({ :id => the_id })

    @the_favorite_thing = matching_favorite_things.at(0)

    render({ :template => "favorite_things/show" })
  end

  def create
    the_favorite_thing = FavoriteThing.new
    the_favorite_thing.user_id = params.fetch("query_user_id")
    the_favorite_thing.category_id = params.fetch("query_category_id")

    if the_favorite_thing.valid?
      the_favorite_thing.save
      redirect_to("/favorite_things", { :notice => "Favorite thing created successfully." })
    else
      redirect_to("/favorite_things", { :alert => the_favorite_thing.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_favorite_thing = FavoriteThing.where({ :id => the_id }).at(0)

    the_favorite_thing.user_id = params.fetch("query_user_id")
    the_favorite_thing.category_id = params.fetch("query_category_id")

    if the_favorite_thing.valid?
      the_favorite_thing.save
      redirect_to("/favorite_things/#{the_favorite_thing.id}", { :notice => "Favorite thing updated successfully."} )
    else
      redirect_to("/favorite_things/#{the_favorite_thing.id}", { :alert => the_favorite_thing.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_favorite_thing = FavoriteThing.where({ :id => the_id }).at(0)

    the_favorite_thing.destroy

    redirect_to("/favorite_things", { :notice => "Favorite thing deleted successfully."} )
  end
end
