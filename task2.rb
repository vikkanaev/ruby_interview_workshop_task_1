class Search
  def search(type)
    case type
  	when :job then JobSearch.new.search
  	when :user then JobSearch.new.search
  	else BaseSearch.new.search
  	end
  end
end

class BaseSearch
  def search
    raise NotImplementedError
  end
end

class JobSearch < Search
  def search
    :search_jobs
  end
end

class UserSearch < Search
  def search
    :search_users
  end
end

# Search.new.search(:job)
#  => :search_jobs

# Search.new.search(:user)
#  => :search_jobs

# Search.new.search(:food)
# => NotImplementedError (NotImplementedError)
