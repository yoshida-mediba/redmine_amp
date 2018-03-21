Redmine::Plugin.register :redmine_amp do
  name 'Redmine AMP plugin'
  author 'Hiroki Yoshida'
  description 'AMP generater plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/yoshida-mediba/redmine_amp'
  author_url 'https://aretan.jp'
end

require_dependency 'wiki_controller_patch'
require_dependency 'projects_controller_patch'

Rails.configuration.to_prepare do
  require_dependency 'wiki_controller'
  unless WikiController.included_modules.include? RedmineAmp::WikiControllerPatch
    WikiController.send(:prepend, RedmineAmp::WikiControllerPatch)
  end

  require_dependency 'projects_controller'
  unless ProjectsController.included_modules.include? RedmineAmp::ProjectsControllerPatch
    ProjectsController.send(:prepend, RedmineAmp::ProjectsControllerPatch)
  end
end
