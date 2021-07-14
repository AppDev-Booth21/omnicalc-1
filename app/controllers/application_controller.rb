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
   
    def blank_sqroot_form
        render({ :template => "calculation_templates/sqroot_form.html.erb"})
    end

    def calculate_sqroot
        # params = {"antelope"=>"42"}
        @num = params.fetch("antelope").to_f
        @sqroot_of_num = @num ** 0.5
        render({ :template => "calculation_templates/sqroot_results.html.erb"})
    end

    def blank_payment_form
        render({ :template => "calculation_templates/payment_form.html.erb"})
    end

    def calculate_payment     
        @monthly = 12
        @perc = 100
        @pass=1
       
        @apr = params.fetch("rate").to_f
        @years = params.fetch("time").to_i
        @pv = params.fetch("cash").to_f

        @apr1 = @apr.to_s( :percentage, { :precision => 4 })
        @apr2 = @apr / @perc
        @apr3 = @apr2 / @monthly

       @years2 = @years * @monthly

       @pv2 = @pv.to_s (:currency)

       @tophalf = @apr3 * @pv
       @bottomhalf1 = @pass-(@pass + @apr3)**(-@years2)
       # @bottomhalf2 = bottomhalf.to_s( :currency)
       # @bottomhalf2 = bottomhalf1**(-@years)
       # @bottomhalf3 = 1-bottomhalf2
       @payment1 = @tophalf / @bottomhalf1
       @payment2 = @payment1.to_s (:currency)
        render({ :template => "calculation_templates/payment_results.html.erb"})
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
