class GenerateStylesheets
  #based on http://blog.diatomenterprises.com/custom-stylesheets-dynamically-with-rails-and-sass/
  attr_reader :body, :env, :filename, :scss_file
  
  def initialize(category)
    @filename = "#{category}.scss"
    @scss_file = File.new(scss_file_path, 'w')
    @body = ERB.new(File.read(template_file_path(category))).result(binding)
    @env = Rails.application.assets
  end
  
  def compile
    File.open(scss_file_path, 'w') { |f| f.write(body) }
    
    begin
      scss_file.write generate_css
      scss_file.flush
    ensure
      scss_file.close
      File.delete(scss_file)
    end
  end
  
  def scss_file_path
    @scss_file_path ||= File.join(scss_tmpfile_path, "#{filename}")
  end
  
  def scss_tmpfile_path
    @scss_file_path ||= File.join(Rails.root, 'tmp', 'generated_css')
    unless File.exists?(@scss_file_path)
      FileUtils.mkdir_p(@scss_file_path)
    end
    @scss_file_path
  end
  
  def template_file_path(category)
    @template_file_path ||= File.join(Rails.root, 'app', 'assets', 'stylesheets', "_#{category}_template.scss.erb")
  end
  
  def generate_css
    Sass::Engine.new(asset_source, {
      syntax: :scss, 
      cache: false,
      read_cache: false, 
      style: :compressed
    }).render
  end
  
  def asset_source
    if env.find_asset(filename)
      env.find_asset(filename).source
    else
      env.append_path '/home/ubuntu/rails_projects/bifrost/tmp/generated_css'
      uri = Sprockets::URIUtils.build_asset_uri(scss_file_path)
      asset = Sprockets::UnloadedAsset.new(uri, env)
      debugger
      env.load(asset.uri).source
    end
  end
end
