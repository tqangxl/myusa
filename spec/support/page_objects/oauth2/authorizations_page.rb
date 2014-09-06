
require 'site_prism'

module OAuth2
  class AuthorizedApp < SitePrism::Section
    elements :app_titles, '.panel-title'
    elements :app_scopes, '.col-md-3 label'
    elements :app_scope_sections, 'h2.open'
    element :revoke_access_button, "input[value='Revoke Access']"

    def app_name
      app_titles[0]
    end
  end

  # OAuth2::AuthorizationsPage
  class AuthorizationsPage < SitePrism::Page
    set_url '/oauth/applications'
    set_url_matcher(%r{/oauth/applications})

    sections :apps, AuthorizedApp, '.panel'

    def first_app
      apps[0]
    end

    def first_revoke_button
      first_app.revoke_access_button
    end

    def second_app
      apps[1]
    end

    def second_revoke_button
      second_app.revoke_access_button
    end
  end
end
