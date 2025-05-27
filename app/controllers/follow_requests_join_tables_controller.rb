class FollowRequestsJoinTablesController < ApplicationController
  def index
    matching_follow_requests_join_tables = FollowRequestsJoinTable.all

    @list_of_follow_requests_join_tables = matching_follow_requests_join_tables.order({ :created_at => :desc })

    render({ :template => "follow_requests_join_tables/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_follow_requests_join_tables = FollowRequestsJoinTable.where({ :id => the_id })

    @the_follow_requests_join_table = matching_follow_requests_join_tables.at(0)

    render({ :template => "follow_requests_join_tables/show" })
  end

  def create
    the_follow_requests_join_table = FollowRequestsJoinTable.new
    the_follow_requests_join_table.sender_id = params.fetch("query_sender_id")
    the_follow_requests_join_table.recipient_id = params.fetch("query_recipient_id")

    if the_follow_requests_join_table.valid?
      the_follow_requests_join_table.save
      redirect_to("/follow_requests_join_tables", { :notice => "Follow requests join table created successfully." })
    else
      redirect_to("/follow_requests_join_tables", { :alert => the_follow_requests_join_table.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_follow_requests_join_table = FollowRequestsJoinTable.where({ :id => the_id }).at(0)

    the_follow_requests_join_table.sender_id = params.fetch("query_sender_id")
    the_follow_requests_join_table.recipient_id = params.fetch("query_recipient_id")

    if the_follow_requests_join_table.valid?
      the_follow_requests_join_table.save
      redirect_to("/follow_requests_join_tables/#{the_follow_requests_join_table.id}", { :notice => "Follow requests join table updated successfully."} )
    else
      redirect_to("/follow_requests_join_tables/#{the_follow_requests_join_table.id}", { :alert => the_follow_requests_join_table.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_follow_requests_join_table = FollowRequestsJoinTable.where({ :id => the_id }).at(0)

    the_follow_requests_join_table.destroy

    redirect_to("/follow_requests_join_tables", { :notice => "Follow requests join table deleted successfully."} )
  end
end
