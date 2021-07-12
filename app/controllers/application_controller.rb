class ApplicationController < ActionController::Base
    def blank_square_form
        render({ :template => "calculation_templates/square_form.html.erb"})
    end

    def calculate_square
        # params = {"elephant"=>"42"}
        @num = params.fetch("elephant").to_f
        @square_of_num = @num * @num
        render({ :template => "calculation_templates/square_results.html.erb"})
    end

    def blank_random_form
        render({ :template => "calculation_templates/random_form.html.erb"})
    end

    def pick_random
        @min = params.fetch("pony").to_f
        @max = params.fetch("horse").to_f
        render({ :template => "calculation_templates/pick_random.html.erb"})
    end

end
