class Recipe
  @client = Contentful::Client.new(
    space: ENV.fetch('CONTENTFUL_SPACE_ID'),
    access_token: ENV.fetch('CONTENTFUL_ACCESS_TOKEN')
  )

  class << self
    attr_reader :client

    def all
      self.client.entries(content_type: 'recipe').map{ |recipe| Recipe.new(recipe.id) }
    end
  end


  def initialize(id)
    @recipe = self.class.client.entry(id)
  end

  def id
    @recipe.id
  end

  def title
    @recipe.title
  end

  def description
    @recipe.description
  end

  def image_url
    @recipe.photo.url
  end

  def tags
    @recipe.tags.map(&:name) rescue []
  end

  def chef_name
    @recipe.chef.name.strip rescue nil
  end
end
