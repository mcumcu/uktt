module Api
  module V1
    class HeadingsController < ApplicationController
      def show
        @heading = Heading.find(params[:id])

        respond_with @heading
      end
    end
  end
end
