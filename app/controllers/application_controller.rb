class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_random_testimonial


  

  protected

    def get_random_testimonial
      testimonials = Refinery::Testimonials::Testimonial.all
      @random_testimonial = testimonials.sample
    end
end
