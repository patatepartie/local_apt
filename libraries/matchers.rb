if defined?(ChefSpec)
  def add_local_apt_repository(repository_name)
    ChefSpec::Matchers::ResourceMatcher.new(:local_apt_repository, :add, repository_name)
  end

  def update_local_apt_repository(repository_name)
    ChefSpec::Matchers::ResourceMatcher.new(:local_apt_repository, :update, repository_name)
  end

  def remove_local_apt_repository(repository_name)
    ChefSpec::Matchers::ResourceMatcher.new(:local_apt_repository, :remove, repository_name)
  end
end