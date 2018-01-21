module MoviegroupsHelper
    def render_moviegroup_description(moviegroup)
        simple_format(moviegroup.description)
    end
end
