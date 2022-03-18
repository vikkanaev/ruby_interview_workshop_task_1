class Search
  def search(type)
    case type
  	when :job
  	  search_jobs
  	when :user
  	  search_users
  	else
  	  raise 'Unknown search type'
  	end
  end
end
